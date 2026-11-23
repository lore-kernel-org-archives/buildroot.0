Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333E606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VN11lj2t
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC1A40721;
	Mon, 23 Nov 2026 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xymLHs0Uw5DW; Mon, 23 Nov 2026 20:41:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 14BF3406E2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795466501;
	b=H7QEx6MF1RBaPlCllFO5sa9nKFvT2ocXKUWNCaRPiHHJL1dOzGL5b6sMxd0EyGWzco4E
	 NTkaZtyxm24Yo2xXkh6gBA22PieLmm9bokh0zRFY0mvcTy8gyV7HZPpjKpa9hqFsmvTxn
	 WPPhAvN56N/k6lZnoU8Kx3EGBaW7uqmXGGkrEYeyBLWg/yhGvtVckp9PTe+214LQIE/Av
	 9QmyYYfwZQG5otO452a3a6AQG7du4ijfCiVN5iZMapjlNzNacPCFHDT/PYcmgLwXW5ov6
	 ESLXeqGZYSAJkCjVMAKWtT23nwleFdgWucZtlbkYX1GuYcOtpfx+TuKxuz82LjrlUOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795466501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kTOqggNsqDy6c9jzUlPBG/wyeWA+27DiAf899XeeyJ8=;
	b=q5gdcROmRyyndxmWZemuUW4yU1tTYzw2uEL4wpMN7VqXt/8ABZB73OGNdL7zTyMBPJPX
	 f0WzL3TFhSdHMIcOLin7YW/tjgCqdJq/BxokbfXmKtWKIG7OBMV9F+7V4DmASooqh3mfK
	 LdxpFJs+47wYkZGqmh4YYly7l76Gug/nOMxk3Nsck0qA4gNWn/lpkYf5vfNagDu7tQS2m
	 cz5XLPMccqvhSMCsaOH9gYJimieuUflz6RX91r1tAHhZ7vaubb/mHzTYuH0TYjxdeX2wA
	 ejL6PzaFhQEu+VN6pPjw/7NHJBt9MglLQtqqk9kQU3MP9RcJqu9iE0/+LOwjgZILnrg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795466501;
	bh=kTOqggNsqDy6c9jzUlPBG/wyeWA+27DiAf899XeeyJ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VN11lj2tJQSCC3K8a+IvVXHGm6RIW/lz3wfPKIwKtbUOVCv4ypWe94JRng1Qozuqd
	 t7J2cVW6tUgbmFVu86as1ioj+/xbAtkxnThHn4dD7cqHImGblOzJhPfur1rCQH9xrS
	 APb46Ue/kpNrNJCgRosbGm5kIQtg+/T2rghJwCmSZW7wkc/zz0BNyGppPfQqVGV3rR
	 MoJm6hVUoXjMyTuPzAWZzWO9zv4lrvbUZ7KOV5By5FP0joY/1r+0QDzIHkuQhn7yIk
	 3cRhTw+Kuj02YQrwvARlI1DnnD10DxNMFrvKGVmSxI/6liW9HSvLI9TxaeeuoiCDjJ
	 KnVESxM7J8MBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14BF3406E2;
	Mon, 23 Nov 2026 20:41:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A61F8371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943CF406E2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f75zmuUor1J1 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:41:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 11FD1406E1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11FD1406E1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:41:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5267F2003BE;
 Mon, 23 Nov 2026 21:41:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 21:41:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 21:41:34 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
References: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <9fddeb390e49431fe54ae72e45abfb43@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH/next 1/4] package/harfbuzz: bump to version
 15.2.0
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

On 23/11/2026 18:46, Giulio Benetti wrote:
> For release note, see:
> https://github.com/harfbuzz/harfbuzz/releases/tag/15.2.0
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
