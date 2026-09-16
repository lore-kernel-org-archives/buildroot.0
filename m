Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D4C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B6440746;
	Wed, 16 Sep 2026 20:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6oC0aPmWS-Z; Wed, 16 Sep 2026 20:52:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 561724072E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591970;
	b=gom7eay2SyMMRaaLnPPuzy+8YED39QMHlb+TcyBZ5Ld1f/aeQNKCQVnwNLRHBdBMNFD/
	 qmAgSlBVgeUAJVno5MucJS/DWRlbJtd7+/WxU2/V97LksgD/fnE5MzGNMMoI49yP8cyPa
	 WqjrOFLp+BET0xRoy2A9Pv8hoO1417O0sE3wCflWIbDtINGblTHpVGl9rKrNBK0oU0TFh
	 a8Bun/MbK2TP0pP8prdSxQF5z0rfp/f80IH/ykjuX6WbJB114c5Vn6oWVOSTFNVN3TSzw
	 v2pVDH7iJEyeBttG0p0xth1zQpby1IVvffOCun7cnX0sIIcRwxKn1w1UZNMvR9I6BrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6pInaItbe97rZyVizTtuumPGXHYNxHo8CeKlrkNwEKE=;
	b=ECqyGVh34QmP8Uu7+RFizW+vK/h7CcK4PEI5xRw+XKiIkR28lHBE4FHtFc1aLdavEgNz
	 l2MGLu002VW4eYunRov1sES1/h96EdbfIo2d7xwFa+dkUTl/QmOdnSyt40SG2h6ZrNMj0
	 pSJ6rOkiZYrP1Mv11mLWvRE/ZzPnDYm7ADz+o+ZdzwXLxV30lI9Mdbg9wCu0LwG/FeCt1
	 k14YksR+GvlCVim+jLIbYwEdzFZsavzG+htkJ9+0EsfWeeggsDUfQ3l8Kjtikni9fM5HK
	 A7MXJVPwyBId59nA9j+D1MTWbxMWIAGvRngN+LUBOvPbcuzDrjKZlPoEfeNcSwfQA6A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591970;
	bh=6pInaItbe97rZyVizTtuumPGXHYNxHo8CeKlrkNwEKE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZXTxO3cW4n+grtqO3tfoF/eT3EQuLHdws0FTOaiDc1/uNf1igRDIGLjSOvsfwNOgm
	 dL3Tg3LlBblfp3VIUPj5PymLovowF9YSLtiG6qxoKCR+QVAzqtt5C3YuorN5OXsGCo
	 suGiPgJLN7eyrsZAbh3SlhHzEoJoRt25DMCgnTiEDNyl9q+bxOh2EndQSY6bfiQ4ay
	 arzD3wt3+xmTYlhl4UWkKiiyiGgEv06t0CCoakkMa7Yj9WnF/c4v7j3jdDGfStsSJN
	 xSLzZ4NYH+epothdXMqkjJa+ej+dVPxTgtNXBvxh+jlCCw8odl75PkSfnPKmlOIDpv
	 gufQXXwq/OMyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561724072E;
	Wed, 16 Sep 2026 20:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 618C42EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4724580E31
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68aiBdmYB2Ty for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 50ADE80DFF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591968;
 b=hyGYs3Nsc74vPAmTODDRU8+GYnFCZGgeXIqZ796AGYDJ+2v4R+u4WyxX0JQ0YVO2MNGL
 JihMmjf10qVjZfiz2QecBJH0LZZkhZPDe0XpYS7luOlXExFpMDPPrJ48zIrhQMpA2Q3Is
 wpTw6Heb/57VoAd8XmNmQ1qXjdH1rZcsnLO50VImzcN3TXd8/g3/mlZU8aay4pvumMsIF
 QKopRaQy1W9y51LJYcUE2T72+BAW281BksfDaQOan4mfEuZIwP9TpZMJoDypxCjykBxSb
 DsKHoWx9fLb09/qcgmrQFSL5m5jO6IVNgwRU3wXIzHvfvjNYPVX6yr8BtVktCh6bEzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591968;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ne2W+OmKZ75m7zMKxU91p9gwTZnTYsQgb7CtePareSs=;
 b=XYcZXoYoMyV34fpNXN2AUM109SO4d80CaOvb3sgmO7R9QaBz5csC0K0cOCfibY3rTSw1
 pmNx76+v7yQBqn/KWRN8lZ5I+pTZ0YQUy4vGW1baPj0zwYiySZzmmBO5k4YZPwnm4/bpg
 KrxzM/C0kMsmIMfBClaXXtzvhWqrM9Y+n8m4Zn4+QH7v1gb1i0+0AJA8EV7OE0orAbb0L
 rogfzxDxU4ZgZAIZp+7tbzLxao89vs8RwxaG0WqScIkrLOZEorySAzladovwkmxtjHq3t
 WiLK9tYHYl2mhiwXxUwmPZWMYEIrCVRoAmPx5TYxgPrNnm+SARnSl9WFFxUxPzT88Kg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TQFBdtsJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TQFBdtsJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50ADE80DFF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789591966;
 bh=Ne2W+OmKZ75m7zMKxU91p9gwTZnTYsQgb7CtePareSs=;
 h=From:To:Subject:Date:From;
 b=TQFBdtsJ+6CgtbnA8GdIJsfb5Uree/qFRXNWSr2BSBD4yR/poAmCs/FbsxV+6rcXI
 dzR4cfKZ3Q5JZIpAO9JchAh/9aSxjlzE+b1S5vumqiDQS86yK2Shh943A+QXoj2xQC
 ZipSA5NQsneaDxZY+eyouKtU03DH52S3hafO8WYHvyHDj8BBGB4mxaIjme2vOJ+0qA
 tiaMpynZ3N97iW5BuyGvtMCed849VL2tFf0o32pAgH1y3dy7ZUMy5/oD/jOFwHco9l
 1KrvJa0YexIxq5IdXkwRxunetVkdzOcrSVt3SxqiCiqDBfbpke8P8+pQR3nJK5CSZP
 pJZeptkUJJzcA==
