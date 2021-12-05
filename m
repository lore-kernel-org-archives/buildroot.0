Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2238EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B0440577;
	Sun,  5 Dec 2021 10:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duQFL0Fq-rvw; Sun,  5 Dec 2021 10:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FD24055A;
	Sun,  5 Dec 2021 10:55:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528FB1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB69382B2F
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNR_0j2HrjGl for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:54:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1BEE827D2
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:54:36 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id y5so14099863ual.7
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lU/9/PlLY9nTw1UGBkn/gjvNWkiHMnq7BYl5W3Ic7Bs=;
 b=G4ACO6l9WRZlvjsZoObXujYg4iuclyk9GEuWMfH6H3Sfiq0VRwrXNq8SF1/ePqM/Ru
 TpJkKCk46RTQrobughtWXDm85Mxt6hWgTbWgTAw44H7etddcYREn0vuXobIIax20hd0J
 bFbaUcqSfnBZ0f4v0TtaxfO/JZlVm55VSKWRx9v3thNav0XpyGVcOrYS26wd5L4ubqG7
 pjhVLwGMKYVTT6KHsReQzn3hOsLkVl0/9ALkIfRPHdrLSGIU8gSeSeeCoUtAEuC1PN2g
 9H7g2loikJigKlMDPokPnIxPcEQDinb+VDVAzTkD/UAz6KwE+YbpSACrvhvfe3/wwgXK
 UO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lU/9/PlLY9nTw1UGBkn/gjvNWkiHMnq7BYl5W3Ic7Bs=;
 b=G9weHTP4mxNmGfjR4CryhFAZdZsfOek7lusK0NMdmELH1wJW7WF7113Er6fnsln5qP
 Sry01nm5cPXF1cRw8UTn6MoZDqePfvgwWmUHZkM0T61+jNJrrjJMzu2MT6mUNsK1U7cO
 doo2wwzMTJh4p2m7VFLQDwORJUkD7OsGc2OCI1upeFYDoJnScbWr5IhSOk5KnBEP+kri
 v8vNXKfaGUoHe+OHUYaJZVUIHVKro9d42gEUTNcV4vtMnmSj5ng/BvZG78IK6mdzLGHb
 K4jUNRK9/a1ciqQL0PBd8Gj54iSfRV5+47fPlonYJQiKwr2LHscUgSoWU7zwcOwDIYNK
 hY+Q==
X-Gm-Message-State: AOAM531trTXD8Y0Zzl1a18uCVVgR9/jOHH83n2GVktI6rVI0gOLGv0Hk
 i3B5uM1UOsNPTm1bicxXVlxnLoeSC+8=
X-Google-Smtp-Source: ABdhPJzkngazk/i80p8yA+pW+KOF6xPMfm6Vkleg1Pjnv8lmV3ZSFNetlBqHrpgPkKHOjRGILz2sIw==
X-Received: by 2002:a67:6087:: with SMTP id u129mr29221041vsb.58.1638701675767; 
 Sun, 05 Dec 2021 02:54:35 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id n27sm2417081uab.5.2021.12.05.02.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:54:35 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 07:53:17 -0300
Message-Id: <20211205105318.2755542-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
References: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next 3/4] utils/checkpackagelib: run unit tests
 on GitLab CI
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

... so we can catch regressions on check-package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
DO NOT APPLY before applying the patch before, generating a new docker
image, uploading it, and updating the image name in the .gitlab-ci.yml
---
 support/misc/gitlab-ci.yml.in          | 4 ++++
 support/scripts/generate-gitlab-ci-yml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index be7951b3d2..47e72c3213 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,7 @@
+.check-check-package_base:
+    script:
+        - python3 -m pytest -v utils/checkpackagelib/
+
 .check-DEVELOPERS_base:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 7d09279bbd..bb023d8ed2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( DEVELOPERS flake8 package )
+    basics=( check-package DEVELOPERS flake8 package )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
