Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB25606A325
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PgyRZMHX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=eyqgP3vy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C7660690;
	Sat, 21 Nov 2026 07:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CTqBnUqzKfq; Sat, 21 Nov 2026 07:26:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1678F60668
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795245999;
	b=JciuAoOJ1un8wyn3QrgqONpFcWb2Omahd/WyZ1feIzfPb2EcHKg9VESi/Mpn2w2/EJPo
	 M/+HSFI0fu7R1mWVLjKMZSXhURDPI9FDv8mUFGeZej9oR3TlgNmBFqYlnWW5Hwsjefltp
	 4aL9FDhj3CDDY9OIECWtbA2Q9kZTI7lGyxCXTMh4dnEG3YK0VS+/AaQvjFlOwS5/hvj2u
	 H/v+lJTu0oDHjz6EL0AAyFGG7vkADsnOBC/1ny7IKJ6ZGajIS+oT1hY90ZCbl+YI8A5NR
	 dD/KT7N6yBqgSLCTMsb486Qkik8EE1IZYQuI1QhLY8VKytknjrhloJZyUTF5HVM+gQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795245999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=evfwYzw8ruI71vn9IVumOMYuZlscLEXP1sQ6qgqCUrM=;
	b=ZKjy9yGcyQ74f6DhyHqwVhuEsi3lsklc65wGQgk4J24A0vKMdHPaWWavZehMuE+Btoqc
	 beTr6FH7SFK8P7zkV+3i0q/2wl1oLAqv2gd3IHBX1c9c3o/Zqb1HB3JOZequns+CvIiNm
	 g4+ov1Ol8YX41u2GenwUyk+dnVzVkx/HOUZkTzibmhuOBRAS9h3ZbzmXt15RpGB3vb9ay
	 j9M51PlskiUgisuyi9WsVDZMzbk3WqeWfVh50kEZr2etZNmxrgNduD3S5V2YwDusxekrc
	 1LX9eDt+eYIDhGMbUVpzBPg2LgwEMVIevTt1A2qyp256bl3FfmkBFwCA6koVkF58nQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795245999;
	bh=evfwYzw8ruI71vn9IVumOMYuZlscLEXP1sQ6qgqCUrM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PgyRZMHXT+ZaNj4mITrhjluczMBcZSRrd/90dQv1cnU2RFF8SXuSdpT+f+oWIWueO
	 dSkIVXqO0PujcbbkV6JE0zfGnO1cIa9OFp1C9chKcqAiPYwqLkNZICzQM3Wf5J/R7U
	 N0gHRWEIG1qbZn3BhPTJi6ivti+AkyxaDhq0ggYnvAb0wQNqB0dPJT58jfPOxijMwu
	 BcpbXunE9DurW+0p9Jj1MvsCgZhz2K6VRkRpniPLBd77uXTzIsfMyZhV0pl8kheIkz
	 2MhB9b09ZHpTJl51dc5Pw4/l7n2tW1x1pFzZAQJOi86Kqtjou5RzlxljG+OAWlDhiA
	 F4g+wCiFToETg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1678F60668;
	Sat, 21 Nov 2026 07:26:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD01A465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2556408ED
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXfAvNI7FRSJ for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 07:26:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B2C140799
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eyqgP3vy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B2C140799
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795245990;
 bh=BCqJErvcaZi6r/vdBomfHAVURWAkHRna/NcllzrAaDg=;
 h=From:To:Subject:Date:From;
 b=eyqgP3vyjorr/Uw3MguyovrHULaHULwC4fHmcHigwsbt2Q2Vye/Z2hy8NUfDI95WF
 DPzzBzyAIXo4pFle+3K4VDqkJEFqwyAM7ScOQcCFw4fvbMYocUBytbdmqgUs4Oo6DR
 34GYql+LVP9pVOGkGTlNUFb0/1H8o1i5WcKJdYDHEfSS6LdFaNw8SkgzNQeeLQ5ogR
 9gnV9zW+LNpRkJ3I09D8+JpXt1QPTS4l+iQis3vOqGwi2Ew8eRvItifB5c+X/itB17
 pX8jDuPFEggr/imocT5MAP9BMHxDe/HJQfip6OjwHaphE9DYvLWGSmfxFQ6FkUROiT
 8Q0LXK4t1LKQQ==