X-KAS-Sym: v3:f51bdf72230551df:P5i7rol47wXqNiv8pONJjTVgRL/jPapltORO00Zs9PXQNKbI1vrKLd20xQv2zcbdNIVTgfmtUsZUTWj3dBcnuAodQ5M6l2kPuD/n3JsINhVg7i3tiOtHGXQI7pOHFib9Fq3k7FU4I2IKYuIn6WaJ4Xi/EBUc/KXqlexkvXJQuPhKRgfxTjZcVGZMX60hkREkTmGyz5+idZiMSUL2cg4ToOvCQ2qn4lUQK3kUk/sNy3TcCCzgheBwMEM5epq+JNwKVO4ZSx0z7CKrR5Ynb+b7qKPjufGRMN+VZVOwOFaDjGOt5WLeg+kP7pbeITaQyyLnFIu9WMgY4PsShD1rIkndlQ==:A0G1wfOkMeboxbohsknLKoBpPR37QlkC/u8Ig35H/fFfrZ1cTskFv9GXlF2+KmmaIKimaMJoQ2gnUaE/OnElWTunVVCPP8I3gCDjpfRngxs9WEE+Z1GQkJvnmZcbSlpFoopAVhhFutcX1qCurBAQodU9uCuUz2sJWjal3hhpi8e1n9LATRlquYJnMHUO8s+QxkTTcSiTX9hS8+LvzhB9B4VvIhTJl88dYRDkIdNk9eUt0HI1YQB9pq/f4CUc4xnYpYDDu3vyUb1XtVhKiV8HN0arQhS3OONvX2NBqAPxVogx8My094TMLX5Xa8Ec82T+0ajqtMShgUSu2L1JVyGcYTx8zGiD3sPE+PDoM41kYcdKwvmaYJknRn5JIIZ1gr4hXkYSGvLOgTb6M/npoorZ8T84tM0ECswXQdxWSTHEu1o4WwgZHO8S1NBKqPW9APVED9l4ANazyfu7fBz721VfsExE1DsXDb96HesbAY5xGDE1e09uccgBtNR+Ky38GLAFj2+WaGCMJHa/bU5fxVDcGse2VEXWOJd6Y0E6KFduiwcMSr/wmf8ck1TOGcYqvWJ/MB1I7aI=
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2CC3A4C310D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 22:52:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60458)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6wcX-000000002DC-1D1k
 for buildroot@buildroot.org; Wed, 16 Sep 2026 20:52:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:52:44 +0200
Message-ID: <20260916205245.2349520-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/2] package/ghostscript: link with libatomic
 if needed
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

Fixes:
https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/

The build error occurs since 2024 so a backport to LTS branches should
be considered:
https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added first build error recorded by the autobuilders

 package/ghostscript/ghostscript.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 250c851b28..08e2667981 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -37,6 +37,11 @@ GHOSTSCRIPT_CONF_ENV = \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GHOSTSCRIPT_MAKE_ENV += XTRALIBS=-latomic
+endif
+
 GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
 	--enable-fontconfig \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
