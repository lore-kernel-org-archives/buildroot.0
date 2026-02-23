Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB4FEC113D
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 21:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70E6612BC;
	Mon, 23 Feb 2026 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jd1rlBqIi9M6; Mon, 23 Feb 2026 21:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C565961293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771880826;
	bh=H6tVNbXW9P55FtDQQUBjRlrv2Le6VBOj+pjWGewtmrQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J/raMnkdFfwk6GXlSxvXSssITtqFJOBWcR4DmYaEv89npnaEB38DRVV1dcMONL+l4
	 +xWsOH5c6Efz2JeOE+YfhRZQXoGR0uJMKF/QNYMCMQjUTXyaAnHDcS31oZ7SyW+0qZ
	 cYZDtrr3xqbSs79XraQS4ZUtw5F7jJ/SlGW6tko44cTpjKPA6xOoe4SV97ThipO4hr
	 059/4Q/cr+Nu8+ZsxObjyD8uc310yILrg5Y9Z5+J2PWt7lsQC+c7IPMgqpW/Pta1S3
	 pitXFpusmJfw8HTrnP4CuM8y+3uRMyP+a4oJMjaRNEFmDr+ZYV1fWFBpL7XXOxHxHX
	 MlWdFsMxVLSxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C565961293;
	Mon, 23 Feb 2026 21:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA78237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E6C40A83
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H9nVVItkTvI for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 21:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29D424083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D424083B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D424083B
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:07:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E23C9B0053D;
 Mon, 23 Feb 2026 22:06:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Feb 2026 22:06:58 +0100
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 22:06:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20260221165149.3917530-1-bernd@kuhls.net>
References: <20260221165149.3917530-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <80de8fde0f03e1b65b9fafa1141ae612@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771880821;
 bh=9TN/uxOI/UYme7srkRoAgP29bWTRrwM0USq5zQHO7vs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mdw2Zu+1gHJbC6tGQvYPa6T7FEEZa7fU6ozpPTgoD9RdPArSYgqojUusb+aYWk5vp
 vNpZZ0WFOX5McilK3fXf2Tc3UWthdMaDuY7nH4ilROxoZLFFo/gruwxg4RrSkFIBRv
 pWBkKVyF4wGfgk5cK9TCGOCbNUzLKymr+hFYg6R6+Cu5G9pnRleUNzgnsTYHkGooLW
 HjhUBNkJeIU/7dvPZQRfLh+Pxz1DOnCEL5XDj/ANP5lUTsGTIZL/OZALp+8m6TxT87
 Kc4y5pKM0CZLYitjLfxvIkcGz+LbOk6eUTB/WGuxZXVEmqpdFlfICjlmgfv7g40BLA
 siSlxk1TRnWUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mdw2Zu+1
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: fix build with gcc 15.x
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

On 21/02/2026 17:51, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/8e8/8e87fc05c41eb420a026a7df86efcd9662b74353/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
