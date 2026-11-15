Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B908606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DHxZVtj7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1B960628;
	Sun, 15 Nov 2026 10:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qc7hk4IcZrT; Sun, 15 Nov 2026 10:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BBDD60634
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794739268;
	b=qYD3wkhELgAOzaQ9zPfLjHpAF6EpWn+ksWuBsVCSyC4HjAcQ5etKmE9WYtF0WX1dQA9Q
	 5ReRr7pWUfe/mSZIEZcNf/GU+xS36Oypzp321k9GMBi0DEEk3d9fSNmilO2T6wbDZ6fxd
	 JsQ7bEyp2M5JKwbB3ig61tBv8kVsosxntpTAhJWrfG7FR/lfWBW8mYEl7evlmmcR/nlNi
	 RO+segbIpdSmqjmIz+lGCmmGm9WvhbDElPTH9FJQfdxmTjydk0ZLVKOe0qW1SrwBauJCq
	 695gJpw80rx2/rTuN5b1hS8feMH4Hp0OnsUc66v/Jwil+fGRgCkleFgyxeY0vkz7DHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794739268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7nb6ubYPrMt4l+iW0oI+Ha0MOAjzI4cfHXTl+Lzp4ok=;
	b=kUciABLdAdOm/e1YW6HHIEvohDbJ17epZpstUX2ia+zazvLQvLcDhis/0Jnmgd1XoE7S
	 QUo9KFtG1Bn2IhNS9E56f5O/seWEPIfDeEjAs28e9dvhPAXK8SUh6yCdrZD5gQkxENeHO
	 LaWMnVgzI98GbijfHifai8mebP7/mR/8PQSwDkw6nG1pI4oHmDNj/72EUwe2leb9bbwCQ
	 Y9IMeviAcKSDq0TBHznWVllln6XANB/DokMlZIE2oDBZDIyde7S16lDRAgebyTmYkOgKg
	 1594i5OhPCOyldJ4MTwMrRFE8aX5vgUoh7DiEnOIwotOO0X2tbwXD7T2y3mrjFUnTaw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794739268;
	bh=7nb6ubYPrMt4l+iW0oI+Ha0MOAjzI4cfHXTl+Lzp4ok=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DHxZVtj7H0rQwSzgTyAk60pZlm7XDEn35CWmmZHLHSj4xYCObEikrmkv+1qdY0xc4
	 crDbpGOJLh2j2+hau3T7rWm/nqp1Ok+xGqk+aoLgF7a1qet9zf8gRgFufGzROlwywV
	 KWDdBx9WtqSowSTROSlKCp3E/jNB101zWEGjdDcs6ivCnUnxyG/H3EdhVdahyqt7Na
	 18lPkwug90apRNE08RCJPAL5H9PSS1QHlWyha7RqQ4sNCOFuGeLtGjq31I9FHpummV
	 1f4C/sg3n61fbY8XexXew9lRyJ+DF/kNO5Noq5mOjGv9H+YA6bltuyR5xxVkS40GNE
	 ZW+oRnqXpCH1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBDD60634;
	Sun, 15 Nov 2026 10:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E12B2E5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DAA560634
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViEEH-ewvJUn for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 10:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D31A360628
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D31A360628
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 10:41:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8CEDB2003C6;
 Sun, 15 Nov 2026 11:41:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 11:41:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 11:41:01 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261114204016.752902-1-giulio.benetti@benettiengineering.com>
References: <20261114204016.752902-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <e35ac002903423bf16f5db54285afa50@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.6
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/11/2026 21:40, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=0a896bfccbefdd5e79ae8ef6061f7e17e20c03f4
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Since it is a bugfix-only release, I applied on master, thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
