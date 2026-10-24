Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7467606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=owL3FgtO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JLBZUI5X
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D8A80F40;
	Sat, 24 Oct 2026 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxooR6Lyrpi9; Sat, 24 Oct 2026 22:03:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB8FB80F4F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792879416;
	b=ICtwrXtHoMcxX7S4zubtIE9fYTZi3z9FVe/nk6zZkq7rlpAovfjneHql840ouj35Zdjt
	 1udrcb9uwq2mFm7+nY97+NSqIFK8nhWpFHM91nSVcOnDvoqi43JoG0eq2/goMcj0kW/Hw
	 r82Wzi5uRy6ch+hz6CxSEvTGM8MwVuynA/QSwVXotpY9R4KPcpFUyQhfyVRqAM72/5tez
	 zRUSuVsFTuT7XeUn9fAzSzH8MgGHW7QvCvZa83WBLDswMFUCKGMy7kH176fbHda1SSa6W
	 dfnBEvIDpuB4ok+52kzmfEjnvOk7aGUD9HWkH18weeKgnxmHo+eutJCz2kog3PR6Lqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792879416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gt7urGd+4nc2PizylgVH9fLKfEp/kZ04l+Zt/04AqNg=;
	b=MdX9M9DMVMknjwcgVgg/jsG4bt6UxSJ9QQjQhfChzWpBBzxepShjrknkE32KststNOM5
	 0nGZuDhNX45H6HSd3GUc4AsoFeN/C1Puo3bW7YgBkWLWmz3QSVvWNUeOstryKpOUbWhTx
	 M6t1F8znbn62HBIfvP3rZPw5mJOHo+qIQBmQlJIZTBFJkwJjEWWoe1pBR0Flg2QgZvtSJ
	 IFADvVp1r8evz99U+5h4mgKleco1gEzT88xwJo3UuVW1LnYRtkUVDjyiwZF5CXERuJGSx
	 OP3HbHm7lE8otknDBy+mrjojWOftMDTZwVgFfPYK0e8r5iaCto4I+0wThs7hbfI43OQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792879416;
	bh=gt7urGd+4nc2PizylgVH9fLKfEp/kZ04l+Zt/04AqNg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=owL3FgtOtdSjbZ+q2Q4+geYbsLCGyIw0eTkBvioM3qEQE1Tn71HSviuXonBcmsP5F
	 lolRUo1qDPL9groUuTU/AdFInxzM+bmk2VcBWtR0/7tOrTEPI1kSsOUXFivtz50Q9S
	 2orUNw7xmsXSE1iJYHeu8gCPE610kXnvttTHlkKZ05wPOp5rxKzVfsueFDnZRlC9lz
	 MCAjMjCDzdjTfoJDFIBpMq36nttjoKkR8qEOpkxmPzUUztEqIlqANyQxjeHIaQ/MTX
	 bjnDli/ZGIDPp1GDY78nvl2kA0GMakStdlEpVwO0huFksYJNvsoY58NJ6vYORo2sKj
	 4A83Ut3zSqdHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8FB80F4F;
	Sat, 24 Oct 2026 22:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B22B2380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D216061D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgRGT-umvN11 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 22:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 612C360619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792879414;
 b=b47IkSE+ViCVELpP0/ObzJ+TssS6sEiiOUVW7Aj2378BvqRJmPzT7elMircZdGtNq4bG
 dVgs6h2Os1VCkKhcDS744ndBm2L/WoWEH0oI0LIJuHWQ7KKWdR5svyRn306MjXa2lj+CE
 EbOcLE6R0HaFA8yw9u45sAE2ItF1FVgAYf8q7nrbakGHJIHtPC7rH+wNuRmHc5JfQ+Umx
 /dxSymq4Xxndty8A3gEiH/ULeRrznZU8NG7HEU2vohaEoKTH+2FteGvOC/0uXnpCdpbp/
 TUtXPdVvvy6Fvuuxl45q+H387Ze6Jc0Fp5A4EpfxEmeXo7HHOnAalQ0Zt4tHPg89Scw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792879414;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cLSet2JalDwnzfGDvtrES1Cpjshg4xcoEQReOpIjxq4=;
 b=HAlN+BBD64w6jJr4GnF+78YVgaYQr52i+N4ub/4gtvrVtiRmCBFH38M+cXpGgIKwzNCU
 uS5FEhT0doFFkEj9HuS3kquyY5tDsYf2635QOcnxOFaRYFDAoyAgf0MjjJMPGGwrbHtgp
 IkciSA8tgURgJtEyfnr/ye3j6UCu1de23Jx1npgnGaRYWRw5CBghx0ssrH34NQ2cbMmhs
 MVrFLo7aOpgZnVHoN3PVF0rM82zVW0neuVf6ildmaHPsnH7svJVqxVnwJKtRZ8CSzwZmr
 SxhbyDoIWWIWnmQQVD4bMXxdPjG+X5NZhCt+R6DqDL3fwZ8xWIOMOiLalpe+5h7INGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JLBZUI5X; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JLBZUI5X
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 612C360619
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792879411;
 bh=cLSet2JalDwnzfGDvtrES1Cpjshg4xcoEQReOpIjxq4=;
 h=From:To:Subject:Date:From;
 b=JLBZUI5XPlOqwE+afirBHF8nsc/UjVwRfPJpgFYbPE/z0gBLAYsUYgEMxFlTYrqaa
 9GBk6af/GXrSKmp3N9sBtKdl/EYhaGqgWpx5zlsPvhd6aaex7F39fScAbNlwum17Bd
 +tSB1jvO5UUwPK/284e7MPZ5CUlr3Jhm5MSvz9qTxAUrqliTQWW+4I6jfLiuxhaIoL
 rmBzvOE1z99HdWzep6JvqJBFNi+1i5RLXS/l9DU4w5VLsBPGoR+797UgLsAc7SWNR3
 +3Okd/2gjh0n8F+SgtaRb2hEZOCEfixgaNcImK8nnBzzUIoNGrQw+Yc8iNOxyTAJYc
 KnDaNWzp55IDQ==
