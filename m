Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12848FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EA440704;
	Sat,  3 Jan 2026 11:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6SVImY46kdz; Sat,  3 Jan 2026 11:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA79B406F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767438583;
	bh=ASpupET0QtpjLM8xeqfOlygH5hG6SQQkzl1e98rb7Ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J7IBARnd4yTbnfxiA9x13o6nwDqFaFYmPBJ6rbog5aPnhvrninJtnPxtJEMV58aSP
	 Dx8ZEBjbk4k3hf9CNzFICoNuJOSsmgO20PhUK6lvqV6u92KfT+UKFKyeWwHaxDoHo1
	 3tIs0GeLAEkSr7/qSFSTKhloa+ykhxQTBn7R//jVX1zbYL4ESw/xHqoMHeGl7ZWxPF
	 ylV4i/Mqs0qvJ3tvYd9twg2hQvn8TuR0ftSTPveLU7dWIgJ9pk4J3WgtUNvMeJcdUJ
	 QbapqoWLC4fKnwh7SoB5J9Dexqbnch4kHwinj3m5ZlHrzLCd/oUFlN+qIf8z36t4UE
	 otifNY1r4AzSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA79B406F0;
	Sat,  3 Jan 2026 11:09:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84CF5351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE9781E98
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mp7yL8Xiyv1T for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A96881E95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A96881E95
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3804587F1A; Sat,  3 Jan 2026 11:09:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 11:56:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ed41994e4aa47b0f37dacab19fe01c8ce27b042
X-Git-Newrev: 71a35f9ca7353517d7446250d9b5d4159ab4a570
X-Patchwork-Hint: ignore
Message-Id: <20260103110941.3804587F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-collections: bump to
 version 5.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71a35f9ca7353517d7446250d9b5d4159ab4a570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.collections/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.collections/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jaraco-collections/python-jaraco-collections.hash | 6 +++---
 package/python-jaraco-collections/python-jaraco-collections.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
index d3d6742f0b..2ee4ba439f 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.hash
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
-md5  33a136eb3dd4c36090270ea2d4d43e7c  jaraco_collections-5.1.0.tar.gz
-sha256  0e4829409d39ad18a40aa6754fee2767f4d9730c4ba66dc9df89f1d2756994c2  jaraco_collections-5.1.0.tar.gz
+md5  57529f8464fb77efaf0398c4395dfca9  jaraco_collections-5.2.1.tar.gz
+sha256  dab81970bad6f0ab53b20745f1b01da37926e4c0fcd425046aa45e0d8efa18ed  jaraco_collections-5.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
index 3414799f44..fe6dcea074 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.mk
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_COLLECTIONS_VERSION = 5.1.0
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.2.1
 PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco_collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
-PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/8c/ed/3f0ef2bcf765b5a3d58ecad8d825874a3af1e792fa89f89ad79f090a4ccc
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/fa/d2/751000cf702676dbb78f97728f4d52b029e817e2b3c94088dfe5c70ff46d
 PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
 PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
 PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
-PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