X-KAS-Sym: v3:f51bdf72230551df:CAiyF2f1+VBdVtDjoKKHlUqrKhKHLuEWMH8I9iOHCIMeT
 aZpzqs+nYm382Ju67pGzYcpUSLgyYaCPVW92FE5Ztv26uwkJdqHilXsZQKjtgEzpRhYQqTbZA/w
 rdodQb9ErQV4qc5GVM+oOMST4DRImUsqNgnsYl4tMj1kl702aCLwCmyZ0ZC0LlbMjE9RL7wge+H
 OuKHYUEZ6/kRcacGDEtY3a2RzZIvQh7A6+dvng/8KdSiGiDY6y08RDN0/LtfxjdZATgwGgEO2D9
 vPYonvK1bigIaiUA3KWDdT9dUN7phMJVuYd7L/To1hDt5N/6mEM0HxNB9OOhhL4TVQ+PgzIQ==:
 oJzzYdXKVqpA/NPuroxxYjbwLcM2izQ9o/DxCRPBca8fmEh2VjqeGlrslBakM8Cl68hAF9N8C2p
 R59RV+T2TP7b59urzweCIML0WwQr+moTjOzVXx258N78rdWOdzMrzNbIZ97yYqJmuINTSCuJigk
 9NYrMwvVO0lpYlcWM7k7jFMKq8oGEOoMGIl5wkORWjUa8zHULWlayzniqOAD2npSQNdoHaC/VBj
 6YF7QqWON5dxUjOAd9Dddu6d6NJsn9rjVtr8AC07d7r+hIy6lce0RJYTUD3r7TsWDyRakxbUT+A
 HoT9dvapV9R6RvP0iodUElK5BfSvTBHX7sgRjQ8HsnZFeTRZ7Gx80DO8j0kBnkNOMycV/l1Olam
 Vtbs0Yh/VmzY8JE2129yvU7Zw3xPiR2dEUKdRMOvjUeD+gBP12ry0wEcjB+znf0ww6f6Va3z/Nm
 n+PKJJn5h9oUHDvC0G7G1zS9J0+WM56C70GBvIjbZ8ryTtXM8sltMiesfTved9sP0hyFTOigDzt
 7Ytckurc1V0yOjJw6ZNpJGgX2iZEVq3LAkRfy9/aCoh+uXUQ7QLNzewQc9E8PouNVnEmTv66JXJ
 x/vrBWus+ZCcdNsNvcGhXtVWwfO8R+9QCqgoU/kckVBH
Received: from fli4l.lan.fli4l (p54a1b235.dip0.t-ipconnect.de [84.161.178.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C85CA4C4B25
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 08:26:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57370)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xUfUT-000000006o5-17B5
 for buildroot@buildroot.org; Sat, 21 Nov 2026 07:26:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 08:26:29 +0100
Message-ID: <20261121072629.459060-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/openconnect: fix build without NLS
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

Fixes:
https://autobuild.buildroot.org/results/e788cbb9eea5dd9c710f0be71cceb5eca7133975/

checking for msgfmt... no
configure: error: msgfmt could not be found. Try configuring with
 --disable-nls

The oldest recorded build error of this kind dates back to 2024 so a
backport to LTS branches should be considered:
https://autobuild.buildroot.net/results/7e2/7e288f5fc334ed0a23330d43fec52209df36a883/

Upstream added AC_ARG_ENABLE([nls] in 2011 to version 3.14:
https://gitlab.com/openconnect/openconnect/-/commit/b976ecb02aed356fe45334c018a0e727328a1c9a
while the first version added to buildroot was 9.12, see commit
c70e0c08c7ad516b4fd20bf92dc1435ecbea94b4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openconnect/openconnect.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index e9a3257edb..26a2e646f3 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -6,7 +6,11 @@
 
 OPENCONNECT_VERSION = 9.21
 OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
-OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
+OPENCONNECT_DEPENDENCIES = \
+	host-pkgconf \
+	libxml2 \
+	zlib \
+	$(TARGET_NLS_DEPENDENCIES)
 OPENCONNECT_LICENSE = LGPL-2.1
 OPENCONNECT_LICENSE_FILES = COPYING.LGPL
 OPENCONNECT_CPE_ID_VENDOR = infradead
@@ -30,4 +34,10 @@ else
 OPENCONNECT_CONF_OPTS += --without-lz4
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+OPENCONNECT_CONF_OPTS += --enable-nls
+else
+OPENCONNECT_CONF_OPTS += --disable-nls
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
