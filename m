Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E3C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 17:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9540482FCE;
	Wed, 15 Jun 2022 17:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-4om2QILIQp; Wed, 15 Jun 2022 17:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A67C381757;
	Wed, 15 Jun 2022 17:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69A0B1BF300
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583D460D9D
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w94bMH6nzcC5 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 17:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5089F60F9F
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 17:11:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o16so16250699wra.4
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CH7uH0VvTZMZKNI/3kJ0O+5CoxZGgOY6MdntRAzY6EE=;
 b=JvKHWSYBin2TSxZh23M3TYnZKOURCNlRyM/hem3Lnt7qNKkHyQAW6TNtG5N8aXgI6v
 14bigeYqBTHyhE3kpHwancAcsq9LR2X1vij5+Y1yQ6+jbGO4u01k6S/ibYidLbaPYfpV
 J2go1Po4xo6B+HjHvEpA8NgOgJ/OxdxJIy5ou4mzBoxNeNVRZVCZ53ntAhtRjZD9f3ps
 Ejk3M2jACNYcGdNmr+qhOzxb6/e45aTU8/CzTVG/iWApvwkAVSz0VASa9Ublm/GYCfFv
 no+15jqEMSEQM76/QWOQAyDCwrOidoXXNgdI2DWN+6JaP2PtvWulbLQcQv7adN/YyibM
 NG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CH7uH0VvTZMZKNI/3kJ0O+5CoxZGgOY6MdntRAzY6EE=;
 b=HTFz0SVkPwnxYuUwaADeA/+5ZgoeN7NiOSr/417mkaKTJKWhAW1DvSXQyWFDHs4TRi
 Y+n7XAkTdz0EkHsscGix90FinaVSLTotMsm6R1gBslNsfZ8qU2BbJRH0unJp2pF02BRE
 4mqlsjp+cpD/volQT+aNC6NI3FmLt0fuUXopoqukRfB5jK34RipZRF1IhnHqdud5TSe9
 skHMzCGL+gkk4FbE7hxc0ihZIRTdcYVE9qrHKdfiF8P2anlyh1x23KAAwv5C1fTkWBMB
 I9VzPPWfp0xcjpgGX+tpKWvKKX0J9mfYyTgu1djiDxSwor5eyfzvlMMywwuOSXrJPsN1
 tvYA==
X-Gm-Message-State: AJIora9JL3CVL68TVKcZSykfwh9am+7T9+9OmTFeY2Ypei3FGc7oGIHj
 hF9BzVHuOmo1K+84740VFiqxOZD0b7o=
X-Google-Smtp-Source: AGRyM1tI9eKp5oj9EAxlX7R2HnO027CGqLLBgXxk7qFq+VPB9R7dKfIQxf/88/NmXlnAbyDHhB22Ww==
X-Received: by 2002:a05:6000:703:b0:210:3141:c20d with SMTP id
 bs3-20020a056000070300b002103141c20dmr788112wrb.488.1655313101986; 
 Wed, 15 Jun 2022 10:11:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c47c500b0039746638d6esm2758357wmo.33.2022.06.15.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:11:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 19:08:54 +0200
Message-Id: <20220615170854.3997869-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix patchwork URL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://patchwork.buildroot.org is redirecting to
https://bugs.busybox.net so replace it by
https://patchwork.ozlabs.org/project/buildroot/list/ as already done in
docs/website/contribute.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/contribute.txt | 18 +++++++++++-------
 docs/manual/resources.txt  |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index bf2aed6b51..e588c69be6 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -418,7 +418,8 @@ editing the commit message. Below the +Signed-off-by+ section, add
 +---+ and your changelog.
 
 Although the changelog will be visible for the reviewers in the mail
-thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
+thread, as well as in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork], +git+
 will automatically ignores lines below +---+ when the patch will be
 merged. This is the intended behavior: the changelog is not meant to
 be preserved forever in the +git+ history of the project.
@@ -470,19 +471,22 @@ $ git format-patch -v4 -M -s -o outgoing origin/master
 ---------------------
 
 When you provide a new version of a patch, please mark the old one as
-superseded in http://patchwork.buildroot.org[patchwork]. You need to
-create an account on http://patchwork.buildroot.org[patchwork] to be
+superseded in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. You
+need to create an account on
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] to be
 able to modify the status of your patches. Note that you can only change
 the status of patches you submitted yourself, which means the email
-address you register in http://patchwork.buildroot.org[patchwork] should
+address you register in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
 match the one you use for sending patches to the mailing list.
 
 You can also add the +--in-reply-to <message-id>+ option when
 submitting a patch to the mailing list. The id of the mail to reply to
 can be found under the "Message Id" tag on
-http://patchwork.buildroot.org[patchwork].  The advantage of
-*in-reply-to* is that patchwork will automatically mark the previous
-version of the patch as superseded.
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
+advantage of *in-reply-to* is that patchwork will automatically mark
+the previous version of the patch as superseded.
 
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index e90a49b2ab..68b7eb9062 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -68,4 +68,4 @@ review comments in a clean and concise web interface, it can be useful
 for all Buildroot developers.
 +
 The Buildroot patch management interface is available at
-http://patchwork.buildroot.org[].
+https://patchwork.ozlabs.org/project/buildroot/list/[].
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
