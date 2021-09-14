Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F296C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F6DA6112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F6DA6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B0A980F84;
	Tue, 14 Sep 2021 12:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCzo6oHkxtvZ; Tue, 14 Sep 2021 12:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6977480EEC;
	Tue, 14 Sep 2021 12:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417CA1BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3195F80EC9
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3y4S_4mFPbDP for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 12:35:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7484F80EC5
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 12:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F10F8B356; Tue, 14 Sep 2021 12:33:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:28:20 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8f13e35ecc21dbfc46d96e3c9f7a9a8594b618d8
X-Git-Newrev: 4cee4550f6e56952e39552a92306bd549f72c56d
X-Patchwork-Hint: ignore
Message-Id: <20210914123344.8F10F8B356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libxcrypt:
 security bump to version 4.4.25
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cee4550f6e56952e39552a92306bd549f72c56d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- Fix several issues found by Covscan in the testsuite. These include:
  - CWE-170: String not null terminated (STRING_NULL)
  - CWE-188: Reliance on integer endianness (INCOMPATIBLE_CAST)
  - CWE-190: Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
  - CWE-569: Wrong sizeof argument (SIZEOF_MISMATCH)
  - CWE-573: Missing varargs init or cleanup (VARARGS)
  - CWE-687: Argument cannot be negative (NEGATIVE_RETURNS)
- Update hash of LICENSING due to files being updated with:
  https://github.com/besser82/libxcrypt/commit/44e9eb57b462cfbaeb085cea0e308511565f4a12
  https://github.com/besser82/libxcrypt/commit/578271c3776a442fa55ac5f5ea83c7dc83ede979

https://github.com/besser82/libxcrypt/blob/v4.4.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a071bec0a0cd928443223132d47564c90bc64713)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index bf187413e5..e0b96406cc 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3801f0263a8596b15ec466343fc1fdc4ad4ec7416c51e038a3528fd47f3be01a  libxcrypt-4.4.18.tar.gz
-sha256  f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256  caea3d032a46c4855ff818637884c7f5719ad228b79387b62ee023c8fbef17b4  libxcrypt-4.4.25.tar.gz
+sha256  3c1ff7a7c9da111853ada463c54b65b42b7b1d3d6592dd527281db0827331d77  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 3cf0555ac0..4627d21b62 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.18
+LIBXCRYPT_VERSION = 4.4.25
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
