Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3ACC7619A
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 01:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A62410CB;
	Mon,  3 Apr 2023 01:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A62410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgdMRcopZkmQ; Mon,  3 Apr 2023 01:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9224D410D1;
	Mon,  3 Apr 2023 01:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9224D410D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0801BF36C
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D97AF60B65
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97AF60B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-05iIODC8ze for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 01:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1EB860B27
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1EB860B27
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 01:37:31 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 n6-20020a4abd06000000b0053b59893660so4389457oop.0
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 18:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680485850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iRrdjJfadt2XsV+/KSPPEiX+pmB/X6GwVvj4uokCV1w=;
 b=k67+i4Xd6g/FQAdGrDuiLadiJfTEybKOakAYpuAEjv1pprcm79zrTuAZR8qsr3agMY
 qQUJ71LKOiLtsOiyU+i9IKDlZ50pBjFsyNK8Hg2MbGdDcyJu6kT1/haVNXszXtXvDCOS
 9yrxr2A4WgPUbdNltYEUAACO0bXvv+nWPaHZI8Hif5t3fIQm22UQJDvFZnd9zZ3yV9Yt
 CnyfOy9awS6uyTgP9v+wpET1y+J/+fD9JBUID7I6Ioo8OTX9ttCBtxLFU94FqRmLzUEf
 Sa4oPc3x1jYZz0lsrq3+wl2Tpl1EeDDie3A2xoEXTJ3jLXCBrnIB9RVl+9RV0A/oSwII
 wxNw==
X-Gm-Message-State: AO0yUKURB3lepUAGakJsjf7PAOV3WFJp5S1vOWAAme8JIrrXLUqrOUkV
 FW4oTMuPvQqaTmsC8TfEdhvNj0553yQ=
X-Google-Smtp-Source: AK7set8bIQw3U0cT8g/I9PO4C7UAW18fr+cG3/AjuF2JMvsBewUHNOVjM7SFYKqPYvHnzyX4teZuVw==
X-Received: by 2002:a4a:558b:0:b0:525:42c7:9a5f with SMTP id
 e133-20020a4a558b000000b0052542c79a5fmr19609783oob.6.1680485850579; 
 Sun, 02 Apr 2023 18:37:30 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 f204-20020a4a58d5000000b0053b547ebee7sm3471680oob.1.2023.04.02.18.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 18:37:30 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 20:37:19 -0500
Message-Id: <20230403013721.3915-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680485850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iRrdjJfadt2XsV+/KSPPEiX+pmB/X6GwVvj4uokCV1w=;
 b=JHfafB0EBVBM7EoPpTib07hi61DV1fluoR9YCME/dcb0mxrma0Y3rk+rtvHB/Kki2U
 bzQk0+c5LT36jSNyW2ci5aKd98RMzJLH8Zgj4voa5nwhJJGn4rv3xpa2dp6EME5tl+VH
 I+o61r5V4srJXT+yuOVbH3sojcEHUipXVQPnKCrVgzd91b0fsGd/FZ8q7sRtUoaf77k6
 znYQYkstZw1Q2SmMBjySBv9fM3FjqYpym6yZjteCvhMFkcqeggpJ2rw6Va+kRVUCGgpZ
 ln/9VIVIWaO1EViGae+8tDxIJBdmEL7+FbyVXQE3yj0+hUzJSUrxn3BUdZP0C3mmpGNZ
 ZdqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JHfafB0E
Subject: [Buildroot] [PATCH 1/3] docs/manual: rewrite section for upstream
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously, the documentation only requested links to upstream commits
when backporting patches.

Based on a mailing list discussion[0], all patches should provide a link
as evidence the patch has been submitted upstream (when appropriate) so
that the patch gets applied to upstream at some point (hopefully)
reducing the long term maintenance burden within Buildroot.

For patches that are unique to BR and do not apply to the upstream
repository, patches should have a comment explaining why they do not
apply upstream.

[0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666016.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 docs/manual/patch-policy.txt | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 063ef984d8..dc35132ecf 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -144,24 +144,37 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ---------------
 
-=== Integrating patches found on the Web
+=== Additional patch documentation
 
-When integrating a patch of which you are not the author, you have to
-add a few things in the header of the patch itself.
+Ideally, all patches should document an upstream patch or patch submission, when
+applicable, via the +Upstream+ trailer.
 
-Depending on whether the patch has been obtained from the project
-repository itself, or from somewhere on the web, add one of the
-following tags:
+When backporting an upstream patch that has been accepted into mainline, it is
+preferred that the URL to the commit is referenced:
 
 ---------------
-Backported from: <some commit id>
+Upstream: <URL to upstream commit>
 ---------------
 
-or
+If a new issue is identified in Buildroot and upstream is generally affected by 
+the issue (it's not a Buildroot specific issue), users should submit the patch
+upstream and provide a link to that submission when possible:
 
 ---------------
-Fetch from: <some url>
+Upstream: <URL to upstream mailing list submission or merge request>
 ---------------
 
-It is also sensible to add a few words about any changes to the patch
-that may have been necessary.
+Patches that have been submitted but were denied upstream should note that and
+include comments about why the patch is being used despite the upstream status.
+
+Note: in any of the above scenarios, it is also sensible to add a few words
+about any changes to the patch that may have been necessary.
+
+If a patch does not apply upstream then this should be noted with a comment:
+
+---------------
+Upstream: N/A <additional information about why patch is Buildroot specific>
+---------------
+
+Adding this documentation helps streamline the patch review process during
+package version updates.
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
