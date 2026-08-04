Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46ECC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8B060793;
	Tue,  4 Aug 2026 21:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6yQC4_T2Mq3; Tue,  4 Aug 2026 21:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0371606C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877514;
	bh=+LOzL94PUImV0BdRgsGJqyP3KzcpfrjRLcLma/UapFM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JLsvG/0Gve3m8JOvKkLeCT5GTHkTfGDljPuEtv65FPzN2YptOyHaTnB8FXLshiaGg
	 UIeL6rPpV61amssrZIbszb4GZWqN/pdLde9rN5vjz4aJktUoWCrNPKVTZnJFIbPPnE
	 eF3XRsbkehwcS9Gl1QbiFurQLk9t7Du318Dc900PpLRY1CVZqEnC8bl6GwNRGrgnzv
	 HNyiJeCwLtLXBPYSkdCKgNzB64VwnPtn7gynD/ev2YXl47mQjfWm+FichxnxxdOjEa
	 NlMnwY+MvUP832n2GBxP0hNg+XE/lBlRDuXsNs3bLVDRvgeKSagihUaar8VA+CFEWW
	 2YNhcz3Voe2QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0371606C9;
	Tue,  4 Aug 2026 21:05:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4593270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7006401DE
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVJhytmuYnhY for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5793401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5793401DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5793401DD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:05:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C135960143;
 Tue,  4 Aug 2026 23:05:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 23:05:06 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 23:05:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Deividas Puplauskas
 <deividas.puplauskas@gmail.com>
In-Reply-To: <ajACxoxP8phONNg4@waldemar-brodkorb.de>
References: <ajACxoxP8phONNg4@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <fc0da6023dd36211db2d7e791f866411@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785877509;
 bh=uFzRgGhB1yEoCxddAErNrfOR/hWul4UtoelnJqeovys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fhJf7p0rV3himvFcNTSqBicCbOBs6QOUKqXulSS7hFLrZz4ecq+CxAV5iiLyW9kvD
 Yjck6JNlDJRG2Yzy/lxUAc04WXwSGJYdiIlaFEL4Fu15exdYG3KqbqiXC22ijiDq8w
 lbXOT5rm8R1a4vL+Idqfm4j0APBjwcTxWCL2L7GhS6QcMkdzn0QzkHboAbvfG58LhA
 GaaRNFqcdD70SjHNjjpZ31ZiDiGQhQgzTZ60Jnta+rUirikb0vqLCDqIqnr7YM6rgl
 1b6ZOEa+k5Q12a6gQkWOOLfVYovqk5SvCPC0RTXK8gTPncnuqCe+rMqKmRYr1bbQ4r
 drmD6Vw6CbykQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fhJf7p0r
Subject: Re: [Buildroot] [PATCH] package/perl-switch: new package
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

On 15/06/2026 15:48, Waldemar Brodkorb wrote:
> From: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> 
> See here for a description:
> https://metacpan.org/pod/Switch
> 
> Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
