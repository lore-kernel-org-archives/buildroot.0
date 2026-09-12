Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A00C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34F480E85;
	Sat, 12 Sep 2026 21:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUxm9iCdQxYF; Sat, 12 Sep 2026 21:12:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ED2080E57
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789247538;
	b=dAG2Y7GlJF0YJDf0QBx2azpPGXtKuhXfGgw68cojtguWrC1nDT8t1BiyPXWPORpYHuSs
	 VASILriWHIli6YPYtwUzcCghysATCG2Xn5aa7WnShk1TVsSqpUrXLHcZr4XsbdX0oCdcm
	 uNAbSAOjrb3A7i4g/LWVfH7UE8VZc+ZDJ2nGGiTdYmt4szyIvPPxuxp9db6ombrYj6IB/
	 T1MOfxeUp1+IsjVb2YeUFxaaaoZzSuOCBRaG/0bTeijmEV+4kgqXQQ7wPXcIUqYRucw7f
	 BiytqNp1uP1naY3Mny0Q7/GEfzruINMiKVeDbccUmStc+sIiNqbzelYDUI0wu2UQvsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789247538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ok0M18E3eGYWuf0lzhqmr44+DCFaa9NTUmBUsFRoWI0=;
	b=mkUyB9k/qLU7uDk8leJyKinwC/ZpjpD3n6f2CAu4AvAZOq6h3ftitRs0eMopptk+Quq4
	 5sn5tMdA3VzTYPrBRm9CgTCmh+MyqtTqD09YcWB410x+ZOSOtooAs34aAbkvehpO9aghE
	 HGJ/8mvbQPMfH4G3rMVUUNTnaPlPwXY+JRcSiasxyZlMq5RZ0vMRrInLTbBUX4wv2kMHF
	 RXWNG6J8w+gOpYuJPkuV42PlJDVV7tJonSYHNU2HHThsyNljiATMZkStff1EUX+9+WUsg
	 YsEAy4Av77m6Bl1mnCdKtBdWDOjacoHw1cmKetu9YaENGy8fiYuZ5GXTVgn07O8qU6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789247538;
	bh=ok0M18E3eGYWuf0lzhqmr44+DCFaa9NTUmBUsFRoWI0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=i5vk7WUo9/69oHc+LHr1Kw0FBJC1fOjtBKuymtE87Y/39+RecyLw0Qem0pFpJSoKa
	 dj1xaYkIcHtGnfqLRY/DwDGlMbBOm3iEJusQdp4lIJ0p1tcuczMl5XETbo9Ke9LdJT
	 2SB0BSjgx7iU8n8nW16L69jXLp0VqNpP7OwJxMg/0BzaRWUD5wO4bvdVtSEfX5oWUT
	 SPb8QeBSOJLG3A61XmXl1zdzs2f6d+9SLGMvrGCKtgw5rgvkcZqKAKJpxKVhvdpDeJ
	 RpAVDFBXLSxNCMQFuiNzc9u561BYb99YU6w+5kN807A+vQTKqu8CVCL+5f60uNMIJp
	 ykorHQIx6mTbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED2080E57;
	Sat, 12 Sep 2026 21:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B5FF701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 410BD60607
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDK8wd00rIKQ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:12:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 886EE60601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789247535;
 b=LnlMUESaU3HufHvQi2cB7BQPxlvnq5BqP5dah/vFJfQPIDB0KRflbG1mh1hxB5Pphxz4
 rD1a+7wi2O0h876MXXfs8eYwlOEy3g4n3KY7OmYXK3NuKLRv+JPDO1YJhtYV8/qhlIKT8
 01J2JrsaiLiXp8E7W1X55l+QGRwSmptU0LowRsECK5zmTlcJE1uAA+aMijsEPp7V7lBH8
 QASO3uY3V9xzDbak+HWeASef31EL3Wvut3pkhWGFbjEYsRagbLC8XBCi47syfP0HuJewS
 Kw+gmSLNrcQCCZBupdOPabAPu9VcnWjTx/42pGXU/9VFH5prgIwh8rc1x9HiULTFOtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789247535;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=0VaEl7BkmckBtlPl+5/9xJX2vuW33Z3BwDhONp0W7jg=;
 b=CJ/3g+c9H9UW2Fy8IgZQQVOeS0S4lWSlWUpixZuuudEG0wG7yfjGRkt8qtOiTwB695tx
 72GZ80vZ9lIz86qlVIOUEOosftuTXbcrLYnNwrhlfMwi7xkmVGtKIk4LsD/TTX7Sf1bJQ
 M00XAaG/W832iHcoiiBItFoN4Jx+TMDJfYn0qGhTJRxyjBBuP5g04xpWg82ryz4gwwBbD
 PvkX2dt+oWMl4wJRgOBIZDTElieZeZoFJljmyy3a1bUlYdcz5yJLJlqVCimVZ9FaZ0qeB
 gqCY+B/nrPDSIqdnGgjDUPxE4aIPUy8FWrJDxgLrV8zDbevYTKGpY5uhwxH4yYyUHNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UFxwx6nF; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 886EE60601
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:12:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 07569C63449
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:12:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8305560580;
 Sat, 12 Sep 2026 21:12:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5468E11C7AFA9; 
 Sat, 12 Sep 2026 23:12:07 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 23:12:05 +0200
Message-ID: <20260912211206.1555090-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/python-memray: add missing dependency
 on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_PYTHON_MEMRAY selects BR2_PACKAGE_LIBUNWIND but forgot to
propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9".

Fixes: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48 ("package/python-memray: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-memray/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index 1c5b286a8d..16b661f8b8 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
 	select BR2_PACKAGE_LIBUNWIND
@@ -19,8 +20,9 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 
 	  https://github.com/bloomberg/memray
 
-comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar"
+comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