X-KAS-Sym: v3:f51bdf72230551df:VQYW7PU0ip+sGeqSVh+YYRh09ZJ50uZpI2Qa4CsDxwo35
 rDQlg08xvBy6pPyw4l/PYIJYg18YLhY7osHOoza9kpR2rPEN5wkZGrXdWf7XRv9LPadWj3wkcL6
 H13NU5DXGPsdQhNMpuAwH7ggNFJcrepZnFZT6xnlozUAzdaeI3nlU7XLcDOkSUojxlFM1t2Khzq
 fhpmF/6xvzjTu60Bsvt4Xdx3HeUm2CsOBniyxAiO6+BTcKsHfx+W+FLyP1ut9feE+UXDjDw/Ts7
 BXNZfpcIWK94vuUU8UKFFc8KZb1UEL857FE5xllsN4gAC07AIGHh7N0XBIxa9DoSth/qgzOA==:
 EbutZnsQ/4lV6c6uNu+ImZFvbc3adpSOp0rzBMHAff8tBLKCTvw6SjnfVEBfmWwGjsP41RQZ71m
 8Mg8tnurmkmg9LaBow0OuBQNGhF7Z6hRchDQGkadONUfYhcLFDAbXRU8gOpCvMVWcHKu3oMnGCv
 d9wxMnhHDWuxf1zteAkcEWBPREcbNWZBu85Ay7xj9fThl64eOuNlak06eo2wDSaUY/Nw0jKECgF
 R84BV9bBZzBIrxy6KXxMj2+wVedG8Nol8vTotSK0dQyvcCX++qe3QJEGtyvb+iHUeNfM+QC3mP0
 +5gue92dBHpNiNn2adqnGW14gL2S7LJ9qwlaELVGrmeW/1CgIZCH0iQtDbCfsClSqhU1A1KmskB
 JV/5xwM8EDtWHGJkM9FNEffGDXkXareNbjLR7vs540Xs9H6XWCiZPZx1iKAp4lKZEh2OpHCpRjH
 WJpigJ6CmWygfTYPU9MU2NIA0dFVXue5XDuZXLErYbc/JThvX71JY/6oUXrwtOGPjRmKAy675vd
 oklZOahBYHHAVGfFRT2GP+5PQZWaQfN2IkYHIEDHZHZUMAFEpPY3hTQRU17WKuucJ2dQ2k3YZNM
 NrYu
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 517A9A4C6345
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 00:03:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34512)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKjpr-000000008W4-105b
 for buildroot@buildroot.org; Sat, 24 Oct 2026 22:03:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 00:03:30 +0200
Message-ID: <20261024220331.2861322-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version to git
 commit 51ec612fa2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9f573fe02f735b9d5184c582c853a9c98fc8cd9a

with the exception of unrelated build error for these targets:

bootlin-aarch64-glibc-old/build/x265-4.1/.stamp_built
bootlin-x86-i686-musl/build/x265-4.1/.stamp_built

 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 8b18bb247b..6576b4f1d4 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f907bda7faf93fc95c3a705b70c6ce2a21f63ac824a610e39ab58075fca43356  tvheadend-c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4.tar.gz
+sha256  7d871f5139c9e0394a304ae8e8c118343d99abd26392ccc73b6e0c9e134762b4  tvheadend-51ec612fa22c4c78b4697e4c262c943da9cbd6cc.tar.gz
 sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index d74adcfe14..a0ffd89f5a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4
+TVHEADEND_VERSION = 51ec612fa22c4c78b4697e4c262c943da9cbd6cc
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
