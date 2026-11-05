Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF7606EEAF
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479DB81144;
	Thu,  5 Nov 2026 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xV3NyGCV2QZ5; Thu,  5 Nov 2026 20:38:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AEAF58116A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793911101;
	b=I9NrcdY0C+ke0IVt+SQAvz38THnWBEeJYzlIJ/aTvp/dwDE/xZfKX/mzhSTlMkXJT46D
	 ujC+MTa8Pwy44ARRYPGyBcj9FXEry9ExNdaRUKqZDMD12abbs0RbzOKhw6V/q1ognYP/R
	 G9/rCiKZw8gL//AjMJdzOfzBTJ8JXELW9xULF5FxGHedX4aznQcwIB4R7PMkdFsnhGzt8
	 D+fsEPmRLSpa3XdDxcBpgL4/aXvmrBYDbviaIsUVed7JU6oJA0NqkW3R9nBtSwtGz0iuV
	 z69tRoWeNht75P1GfNCqxl7bIBRxJ6giLtwIxc9nvWWSbnJjOittuTR0fI4KqZal5EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793911101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a+Qtzd88cyBvPltobo2YZPN7StBVyV0qvB2GbTZLVPc=;
	b=C/gKpctz6iVTCnK02LIVmtQuB3HXbfOePrk65gldkr5LjkUiUE2JrB1qhL1IdRPmG4Ls
	 0NEZ+jUDAwMkXGK6mGWmr1/65FKoJ/TahvXDvgSVh1r5202YIC0aWt35wDfLSnzMDcbo1
	 RdGD0vxFKw1YwhO6cjwAjsznL8dAN15Rs3wc3uSe7oDwExcl3YPlc6HGphJh8o0XbxdCD
	 YvJ9gUf1WkCgRsNc9Xf+Jms5d4v091lYB9hGNaxGqjG6V8cbdHIZpl6k7bJSLXamkh7W6
	 4ehY8nuKy10bn09Oltz5YIyPJc7JKgf75DDy7gRGIXrwl05rerBkqND0KV09kaMB/nA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793911101;
	bh=a+Qtzd88cyBvPltobo2YZPN7StBVyV0qvB2GbTZLVPc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UFmwvTPkEcmTdvss25hpCtexAOIcBQ3AnfnSKFYxVHw55bZYLa70ZgH8IwXLFUuqg
	 Mwml88oEJ5vhBoQqlFLDmIAjWr295hAsZf8fBelS7GR42j0aq3+TTBw0isr/yRwsD+
	 ULUpxf7qdYqcyciAdAAOjQ8NVw6L9gz9KoBZ0jlnJ5tBfjnhn7jirzWAFGULWbAfDU
	 M2L0lAcGvja7/K39ASQJFwxHQKW+2SaRmA6HFL5sgP0C3OjhfKJGNa2P0lMCpntXE9
	 DDf+LSFiCqCfWOfrba4sK/FMSMFOYDzp6lkb/jDSCd5/LZfysF9gLNvQJQjKh/Wy/D
	 tZYP9TkUnsMrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAF58116A;
	Thu,  5 Nov 2026 20:38:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B279DF07
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A73354010C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0jwWxstLNNJ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 20:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 29D2A40012
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Y6nCWhqu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29D2A40012
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793911093;
 bh=uweuwUxK0zeRfbg4uvLo/QMcpvuCeEh1NC0V04CZDAc=;
 h=From:To:Cc:Subject:Date:From;
 b=Y6nCWhqutC63Y56UO1jfuMXmMohB5JBs+V0lJO4Ngy9XKYyvTvrRdD7uSQNnAi3z5
 Ul+/C0roCqKX8KE+ow5EVfWqfAUMbEAXDT491tC9gBoVvZsW98vv2pNnSfrMciiuh8
 3SWAzc7FhVQ37766dQ5CaSpvVPpHpL6Qj2dV10GfmFy7M4oOzkuW26EQo92Gd6XbVn
 SAgKOBa14cq4fBExK09egnDQ8QO+2Pk0iPytgUVJOuAIlZFz/9k6U4AU3hRvtL6MMm
 T+fq40PYbitj13h43rnk5+EFXJ+/aQW1aMrCjabX0JLnFGDR4smwNCYxk40beS5prU
 Cf9OqSx5KYUKA==
