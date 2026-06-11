Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF283CD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFAA8219E;
	Thu, 11 Jun 2026 19:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYjczjjNKXqa; Thu, 11 Jun 2026 19:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4C18219B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781206938;
	bh=jcH/dvKrx6DiNpiVBFlwEy8Z67mT4qpZSE3HmbKh5+o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o2C+KJjZuCmtVGGR7gTF9gJ9cN+NDoW+LZGEPQA48ewtjzjobFvBXagu8yKPt8biO
	 MR8MEtuCmfkMa9G99drNb5+rEbjBvSinm1lbTQo60TCuaJwvTX5GdtIJeAfIirX99A
	 kzaGbKAIKb5CJiwqBkT7Cm5e8h4S884J9PkFd9gC5G3RyNcGX4oeX9eOz9BF2Q4VT0
	 fjqstT/c9z0xaGdlpg4DaSPGzyQ8MIrfAlJBjw0AdLstiAJoJfmcBmOsSOFXLVMO0U
	 RDrqaHXfw7PGwcwBN6HXnSvBz+I/6qZcLwhTNMvGWnBVqoltMLpRoq3lNzCQxGQoP/
	 1Jx8yAT3OPuxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4C18219B;
	Thu, 11 Jun 2026 19:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A510B12F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87AA38219B
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHjnk6w5nWhI for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB1A8219A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB1A8219A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB1A8219A
 for <buildroot@busybox.net>; Thu, 11 Jun 2026 19:42:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0FA1013F8B8;
 Thu, 11 Jun 2026 21:42:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 21:42:10 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 21:42:10 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260610064625.70476-1-francois.perrad@gadz.org>
References: <20260610064625.70476-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.16
Message-ID: <584089ec1f6731ae4b3df5fcc34d4826@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781206932;
 bh=QrY4Ql+hgpWIEt3QJK1lwHVbQKZkf4DjL0atrVUpqmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ViXlqMfgFsdKReAfJgykDiINiyFyFbOFXepO79IyIievNQhyNGAqD2Ep3mmcUXuHM
 hS58equGpUzzL2r4wMj7/Uzy2GUI27Q9jcXaJ86z22ZPbyjBkSdsscDP09zwD94i3L
 0f3OpXWKD21cUr0pHxRC87jGGy7FSv+/yVa2zueL0U2a29xfoGL5iiVz2OtE0smIGR
 3FWR0vPCDPHVoREgg3y63PQiS9zMZitgkKPZD9Hko7AXPujksAEfgsO4Xai7fPYbcw
 fhL3vTf7FAa6I1VWwNceMagm7sb+xjm8ayMcbUOSD+K2tEuqg3lkEZhCX0Qs7azyyO
 4RVOJ/JnA3MXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ViXlqMfg
Subject: Re: [Buildroot] [PATCH] package/gettext-tiny: bump to version 0.3.3
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

On 10/06/2026 08:46, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
