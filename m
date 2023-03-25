Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14C7C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 18:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF3B81ED8;
	Sat, 25 Mar 2023 18:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF3B81ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JAPgqoF3UwJL; Sat, 25 Mar 2023 18:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D38A81EF2;
	Sat, 25 Mar 2023 18:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D38A81EF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884051BF2C0
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 18:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F11740298
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 18:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F11740298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qI23OKMNrBf for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 18:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16CE440141
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16CE440141
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 18:20:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.92]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1ps0yo1Jw5-00NOvQ; Sat, 25
 Mar 2023 19:19:59 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 19:19:58 +0100
Message-Id: <20230325181958.25542-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:mNyvfCp0nc71ky8BdKl+ofqn33MTAa4UW4VjuWd/bF/IxuEMQzS
 dKmUcudW+Br7ekmU+QJedv325KmEwbzQFSBy6M75HwKfKnTcHv+CzDKriJJobU+Ae26PO00
 tAqt5yUkv1DpHWZGL8AMHgjCRYqJhiRPbTUnRP3zfXYQBoHOuHDPbC2MWQ/uNNMREoe4KbI
 oFTa95BYRLPco4ETxPUlg==
UI-OutboundReport: notjunk:1;M01:P0:DSJBW1mc/E8=;wKPbotDxHHRb/1fSNg2a+jss1eA
 ivDVeqaU/SxWEJKiIljBALY0TO6tAS530/xdwdpHCMknU0nusdRcnnJwFQdgfLF7khP+Tq3Z+
 n2EJB8JE26XpZTrlIJmMK5F1DipF1e8RYzqTnZzmJuxttJ2zNXHbx2UoyB2s5o390RBPi02Wl
 Ga4efGe1wbEcWkNkUNY+wTfSFQN5eVIlQhxxELpDOFPuF4K6Prwfs3fWexcFTgohiUaI/YL4B
 KZtpwaCTFW25uTBrqutubqtk2HxJ6hVUztmGhkE8ylhyJiXvNrzkRg0z07qkbhwDl/Ms4OTcw
 lnr6uBvLK4Ep85zsekvKWy4wSlrKSKzehgObL4EqZzfFwnYbJ+QSteeCuRjmVN+OY7cil7mub
 vBrZn9gg2MY+foikUZIpdtD7FxiLVmQSgsg/wB+Urpp9KTlRIOK0Clx8Ay5LjQK+zUW8wpuKV
 /zYnUPVaj757U6bHdbpfQeqz/le9HA/jmjvuh5c0OVTnTgr5NMbwUn9rRBlc1+HY+Zs6ryEjb
 EUQwTNIPIj+ISZeAgf7iUmHrGnu3Ldz9hKMyQz5wD8INNCFGi9A0vTyczqXeDpODo6MYQoh7X
 3Gji+UzuiFHJAHgsx8oYU+wXMfAeivl9iLwqjSBokjk95k9CJXgerVwVaO9fEHoZjN1SvpzDj
 jlmByE5t1ZuyEGelDc4bSq4C2Y26nYP8JPeKgjTAIvT+vS1xyPzS3Ie6xwD+4AObDqd8Nymil
 IbQ+OSL9EWWznJaqP7tji/51If4fgC5EEYNbMdLobogHiKsqhaJflP/j8pbUxjjMuOqip/gKE
 hXZ20ydt/IGZ1xaV4tq37eiZDFdUrMh39yTwCzwoIEVwwQHIQ8v2YwDyBCCxt4snEXS6qaj8y
 LV1XVfxpGbc0liRUpaBfNlOTedsQ7UmDd893e0WX79e322DOxXBqI4I8Aad5rzwuCUBK1xAqN
 /jVbzHGg909SubmI0CWGvdHYVZ0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679768399; i=ps.report@gmx.net;
 bh=ZWO4a230EHxL07xO62YrxskKnU4a4q5kyIdainoVT/Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ze37NsYYosTDymwzN4SH7QXdmldASK++73ByOiPvK6Bm3P9EKBRtWrUdG3FUou11Y
 eFr3KJXTWjfWAeKp88qA7sLVPEqpOr3TRSAr2UXMo7x+iWvoox4TegElBQo9Vpg0el
 c0+2n6MYPxA3ZWDSnsZ+r3bm/F+DNsgJCsvbJJ9tvJ//h79gQ/pGslqW76jT+b2A+l
 /4r917TAgbK5NBw7KYM3ZBFpKxVWRT8p4vMS0k+QFHFx7R8fi7I2C/vE+aLnuBADDS
 DQ0zyintFoU16AeQAuMkBQu+iErVjUlgoHqzeTY6EvwAIOBW/8k5YCLDedUpJnd0ov
 5yAOhCpV5CWmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ze37NsYY
Subject: [Buildroot] [PATCH v1] package/libcurl: disable NTLM support
 definitely
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- do not only disable NTLM delegation to winbinds ntlm_auth but
  disable NTLM support overall (and drop enforced libopenssl DES
  dependency introduced by 'package/libcurl: make sure openssl
  supports DES' (commit f25c820a4f93ad0ca7eaf5e504667bd4099b878c)
- change man page hint to https URL
- rearrange configure options to one option per line

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Patch works for libcurl-7.88.1 and libcurl-8.0.1
---
 package/libcurl/Config.in  |  1 -
 package/libcurl/libcurl.mk | 21 ++++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 218309ed56..adab1ca3e6 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -57,7 +57,6 @@ choice
 config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "BearSSL"
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1a1594a45e..1ff0ecc004 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -16,15 +16,22 @@ LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
-# We disable NTLM support because it uses fork(), which doesn't work
-# on non-MMU platforms. Moreover, this authentication method is
-# probably almost never used. See
-# http://curl.se/docs/manpage.html#--ntlm.
+# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
+# support because it uses fork(), which doesn't work on non-MMU platforms.
+# Moreover, this authentication method is probably almost never used (see
+# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
+#
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
-LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-	--with-random=/dev/urandom --disable-curldebug \
-	--disable-libcurl-option --disable-ldap --disable-ldaps
+LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm \
+	--disable-ntlm-wb \
+	--with-random=/dev/urandom \
+	--disable-curldebug \
+	--disable-libcurl-option \
+	--disable-ldap \
+	--disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
