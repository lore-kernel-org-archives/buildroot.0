Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17824D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 14:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73B36067B;
	Sun, 14 Dec 2025 14:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDwVzb_uqher; Sun, 14 Dec 2025 14:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D5A607AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765723695;
	bh=Elt0cizDcWBQ4Abv1eFMqoK1F/79X9ZIlMNoU2VoQ6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nrehMv3xH77AxQAQVx8sPsaF3W1uSeJSEujhPubB0awynX/zhwSHZvk0oTf7mpoRr
	 oKFR0cZpW5GM4aFZiatasPuxXO4nn7/sSkMK2eIlyDYgrGlsYw8YIS1W0GXG3Hme3S
	 VCEkBueEeHs3PDkfugnZuyGzgW2JEvu1RxvEiwIyHCPYxzZz5hHdxjmJBFxsek8+1E
	 D0N5XQpCf+Fhk1YorEt70hG9jfCO67QCrEYdmqsgW4Xi6JLM0U/fJrSxluuvteFLYP
	 mv2M0mD8y4Edjjo+BYYEBpUtu9pLT0aHIO9P1Ihg1m4to7V9nrHGrs3CZplXe/VVp1
	 Mpxq2RYbYCUXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D5A607AB;
	Sun, 14 Dec 2025 14:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C823117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C42607AB
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyIqtq_Te8Be for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 14:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3FA36067B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3FA36067B
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F033186DE4; Sun, 14 Dec 2025 14:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 15:22:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97e2f63bdf4cc992787c570b17b099c41c5535d2
X-Git-Newrev: bba86304b0ac4ae266cfb52e54a239b0850b10ca
X-Patchwork-Hint: ignore
Message-Id: <20251214144812.F033186DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: select host-openssl for all
 architectures when building latest version
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

commit: https://git.buildroot.net/buildroot/commit/?id=bba86304b0ac4ae266cfb52e54a239b0850b10ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since at least Linux 6.16, but possibly earlier, host-openssl is now
needed on the vast majority of CPU architectures.

A common reason to require host-openssl in the Kernel is to enable
Wireless Networking. This is now enabled in most defconfigs.

- When enabling CONFIG_NET [1]
- CONFIG_WIRELESS is enabled by default [2]
- For Wireless, CONFIG_CFG80211 is commonly enabled too [3]
- CONFIG_CFG80211_REQUIRE_SIGNED_REGDB is enabled by default
  which selects SYSTEM_DATA_VERIFICATION [4]
- CONFIG_SYSTEM_DATA_VERIFICATION
  select SYSTEM_TRUSTED_KEYRING [5]
- CONFIG_SYSTEM_TRUSTED_KEYRING adds system_certificates.o
  which needs x509_certificate_list and extract-cert [6]
- and finally, extract-cert uses host-openssl [7]

Even if some architecture defconfigs (such as m68k) are not directly
enabling CONFIG_CFG80211 in the Kernel, there is still chances for
this option to be enabled by Kernel configuration fixups of selected
Buildroot package. This situation can happen in Buildroot
autobuilders.

Also, in some specific cases, host-openssl might be needed for
some other reasons (e.g. s390 arch defconfig enables
SYSTEM_DATA_VERIFICATION which ends up the same way).

Indeed, in order to fix build issues, we would have to add: armeb,
microblaze, loongarch, m68k, mips, mipsel, mips64, mips64el, powerpc,
powerpc64, powerpc64el, riscv, s390, and possibly others.

So intead, when "latest kernel" is used with the default architecture
configuration, always select host-openssl independently of the
selected architectures.

Fixes:

  https://autobuild.buildroot.net/results/9a314e759f7640d760003e46f86153300478ec60/ (mipsel)
  https://autobuild.buildroot.net/results/3bcc674ea5a7cdf031200b0cd2f9f71400ba391c/ (mips64el)
  https://autobuild.buildroot.net/results/b24983fd91f408de56479b7d7d57fc9fd3333d7d/ (s390)
  https://autobuild.buildroot.net/results/b262fc6f67a9fed55faffcdd580d89f4664e1e16/ (powerpc64)
  https://autobuild.buildroot.net/results/45da1538457b18671fa18efe3e1aa57a15561370/ (m68k)
  https://autobuild.buildroot.net/results/0a457375d2509f1b29a449dfa50f29fc7e56e568/ (armeb)
  https://autobuild.buildroot.net/results/814ca5f048827a635dea0199878fa82d5012b649/ (loongarch64)
  https://autobuild.buildroot.net/results/b684d0b37e5187aa9b31693356f8515857d19f7a/ (microblaze)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/net/Kconfig?h=v6.18.1#n6
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/net/Kconfig?h=v6.18.1#n428
[3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/net/wireless/Kconfig?h=v6.18.1#n17
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/net/wireless/Kconfig?h=v6.18.1#n89
[5] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/init/Kconfig?h=v6.18.1#n2063
[6] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/certs/Makefile?h=v6.18.1#n6
[7] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/certs/extract-cert.c?h=v6.18.1#n21

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e7dc576509..c8d93a72d4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -175,13 +175,11 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
 
 config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
-	# We know that the default configuration on some architectures
+	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || \
-	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
+	       BR2_LINUX_KERNEL_LATEST_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
