Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB7FCA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F115605F0;
	Tue,  6 Oct 2026 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHkrPxvLHvuY; Tue,  6 Oct 2026 15:02:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 05F69607CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791298972;
	b=mIAcLhfcb4cKhY95mmjSW7rwdytS4asJdB4vDCNcpMsSvQjQBy2PyxMq63zncgkSLCZX
	 yIwMVydlF/ofJAAaRrd++ahyrup6f+/Y4CQbSYMbZEOgVMtISLVY4g376CYISOgOizC3L
	 RWeve5l0f+nuYcme9uol0trcHZArF2tdniXyANwi/uYlD25Sh4VDMwrjrHNvxejqEIf4f
	 d4e9kbPCsCOwOAFUK6t95eN29hcVSLvsEIrITd5cckiyeuPMCvw2tnQ+NIzihHcdpaInP
	 C1eZGSO5fOYB7pL131FD93lj+lTFtbmMhn7y7wQOwWYUqfx/fzex8MuaU2T7YTibTjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791298972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YuJrFBqyYxUtqIMsE9EBuZVH2KZBF6ZIDYAHlFi+UIE=;
	b=bdqxyOXpncC+ZU9M+ANToSKsXW5Cf9IJBGuzMcYkKlTk9cU821KELjHm9n1LgG4IehB2
	 SVrmZNdGmlVRpD+ehMamMQWtlrPN0QHQQRf+0e020O6ljkwsigh5v/UqNpR4xZZiisaZ8
	 guP4/HZ1KyFodwMN0O278yWlq7uINwYTZZGwc3TSYVRzuJbpMjZseiuT5RELFZSnzcoBa
	 p6TlLr4UFeYfrtyztjVU+Z4zgsfEJHMbhYYfrddhoAGznE2RQxPk772Tdp/QFNU3jqU1W
	 hYKpxSIAaYLulM54J6RwsfB/NHzIvC+8C7kO1QLOjeJgdSgXqQSVY8ojbeIJ3yE13ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791298972;
	bh=YuJrFBqyYxUtqIMsE9EBuZVH2KZBF6ZIDYAHlFi+UIE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HojPoY7AWqBVvro9cTbMitVlEP3m3ypqmULXePE4Rep6HUoWVm5oKHl76UulamdiM
	 k/kDTvf/A9oEdJZUVQ+vfuq/uB/qSENUaV7fggpHVYYFMS7f9t9/FzH0xwZHrYeolf
	 1X2NWNf0WtQnRUwjWjkPNhuGIV3WM3GpgVVgQwmhQMncS77QwnlnrjtohNoT9uPCfN
	 sUgnHQnBlkPw1rQZ9OsT5+v7y7frhcaJDm3FWT7+67ONW2n1/l0hA+gJSK2hxPPrfE
	 6PzXAcj6Myx3i4HBrcUIXpjqXgQGUVNBI9xtPU4ZoDPO6oJKDkyysbLJ6p4310YS9Q
	 X9HKXA1e8Xqrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F69607CC;
	Tue,  6 Oct 2026 15:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6F875
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 155524027A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bkP36NZmNdC for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BC15E40274
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791298371;
 b=necfS2yU4xMLeMnybac9/pgX0IqDBMTucryVAn+VQk8XJeaA6je9hJ2dabIAa/5uv4KE
 FSi70vpH0nmPQtKEMNp3TCAJZOZIV1DDEZsksZrSMgQTt2VaVoHFvV/X4eA5RMPK+hNLW
 gTNTz8c3Tsr0EP89N8iGTP2VmCZ75j66om78WQTzNlBhFTacDj6GYNdBlIyrcwEy3pyUq
 fJ1AdB2VJK9voCZEsHx75cMNWp624yI/DSAW0OI+sKqtmBYc/5bjGrpODn/iJnNjc7Mzj
 byE9EZywhVndv17c+PYB2d3mIQDOrK9cEotUL6oJ9qVigK5NfrFY2nTqcVRx7qzoiXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791298371;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/im8JH1Ls7d9CwXeOIMx1UdTzRzSyx0DHdWLiz61W6E=;
 b=Vvv9jaQwfdwOqJ2/TxobsGm4c6npJbhkLEigi1vZud3bl4Xx17+30vLtGlFEHEpabNvG
 gj2dHNyhLJaOC/AH8D8R1wyvZ7c8TrCm7pC0qIIwMeyEk4WV3yIppUvEVtVkqdWz17nYR
 VM1vftoFEERr0prJXk9+qNHPdwFROLA3PTNH95LY20+s3fGk8RfS26M4prtTJPnYgPenV
 INvAiA2kItSVU60Ae8HPvrMJ34wfHWCdgzTqLOdwB29/leffMcTB5zKxJoqm5OiIbAigB
 pW285hGPaQpFVCLqS/znF5NfwECzW+jDkzfnKWBjk1ol6hxUGY1PzJyw/Xa93Vb4Czg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eiIF9AgY; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC15E40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8480C13F8A7;
 Tue,  6 Oct 2026 16:52:46 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:56340])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 16:52:46 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 16:52:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261004082540.3452968-1-bernd@kuhls.net>
References: <20261004082540.3452968-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <193bb691d3687fb7c81dac989245fcea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/cifs-utils: bump version to 7.8
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

On 04/10/2026 10:25, Bernd Kuhls wrote:
> https://lists.samba.org/archive/samba-technical/2026-September/141109.html
> 
> Updated _SITE according to release notes.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
