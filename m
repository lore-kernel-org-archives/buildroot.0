Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F95C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F37016061A;
	Sun,  6 Sep 2026 10:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lqe2s1z3kpyX; Sun,  6 Sep 2026 10:53:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 06CA7605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788691997;
	b=CXrL4IUs5bAGfFnpLVwH0WWDVFImcGbJqW0X7Vf5LP+YYtcaqryev78LZ3QMJUKhvkax
	 RQsjucv4d7C68Jm1bc6wJGdBa1oKE5SlzI8+MNSYTxBBf/U/UuVcdVym5ePI8FcV663k9
	 QWHEtp2wAK29nX0L4EJwABkhwyp+9IN5lTRXS/CEVwOqKjqRheMn9nI18OF51Eh3eL76f
	 5Ftw/JJ/ZJPhozJ1nyaI26zNiqXqLDX1hptlnFSfJm5p4FGcSuCYIL0LZ403Y6wVZaFSd
	 D+lky9Hb3SbYkItAeAhVD9tG7VJ3QprCghjC95J1rEFEombt+2gwWNvqZBU4k+tJOHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788691997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kRfuuMH4/G4Hm8+Udsdhz5FE/8Q/b6HIzkIFVEwltPc=;
	b=HQEKAD9tOj3IY/ZdRJ4cD379884leBICS4Mbfs+KAOyVUyNr0f8M5NSFnLsdWSA/k8Le
	 8Paz5Ehcz5F2/vGgK4GWngLa/1sXCiUXAmaeH3pVJqKEceS0E/RObyTSBAYVMLSzcLeh6
	 D4RVLc31Woon5/ZpSi7R2StcK5j9lqbRwaJl4YTY2BdmV69nTFHo6mORPgNgDNKFAvqNI
	 LwNFRQvqRGSt5Tv0GvBxhCOAQ+1YGYQcCv7b2R3JoW8KSKE4/tSLIuZw/JKcMzIf4Q4eD
	 mj3N4S4z3+AVzLbaYWgblFUssV2MeVzrS2zCnmu0rCWP4o0BpbNPdckfwMhLJyIROFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788691997;
	bh=kRfuuMH4/G4Hm8+Udsdhz5FE/8Q/b6HIzkIFVEwltPc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VCCnthsE82NwZYk3wE6c0UN5FZsEZY6PJr7c4LC5AsutvTkMzOhcUsrCskFiscC9m
	 nrFbLNTLmLm9jxnwrPQwkXbG22X/rcq2D2LoCYK4Cs71j5+IHK2xXJFxDc8x3s2IDT
	 Yw3BK+Q2aw0HnFsYANi6myaSXGlvvX3siNk6WyJefJ33NxJ4xwzpWgQQjiWES3l25B
	 HJzAVKiBFv6M74lh6kc4QBio6GWfY80bEXkJrEfvQ+fqdswGIrByKns1lOJ527TEaN
	 5pdtDXVOrTtCm+WW+JWYzHGI4jZNF1rSsyNeXTNM//59g+C8M83jov3DtXhLkz5NFb
	 I5RYk/N/DR/jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CA7605F0;
	Sun,  6 Sep 2026 10:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B29B93AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98A314007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFoH1AUZvaaY for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:53:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0F56A4006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788691994;
 b=ZLnhAFsWciZwHNfAzr/5aCLbMswUY62wymbpikS+u146lPM21FlRxCLifRT1CSYOwDrW
 p7NjQe1LCy+NKRyuzWrFx79q6x02Cgnn6OcfX11QIheBZ/OAdzshI1OwCdI9VxuMNP/CN
 +lnEfci5QVhDNd0odaIFTubI7seXR11V0DkE4nA/lHiWmXgfjPCSRGWyH6jeP0zlRoc0I
 OP6Zh/KjWRNSh9flBGkW7Zbo/prGB8VVWOr/mR0NjHW6gdfUQJkvvELnpl32G84ckpWch
 aFErdEq1k0aNXt1hmXSl0uOgS6BktIOmbfh5uT8Si3lKY+8B12m67yun1cyaZX7jUwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788691994;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=O0jEvCzgzDaHlMXuy2KtJgOg6sx8ybjKci2GiR6B87M=;
 b=rec2YpjbQRrCYi8iYT1t9/I16ZJE2FmtxxsbVuVqecV3XfwvCXiaVnF96toGk5zjbTzJ
 FVo0zeP/k3LRxQX+CMZV1Wx0BTKm2JALja0GXVBfwIcDdYbdd9FugWOQQn2Ispj3S4bMT
 arMXF9iV3gXhgwRZdLOH56fthYkCMz2YY1dHYGAOC5+5KMycgMAegpa2Eufkw4qC4BiDc
 kLQN2G72hjQrVXqCypIs9+urDpJf6ceSZqYFlGZsZbfOPFPD48FO0TXExuhzllZOL8ZkY
 Wf4kVx/5TaGYNRJEobAC1aVXdbMRxpKzB3M9kbMjlDxeipNa3doDTNIQ/9EIeh2PkZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UIO8mNgw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UIO8mNgw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F56A4006B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788691992;
 bh=O0jEvCzgzDaHlMXuy2KtJgOg6sx8ybjKci2GiR6B87M=;
 h=From:To:Cc:Subject:Date:From;
 b=UIO8mNgwvHlh3pJEQV372Qyc+5B/DkV6lMQx5FCiLqARiAe5MAIilZV0FKXDhqaWU
 MFyhVxppxJC7SzuY8YVM/fvYwU8enneqehgLwAtISaYSCF6YhSJqnTk9/rGrl3kYYt
 4vt5uX9wr9PutbNvfBJIkUErhzN3Y7KFiOAp4Wt6hYABocCDvpu4uOiFvVcTnD/szj
 czfRRZlqWfTXjZz8i532Y+hTRcs0uqD0UJcYzeYpbQ16yceqoswLUoQCp74ZcgmCrn
 SSVtHLGgZ81Iwo2xwbT0bkJwhg4qIyo/iTh4zOqkBMoW60tYpaIr+3MvsO5gPdLflQ
 KeCJ+oerZYcaw==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24BA7A4C2DB1;
 Sun,  6 Sep 2026 12:53:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55574)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3AUp-000000007lJ-49ao;
 Sun, 06 Sep 2026 10:53:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun,  6 Sep 2026 12:53:08 +0200
Message-ID: <20260906105309.3690634-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/exim: disable valgrind when
 building with thumb1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

src/valgrind.h contains inline asm not compatible with thumb1 so we
disable valgrind support for thumb1.

Fixes:
https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/

Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.

The oldest build error of this kind dates back to 2022
https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/exim/exim.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 5e9746af4d..482c7ca2c1 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_DISABLE_VALGRIND)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -154,6 +155,13 @@ else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 EXIM_CFLAGS = -DNO_EXECINFO
 endif
 
+# src/valgrind.h contains inline asm not compatible with thumb1
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+define EXIM_DISABLE_VALGRIND
+	$(call exim-config-change,NVALGRIND,1)
+endef
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
