Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52406CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C8040782;
	Sun, 11 Oct 2026 13:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-495_C1qkte; Sun, 11 Oct 2026 13:44:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A82740794
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726278;
	b=Lf+zY6puqP3DAYY4pPT/29eEKp910UQpJnNr4/pHFB7S05uKCkob7Wv3L3DLqHPWYURu
	 8ESZZSGc/IEN5/bMKZm6FLGVUtxJiZW93JSxzOP2TZYBwZT3p53vm1DIb7t5PwaLYuNk0
	 rOo0PycpCEVIHbvkAUiKxvRopVDwLWQctdZAcQbicArf31eyf4PviqMgE28yGR9GuB71Y
	 JMaeEtj2LsMTYYHVG6u0b/5GdmSZ0lnG8+eC0asuuZrKpFQdlP15I6UMUVt7A1QAIgYew
	 tXhszli8NtQMACTCltCMn39jdgibtxeYhfmBWK/E65gDfdGcY/AjfR0DWssqIqR8mbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=fLaWYK4Fv9p8VnHkz/qnPNG95WDgN0rX+VfyOll9tg0=;
	b=EFbKqUGU8Z43rHkPKo36GNH+cL3KcC+3iYQoy+lnP+Znfgi6mvTL5Mroui7UwC0Wss+E
	 YdHmYEocpkGdxaC7QS8SCOfUe5Aw8SJRtKIJ8JlLSqxYWLcggmbZgXKwg7vxWccm1ufye
	 IG2BoppHIaiCyR3Z3NKwHbJ0sqv70tja318yHSN6BqaMYzu/9/0C50BSqyDAzSR/qvyL0
	 1BlsPN5YH5wQ+8OA3bNzlBOSua/aMmgN9pFBKKbCM+2OCBeJrmIyadkr5l8koPTpv/HsE
	 xSM4/T6hDcDhFFPBuggTQuqzwhQeXOa2IFqY32QB6b3bPXm3gM+rlMuhqGteKsb1KTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726278;
	bh=fLaWYK4Fv9p8VnHkz/qnPNG95WDgN0rX+VfyOll9tg0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=lRpsXrYyFFcks0bSzzokIRrJCGs+2IxvDjTzEkiwWAh7/Us8fjdOHTepBE9XGlMWg
	 DdaO8MBs3JptCc9w6LJEdLugqmqmKHuQ1cZAmUpXM6ncuQxaucYVNBYujboFcm0GFj
	 EdwmTWfUYQ0BzDHWaPGTxIp/e+s7juQSyfnd48YXwNH4Oj7OUxaCsZ5wnWLtRwlDun
	 igsx2uso9AHToySVfxprzG/xSovd+SlifX9kgCVB5W66ncCVR89ObhwoeRW7OgYDl8
	 KfMFaXK+wxyXsYY/zSVT05SzZsc/DeNwVvGUobLTPVAXh4SLb4XY1pjIN5gnP9oqHU
	 vY33SjzeKGT6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A82740794;
	Sun, 11 Oct 2026 13:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 764A475
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C1AB60622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huvuUm1BgL8r for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:44:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64C7E6060B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726275;
 b=Qfh3lAI5zft+TBBJPKeALsNHLM/hMg67p5MuHx/rEkTI/zK5w+u1fGvw7t9C0zp4ZfOg
 hE93uRpngk9FfSSzMRR8QpMP9QL0664eWcUnTIkUSamB3f64RSr4rRMqxrH32Oasa3S1i
 ZM+F5ppSAc7itLXTLq2HmS9WKqdArUpTtYsQrwdC+0QMrftQQVM5tBp3o/MgTUMTqGz4z
 wJcNTfKayc6PMvwWIpstul86GAYsaBmkx4KOZlqiTCDLIZO98mQ6TgkYZvfJqtGxlnZhC
 OPpJUTnqoQGjvnbjOUbt8C8RsSV63S1esg10abWGbzwq5sFKViH6txitqFJ28QPM65A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726275;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=UegEuOoTn25T460bsnspBU8WFFkuswwFgKBc20m88Ew=;
 b=GMNXqhGOoTFWNZmSaA3hFZ1bjHP8CMZLxUg5TFtteqx1tPO8YtE3q+AC3wDCOEuFypMX
 cn19g5GX7nDeILatvaE43OjwV7vP3PZfxUzVmKmixPU99RTuKolPbKlRL6aUqZoBhUPeY
 WvmAmZ6fO3vF5NmQcpxLqslrBuCk+sHn7NFtkjvoH7Zj0k/NKj0TWKhhvMeEnqdugOaC1
 eRESSndehezlvIU52GrUYPr58Efv53JGImXIVpGwXeik6DE78n3KS7HWdj5PE4+ILQV4a
 j89LLyjLWXdhPbqRzz51vO/FWfjmPF0WbHNa6atURr7/42XDEMCSjXIlg8OUFnSx3Cw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=StH+BK36; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64C7E6060B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:44:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C7C5B978F6F; Sun, 11 Oct 2026 15:44:26 +0200 (CEST)
Message-ID: <50815d8c-83a5-44b3-b9c5-84787f0c2edc@rnout.be>
Date: Sun, 11 Oct 2026 15:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261011130058.3443432-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v9 00/52] Bump libopenssl, python3, kodi,
 ffmpeg
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Bernd,

On 11/10/2026 15:00, Bernd Kuhls wrote:
> Hi,
> 
> this series bumps libopenssl to version 4.0.3 and ffmpeg to 9.0.2.
> It also includes as RFC the bumps of python3 to 3.15.0rc3 and kodi to
> 22.0rc1.
  In the future, could you please:

1. Split the series in smaller series. It's much easier for us if we can apply a 
full series instead of only half of it. And the openssl, python3, and ffmpeg 
parts are all completely independent of each other.

2. Slow down with the resending. We're in the middle of applying (parts of) it. 
If you send a new version it's very confusing for us to find out what (if 
anything) has changed.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
