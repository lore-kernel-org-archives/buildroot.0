Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DDBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 21:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5180641C42;
	Fri, 25 Mar 2022 21:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPauzTPDaiP4; Fri, 25 Mar 2022 21:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670BD41B8A;
	Fri, 25 Mar 2022 21:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1A691BF380
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0A0B41B8A
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTlFK1AcTnv7 for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 21:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5430F41B7B
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 21:30:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r64so5127210wmr.4
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFfvEp7wAhQkhabtaAgoVlFVj4f0JEUB2L4p+htKNPs=;
 b=NKIbldm6X0hF+C5906tmPfp1xAE6i6QH9u6iQ4DP1LCAtCJ9quELz/2Fe7FKKa3Far
 pgpBXMyo9yzDOlJjM5Otrs1mcxDfPk9P5xhYqt+lcM4OGOYiYTtsJ1x0Y2aeyi4EhFYv
 hq67ZacvzNMbcaoHFzUKIn8QXXXe5DRJAPd8+id0vwe3QmFSYYCU+FL1Nufs1TdRPqT3
 ks9JXCP1ozoUfocXtWo34DDrekWnMGOiVh88F6vIKtxv3baZYH54ifv9Uc85NLY9Kpmm
 3r3a19zw6XSK0keCh6uSe6vAhK3DiB1+ns6yFF7AsgeojBzZYsApqJ91D5Q1/ECLXP6t
 lwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFfvEp7wAhQkhabtaAgoVlFVj4f0JEUB2L4p+htKNPs=;
 b=6uyhHNw4otak7sVboBFkVsmkY/RrH5sWjOUWWwDvHdybnnORdL8KtoAqu3XltCYa+C
 Agtcs11XR9o450z70Cv4iSEjc8XMoWcgqiEKNcBpheZJ5M3NjRE9rah/sdvDH185TSQz
 ssghmw5WeMD0u/WZvgCK7OcJb00/Nsrh6oE6SbDNQYeNtz1V/2BVyKIg5HdX0NncfnCC
 leu8EXw/0NI0rrHV4CkAo4u3uGfEPAJxaS5hK2ZOWGGauj1HolDwqkYhXMRMGweIRC6j
 8uogsirPI4oSg5V80sLRS8nVduy36w87eiOHnqTUJOEi1Pa/RtNBEj+TVndHjgKuY6MO
 5bug==
X-Gm-Message-State: AOAM531aVr1ZpQjtFwREhP+K1HK4Chnx/+JhIGpBXnSiwEFmhYyo3gba
 HKp2LlEWPojBLkyrmJLC2+YIM90/lSA=
X-Google-Smtp-Source: ABdhPJwPUgZVpBYck+3sWh78lGEGBKaE5sNyPDOxWvEb8J2vB/Vbq2IkxrpxxuTs23h33To1Saz7YA==
X-Received: by 2002:a1c:cc01:0:b0:37b:dcc8:7dfd with SMTP id
 h1-20020a1ccc01000000b0037bdcc87dfdmr11899319wmb.134.1648243813251; 
 Fri, 25 Mar 2022 14:30:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0038cba2f88c0sm11149499wms.26.2022.03.25.14.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 14:30:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 22:28:52 +0100
Message-Id: <20220325212852.713531-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.2.2
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://frrouting.org/release/8.2.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-configure.ac-fix-enable_bmp-typo.patch | 29 -----------------
 ...-lib-fix-elf_py-TLS-section-handling.patch | 31 -------------------
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            |  2 +-
 4 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
 delete mode 100644 package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch

diff --git a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
deleted file mode 100644
index c8ce500dfc..0000000000
--- a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bacabf2476553d0e873b827359e1c8a4216c2f8c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 16 Dec 2021 20:10:26 +0100
-Subject: [PATCH] configure.ac: fix enable_bmp typo
-
-enable_bmp doesn't exist, use enable_bgp_bmp
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FRRouting/frr/pull/10236]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1bcc42ef8..c7a5f1286 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1806,7 +1806,7 @@ if test "$enable_bgp_vnc" != "no";then
- fi
- 
- bgpd_bmp=false
--case "${enable_bmp}" in
-+case "${enable_bgp_bmp}" in
-   no)
-     ;;
-   yes)
--- 
-2.33.0
-
diff --git a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
deleted file mode 100644
index d491cb1a7d..0000000000
--- a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3942ee1f7bc754dd0dd9ae79f89d0f2635be334f Mon Sep 17 00:00:00 2001
-From: David Lamparter <equinox@opensourcerouting.org>
-Date: Wed, 10 Nov 2021 15:30:07 +0100
-Subject: [PATCH] lib: fix elf_py TLS section handling
-
-... need to ignore TLS sections, their address is effectively
-meaningless but can overlap other sections we actually need to access.
-
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
-
-[Retrieved from:
-https://github.com/FRRouting/frr/commit/3942ee1f7bc754dd0dd9ae79f89d0f2635be334f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/elf_py.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/elf_py.c b/lib/elf_py.c
-index 1c306893ad8..f230add6957 100644
---- a/lib/elf_py.c
-+++ b/lib/elf_py.c
-@@ -636,6 +636,9 @@ static Elf_Scn *elf_find_addr(struct elffile *ef, uint64_t addr, size_t *idx)
- 		Elf_Scn *scn = elf_getscn(ef->elf, i);
- 		GElf_Shdr _shdr, *shdr = gelf_getshdr(scn, &_shdr);
- 
-+		/* virtual address is kinda meaningless for TLS sections */
-+		if (shdr->sh_flags & SHF_TLS)
-+			continue;
- 		if (addr < shdr->sh_addr ||
- 		    addr >= shdr->sh_addr + shdr->sh_size)
- 			continue;
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index bb6c32b7bb..9bb2b75b8f 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
+sha256  33e974e2a622618e139983f65d93e92e7f1a735936ef18b18244403b15be002f  frr-8.2.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 0e6ab7a815..aa36387a3a 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.1
+FRR_VERSION = 8.2.2
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