X-KAS-Sym: v3:f51bdf72230551df:WRmMFzXk8NFQ0hd4QIwhSMW66PXB6IwY/k/j7kJXa8DeN
 YzGILkCVxdzRf2XESliKR3Y8+HCnk/bSUPmmWQj6oVJI0YL6YNE50XdhsZ9kGqVZ+lQ4fVNSGam
 AkxVOo3yZ09ZlUWENUKi1K+DmMD3jVKzOQiKd3jh3tEYYQL8ApXarPOE8Mf61oDmSPaLtObdxlC
 sSuM+y1+Yf6pVisdraaBxkVrZOGJG3ajbF56wJDdVRRUznFrzRwbG0BLK/nnoEV5sqojroA8Qvd
 /PbXvBG6BBjFUdOvmAKpWCl5dhW8J2YYV2bJxBBfgs2CjFRY5zCigIlzWMCWp8isvsAb9bVA==:
 uvCWvZcvX7RgiWgAF2Xj9mtSNaEi9jxaN1Wmvwbwy/dk3RDqgt/lVbvo/ffXDzNA6Hmag1fF/OG
 NDPyO+m2mPfDD31w0F9k08yZAVftI/5FNRVFKg/H9RpDH6hDd7cY8tZe6GqLKpssGzte2g8dT8k
 rMfWR6JoRDvFhphvXNXpSfl12jeP89IyoK1nDtVbIaYjahygWxds5dei/6trYE0Lr4WbZr/1FvG
 vVBdy0K/d183T75UoXjDj5wqkT27gBnzn9iijHIG24TbONi3oCSL9xt4hE7U185fAfoC0bJJaZQ
 YC3aYEkRZ4GXTqvPL3kFCKUcoo+ocX/FWVjuWfI0TjxOV/G40gAznUzKfNSMDmwlAReJtXHx441
 uLxrVTvDxRpld9zl/XJ1xIgfibjFggdwg7i9jME6T2JAXTAVNv9N0/UaRPeNL28xDgN3Pk8RY5o
 pdU33oakEXo7yft7MF60wEXoTIy9O7X9KSNY8YTOGJGCKtdJ6BOkIQA5PYpcsPEijbjL2+5kU8h
 zYlpnA2MngUttp4cpzd1T5cbkDwp4qHNgcZf7rSmiy7LIHkKnmR8WxIngSdJuNqDkyJ/GcUfaas
 qHBaTSnxPgeSAsCDpApTBeBH/Du75fNwJ4n0t6Y2w/YLNI8RWjB662r2W/rk
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79977A4C3806;
 Thu,  5 Nov 2026 21:38:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51680)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP4Dt-000000007S2-15Qr;
 Thu, 05 Nov 2026 20:38:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  5 Nov 2026 21:38:13 +0100
Message-ID: <20261105203813.1522364-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{lib,
 minizip-}zlib: security bump version to 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/madler/zlib/releases/tag/v1.4
https://github.com/madler/zlib/blob/v1.4/ChangeLog
https://madler.net/pipermail/zlib-announce_madler.net/2026/000017.html
"This version remedies several security vulnerabilities, fixes other
 bugs, and has many other enhancements and portability improvements."

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/abfccd119bdc40abb2bf9125c83410f519ab594a

 ...overflow-bug-in-non-blocking-gzwrite.patch | 31 -------------------
 package/libzlib/libzlib.hash                  |  2 +-
 package/libzlib/libzlib.mk                    |  4 +--
 ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 26 ----------------
 package/minizip-zlib/minizip-zlib.mk          |  2 +-
 5 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
 delete mode 100644 package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch

diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
deleted file mode 100644
index 32aaabcc76..0000000000
--- a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
-From: Mark Adler <git@madler.net>
-Date: Wed, 16 Sep 2026 16:26:14 -0700
-Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
-
-This addresses CVE-2026-85091.
-
-Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
-CVE: CVE-2026-85091
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- gzwrite.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/gzwrite.c b/gzwrite.c
-index b217b85ce..512329244 100644
---- a/gzwrite.c
-+++ b/gzwrite.c
-@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
-             n -= state->strm.avail_in;
-             state->x.pos += n;
-             len -= n;
--            if (ret == -1)
-+            if (ret == -1) {
-+                state->strm.avail_in = 0;
-+                state->strm.next_in = state->in;
-                 return state->again ? put - len : 0;
-+            }
-         } while (len);
-     }
- 
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index bc8b046426..11907ede28 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
+sha256  4f11c512053d7bab8d9e9b89bde3575add3e4c50a383b42ef6cb837035fc5a7c  zlib-1.4.tar.xz
 # License files, locally calculated
 sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 9ce08d7093..ac411d3d11 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, please also update the minizip-zlib package
-LIBZLIB_VERSION = 1.3.2
+LIBZLIB_VERSION = 1.4
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
@@ -15,8 +15,6 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
-LIBZLIB_IGNORE_CVES += CVE-2026-85091
-
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
deleted file mode 100644
index 98e16251d8..0000000000
--- a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
-From: Rui Chen <rui@chenrui.dev>
-Date: Tue, 17 Feb 2026 10:48:39 -0500
-Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
-
-So that ints.h is part of the installation.
-
-Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- contrib/minizip/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
-index d343011eb..b7dea4f7e 100644
---- a/contrib/minizip/Makefile.am
-+++ b/contrib/minizip/Makefile.am
-@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
- minizip_includedir = $(includedir)/minizip
- minizip_include_HEADERS = \
- 	crypt.h \
-+	ints.h \
- 	ioapi.h \
- 	mztools.h \
- 	unzip.h \
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index d5c07fcca5..acbff105d4 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, please also update the libzlib package
-MINIZIP_ZLIB_VERSION = 1.3.2
+MINIZIP_ZLIB_VERSION = 1.4
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = https://www.zlib.net
 MINIZIP_ZLIB_DL_SUBDIR = libzlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
