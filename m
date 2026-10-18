Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF6CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AE38121A;
	Sun, 18 Oct 2026 10:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pfa4l4y9ePkE; Sun, 18 Oct 2026 10:38:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FEBA811D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319884;
	b=DLDIrVfYJr/sXWvud41/s2ls1p0QlPWU74EpuFuuCQW83Zi10r8EXvHz+9sbPy5wKc6E
	 nTYNquol5Ud/JRWSnsqXQWU2LXIvj4qXMzhAFXVR1vT09kGqR4LuWD2yBJE/2JDJ7SvLp
	 cjW2DFNrFS6Z/K841c0VmouwmOfGYvX7PakPZ7bavhOCzx/BEihVE25hZBHQ/9Gk7/3RU
	 IQ7F0gDwEjE/4yx3C1/BTx4y7n0u65IL9kJ3F7t5r9e6qT9HQ3136rANele42jByJaGtP
	 hyep3cU7K1ErNRA4BMDxybQ69TUUHa9VWTbKPgW8HwHRhL4XViJT7S4CAfpqVFGErMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qzngchIbSb/ZtaY9kdFwgcJwT3pPCeGa4Eoq3KhRq68=;
	b=i4tl0/juQKzjy+qsLwBOZWpkpjFYqVv9oRUwBLeTrWj9oPx3nXauQa4aZOf0MYL9yATt
	 BtSzgrzcoC11Ls4X51VRnWqsTJ5NdtgkgY9AhtoVPbpN8Wfy+T9U1KzSt+7hQZm2HnNNT
	 tSxEu6FTr8q4gu8JxizNNnQVPWSoDp8HyPgXMvWzASECLP8Lmh/Orc0RqrUOytkTu9Pel
	 sUmNlWv9lltoTg6ohd+hZrLRdYvip25Jg6h0El9utKBDEatwhEl7vn5cF9K5DgnRuhk3T
	 4mZNyld9WtQ8ltchmieB1ZUmxLCBZKfUoL2SMFC1htW9Ws/oHF95KeuAJZTEltF77aw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319884;
	bh=qzngchIbSb/ZtaY9kdFwgcJwT3pPCeGa4Eoq3KhRq68=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AttbCbSnf1Y0XJVqCUcKy1DgoZ2Oz6S4xvME7E7o+tnwpiNEXBtURnfaN59fG7d/K
	 1cYi9hOpDznTfQ2q5AMmbqZdpOrE5fCc8Bjd+ZKDaADT8HA7Dko9tAllNBsxQyBDKx
	 M9cPAhDAIXEf7r5YS+hFDB3S51pkODVYaksbZCbh8nSSsxxMvfwL40DXx99QTLGRc3
	 eCsZS+fUa5lEkAMneCc/xZFsGhOz9TtWeaxDM02isotmg+yByeoSUFmEDjeQ89mlJ4
	 ZEy8ypCOmL/0XK9zJC9JldH3b57X8fsD1Km5rPy3mlKnpnR/2asI3+kboM0plOb9k+
	 R2hJrA/PDlemQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEBA811D1;
	Sun, 18 Oct 2026 10:38:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51F7F2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4367F6061A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qtp9ErbHJyoM for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:38:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CDC8606BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319882;
 b=FbJSLTaug01h/xUOCKYsxWq23ddoSjyIvEqXZQymSmUIcblykHELKZWuODvyCL32mMHn
 mFuSuJCtfY0oHV31mfudc14xoUoQaT9Bn4xFBlVdzs7zC/SyojhrOTGY2NJolsE1M+bFG
 RWROn2BY9wzFXtXz5/wfY0aCju8ojLPhIAkhwIj9g72TJznO+fQ6DTtBY2aCro0dx7j/a
 E0qV+21fJVhZ+tQTqAOBRqr939D6vZolu6Jqf/a+SNXpunxhRiBC4+e61p8jRhIxMoK62
 f3oafbSl41t03Gz9t7w7C/O2HwVuV1gfo4VouKopycA1KMHyM3QiTQKNHT6tPNQTQKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319882;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ttjZbSrY8j/92MxUww/SFGfDMk7v8d0RnF6eZld3yUo=;
 b=X9qIEHrfLCOFsMZTMUn663J2moJ4p9CqhUAVbmnngr90CfbCXWeeA6RQJvOXa/ju6A+6
 Y/HfG+URMv6hauezSnmUPZxQKQfJGw0bQ6pbLHGtSB7PSROV6Zk/ZnJHSa50dlRlS9+83
 HV3kUofCE8hBOxOl6VezK/JW9zdhJPx941ZtsToLjEmKmVi4fWZCRcYHX9xwPSSNWh66D
 r+ftyksWtvuH3KiBCn8Wm8f6f95ngJu+TXHZbEBnwgWzSnuOxKaGnE9znmis6FPFSFpSn
 fbu6CFc5Wq5DcHoQhVprl6M/Cy4ZfmcR019Zlbc/PwpR6xt/yyqvMpDPvanGHqye07A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aMRzSWTy; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CDC8606BA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3C5C278035E;
 Sun, 18 Oct 2026 12:37:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 12:37:56 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 12:37:56 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261016094938.135839-1-troglobit@gmail.com>
References: <20261016094938.135839-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <85a1dae61cbb9386f230e6f398db54ad@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.8.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/10/2026 11:49, Joachim Wiberg wrote:
> Adds support for injecting structured data when forwarding to remote 
> syslog
> servers:
> 
>     *.*    @[ff02::1%eth0]    ;RFC5424,sd=[device@32473 name="kilroy"]
> 
> Also, a bunch of fixes for, e.g., UTF-8.  For the full release notes, 
> see:
> https://github.com/troglobit/sysklogd/releases/tag/v2.8.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
