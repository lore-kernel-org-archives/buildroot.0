Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF788606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p6TMxg2V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=SShN2Ryz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C716075F;
	Tue, 20 Oct 2026 18:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYnZeI_kRWsI; Tue, 20 Oct 2026 18:42:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B467A60773
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792521733;
	b=NW+obFGmXGA7tFdyO9TJxYKNIuEwmQ/8mhzC8/AInMb10p9qNe7SlqHc+/YQDRs6PnPs
	 yozwa9OVVepBEDv+47ltsP+FbnCJeCuZ4zcaeJon7NEdZ4+jZntMJYlOq9vJgWxZVO1VJ
	 G80sMw75FHZUFIoOc8MoGbfIHHokwXGcOVPKEfJbxmRl7xNeZduRJPBRpcz60T6M8dfHu
	 A5nLfKHJia+gyD9KdUZ9wxpiGRHEuzipoVM7WRDPaOnOTXKKxg5HCURg4D1x29X+VbqxU
	 iD4i6eDfc3UF0mq87kais1kWZkMnKtDCh8iQgQZnW9vojVq3T1f3+RW1pLba9gu51Bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792521733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=efsMaQqQsu7eECh+HbynxC2aX9Xwkl4mrIbpvI1dfF8=;
	b=IHGOHKLiBnfiB1gvNrqBBUzXEq/bUG6irG0XN6ERkYeMDsvGF+4GAHIKWhhehkUxmAPl
	 4mQmm2ulFOZGK0zUyWIE1nzAvGZeAkSH6eAQDd14TJT/vd67Ff6Ajou6o+LJhbYXYHeZJ
	 7Xm+9cCDvBzxCHOwa2s+HT46l0L4LcmxU6kVY/OZSMD+Qx2bNSb8juzudUQFB25JYV8Bg
	 ww3chwmdtu+ZHmtESKpaEdOBMM8JxJpidSyqmG9wsQlKB2obraHG8iQMfhHCLqR+zZd8q
	 0ttkiXdCdKB9rQVupfiVeQJ+T74nXT2DqJsALLDko4fgAVU1o4tLpw1cZZU1MmYDVTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792521733;
	bh=efsMaQqQsu7eECh+HbynxC2aX9Xwkl4mrIbpvI1dfF8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6TMxg2VTVnN+x/dWSRRv9dwDGwBEswiLTDvYZyhjIhKWrQJRsqTwLbKzwc3ErqoO
	 xBRQM9sgPEGagaM1sK8K9sfAc0E7kpCF+4lVGFRK9BY0vh5iFyDRY78CaJrCvOU6jG
	 RCajPJ2R0cqEvvsImtLlc6R4ZGk48h2xYP/MzyQ+x5Ffglk2tGzBxzmnbLSHKXDYZT
	 qcay5ssQVx0UiLJSvM0zZgEAQhzqImY6SKtLAHPcmiHZ0F2sbq57f2Tvs/buqo9d1Z
	 50SqM6xSATOdRRK1v0U/dviBuKMGxj3hXduEY0di0BuLQcSpguGyByG+8IAz6F1mCy
	 q3xYn5AKq7XAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B467A60773;
	Tue, 20 Oct 2026 18:42:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F96B380
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8563D810F0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgpc7AwcuPMx for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 81193810EC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792521731;
 b=oWIeF1vu4DQ88TUMbnNmkDonoTa9mCnjlV7CuUWjiBv4R1ZUBPMSBZWIg7IHENB/cHIx
 27cbbmXzq1bqCxuoMtYNUGV3hyr5U8YSBK65R7YiibTH+sz8dwkffZU1BHzpeUVIfEqEr
 rffRYJb0t1p0mVJIY94uC9mCYUrZEAfh23vQDvtE/cqQfltmJ+bUxFEzirhETQNNmolYk
 YJr6bYelKOAwiYNVSzFsLclmII5NUzAUJZE+zIqHNs0t7z3HT1h57ffF0j1TRBVm4Lyxg
 VuEW/9pl4+5kvIIz6bJEE6CRMqDg8WpiKPEYca+8BFKNNdN5GBeIWwzGlugu5I9CNbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792521731;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=tfnL6ldXT7w969Z617v/IzLG+jqiPFJAlvLc7ZSlx5Q=;
 b=pa0qk74UREHqoxipuUJkVtItuBjedgylEJCb0Cqxp5PGvX54hnN4i6NT0EZOCrg4q5XE
 r9AL3tLaFjsV+VmbJDJJzBS+IJPVFxWnfioNvxzgUUpG9K2EuRFPjRPV29lS/IJqdfUQ7
 vI/VVNKIOMMqkC4sh1YD4tKipiseCMnxRh5m425Sd/v2u8x2LSTMekgrUDp69KeVxbuft
 N+q1Eh7HhlY2qrp45RJBOtyKkF+XzLPlf+MoxOT6ZbZpzGj5lNqgXpndLE/v9JHFcNSax
 FxxMzrGvr3nG0/kykcnX7wLRpogi8/q871SXD74rA7gPV1enOm2zDsHMFqQ/thoMI5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=SShN2Ryz; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=SShN2Ryz
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81193810EC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:42:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SShN2Ryz2OuxMN2YtyteZd8BdmKC14JJhjW/CoiBCMyNrD8BsgJ6BHGvm+ZeOnDHO+5hAz/XPCIEDmkGkK6TOpQ68hTPzKtz0OHz5WpVVJyyQSDsgXCJjHkhDg3zKfdi7ZGc7DOJdQ4RyaYZIF0w7GBhyGzKlxQBI9cOu/kmv2Ip383GrGo/3kRpfRBy+BToSI7zEYGMdz3zp96otaxQKxrym4MG6+RE+3XWoaq0FFab3ZELAfQeBSTKdzd3W+Nrn9BsqTLELc3u3dzBiIDb01JNSd5HCgRajtWkZyK46pAb3vLxq/D7A1Oj67ySrsXaoGr2SarceSDcLzidePfW3w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=qErrSlu5BDeFjjNM3GqWGZ+6Nu7VvjsNafysn/3M43M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1449248931; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 18:42:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJEmi-00000008JZh-0maK;
 Tue, 20 Oct 2026 20:42:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Francois Perrad
 <francois.perrad.86@gmail.com>
In-Reply-To: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 14:06:44
 +0200")
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 20:42:04 +0200
Message-ID: <87v76wuscj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-hare: refactor build command
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > In order to avoid duplicating the build command, use an intermediate
 > "target" shell variable to store the make target to be invoked for the
 > build. This is in preparation to extending the build command.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/pkg-hare.mk | 7 +++----
 >  1 file changed, 3 insertions(+), 4 deletions(-)

 > diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
 > index 14e0cfce5a..15dc769311 100644
 > --- a/package/pkg-hare.mk
 > +++ b/package/pkg-hare.mk
 > @@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
 >  # but in real world, the target "all" is not always the default one
 >  define $(2)_BUILD_CMDS
 >  	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
 > -		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
 > -	else \
 > -		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
 > -	fi
 > +		target=all ; \
 > +	fi ; \
 > +	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}

I already pushed, but this presumably will break quite badly if someone
has a 'target' environment variable set. Maybe we should explicitly set
it to the empty string in the else clause?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
