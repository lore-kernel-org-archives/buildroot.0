Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCBCC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F0761104
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3F0761104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAEC083AC1;
	Fri,  6 Aug 2021 21:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkgdpXCI-PWz; Fri,  6 Aug 2021 21:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1141783ABD;
	Fri,  6 Aug 2021 21:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCDE1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F983402C6
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwOdg3SGCA-Q for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 652B4401CF
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A39B78C9AF; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 21:52:54 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 36de16d66766cef1174a1f5bb1d02c60a3f651de
X-Git-Newrev: 2d8ba74fe3172395c4a62f1afb79c3eac6abd7e6
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.A39B78C9AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libkrb5: security
 bump to version 1.18.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2d8ba74fe3172395c4a62f1afb79c3eac6abd7e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- Fix a denial of service attack against the KDC encrypted challenge
  code [CVE-2021-36222].
- Fix a memory leak when gss_inquire_cred() is called without a
  credential handle.
- Update indentation in hash file (two spaces)
- Update hash of NOTICE (update in year:
  https://github.com/krb5/krb5/commit/9cbfdf65e1718849cb03844d65930e5138e88195)

https://web.mit.edu/kerberos/krb5-1.18/krb5-1.18.4.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b65220f56677c0df2646a6d56c9b3e28732dc054)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index e5b24a3f70..860f828793 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719  krb5-1.18.3.tar.gz
+sha256  66085e2f594751e77e82e0dbf7bbc344320fb48a9df2a633cfdd8f7d6da99fc8  krb5-1.18.4.tar.gz
 
 # Hash for license file:
-sha256	b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d  NOTICE
+sha256  7fba8b076bdc2cfef1d0813c5d4067d76d5be60c32d84de22d5d1cf451744feb  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 794cedd33c..89f219d913 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.18
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).4
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
