Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C593606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bzeWGROc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D264A80DB8;
	Sun,  1 Nov 2026 17:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3JR1GmKUd2T; Sun,  1 Nov 2026 17:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 005B280D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554698;
	b=B1SA1IB6ZjUkVS4XtyCkqNl46UfMg6orljgjpKBW9/EJeadlSxJMyK5AaW6JysoeEXFg
	 i3K5XsdnW70IyEBm/kME74aMHsSdUTL3YDCgKF+BVKmVKpvcXJzo49wRFHgH3Fe7kN95M
	 mwr/YX4rs9AVKO7UFAGAimBmSdG484J3B5Fd0rAKAA15fLRcD15PQNEDm8pVmAcnASCGh
	 viLg0hkFKaK/g4KExlgqEdA6p9aLFBO1gMxTBChHXIdAxVGMCZ/ylD/CQj/zgRYo0qv+n
	 J+uTqXO5oluy3jqY6W1fKTDmFjsLyOc6dJrO8IB/Tj4qQ1xwuuzjcaFJneTb9PYVaxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=U0caJosrUQVNZjphHQohIDyGASR9Z3C0sP89sG/Wb/8=;
	b=nh97VV766Qe4hPuiyna+RcHECtf1Erk88wTec4K/hkK8Vr7nl93u2XWFtxXywoZV7zLA
	 DNT0Bagf9wXpj8Ak4fM8GaOjT6XRBVBRnre753O/MIVfsqBCZeJ5bJxE7vM5TOU59LJ0E
	 UUByk8F8i0/kTRqA1Utxem8C0CTABfyGm6AH+fbB4Up2r0UwupipnEklJb1BrjSBufsBU
	 FjIAeX7KNISLJq3t2YG0PycqhzhRB6DBZXwqJq1eCsJqQz99c1pKTP6WoCB7RfgeT4x6u
	 +Adxj444V3S8cVJb5aX3G13aHYqrSSpKxn+sNPoKRQCaZRkmhh11+QaHMbiE7UIRVIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554698;
	bh=U0caJosrUQVNZjphHQohIDyGASR9Z3C0sP89sG/Wb/8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bzeWGROckOXzPOmSeERsj1koByfAQ/dpz8cE/vqIBHY665BXTpG0D/r9hkVfF9hCm
	 GBEAYB/38iVj0o2wj/MPEdY0NBUQ130D7pTBjuOlOq5Kgw3ruzyvShwt6yjz4ntIzc
	 xXe1MeGDBaodoeIE1TKU+bSr9hGtO6+fQX+pO/02VBPArk9o4gu04eULJRkkZaio94
	 KwX6wyxUXpO75pfD+fOrgz3bFxvTBpAunStGg6NkAsMSDGiwFoCvD70xGMGNOzvzan
	 JaOo8R2V4J51gqrlWefSMfhZcTgDCo6UEIdMFpXp6FihrPtGFOFd2HsIEJ9LvDj32Z
	 woAWk4ZCzhzvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 005B280D88;
	Sun,  1 Nov 2026 17:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE346323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B381960612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxMrx8_Y6scx for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:38:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E35DC6060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554696;
 b=TasyOU5sFhoq84w1VksqonKmNOtyLE8ZrxUXfPQIQFByf7bVoJZkh8VpuPdyBvLZ+SGi
 OVGB5LpKCcyZHi80t3MUgoUsKqAbUiROPLZevfoQE093CJ/YN2omKmKe7+BEAlw/ZGS/N
 Nqhy1y/kvxtVVp291NuecVOXMhHOUW3zu7lWCTsiO58+hPQLSnzwE+Xgwn9wMk3aLUMfu
 MqxBLEd0EcDzDvC58032D/HfBLOsXo+uaI4AOAqcN/IFfvCtP3d6XXnCuj0rfN+64Mk5z
 wkkmbUMy/IZBkPt6DyqvSR0Gr5Sp4k/dEpZ1O8ds3eGlJPAGAh0XBHRYbESPn+UT99A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554696;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Yxuktpvgm2EVhUVLZyUmG0uZmPiFIny1x96Qs26WBPo=;
 b=XyR9bEg7EzRN994h0xOjwI391bJcx0O4uMd+8CL7CCNC3jcm/Iv7oToPsz+vWA9KdJkz
 jlsAQF50qZqUBqNlyjgEiIkUjNgtzkEk1fKQjabrZ4y3RaEShYasAkTdYRkSIML9RxkXM
 P6ednOX4HrvoHaSX9WyjZnAbMxljKD2jaXkWCD8t3NytBXPXgl7Cg1AfqErcVizI4/zST
 VNYQPyjhXs9Tf3QoPLQp0UQ2X+WDi0lGBbH6fztPUU/1lXvFvTBXv7r6pn9No0dHHxV/S
 gWiG7VHlS0x9QvkoJnJi0xEXC17dU7165W47aCqkIop9HakYIT0xSCnY2DKNS2YQa1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h1Sni68M; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E35DC6060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:38:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D1443B00535;
 Sun,  1 Nov 2026 18:38:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:38:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:38:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031201918.2850153-8-james.hilliard1@gmail.com>
References: <20261031201918.2850153-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <29bec61aeb0c3e7c60dfe80bf005c2f2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-watchdog: bump to version
 7.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 21:19, James Hilliard wrote:
> Update the COPYING hash for the copyright year updates:
> https://github.com/gorakhargosh/watchdog/commit/f3e78cd4d9500d287bd11ec5d08a1f351601028d
> https://github.com/gorakhargosh/watchdog/commit/c556f8c26c73dcc411126d8878044897645b1878
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
