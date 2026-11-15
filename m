Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB6606A32C
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qo3hX0yv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=UP7Duavf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5C680E8D;
	Sun, 15 Nov 2026 19:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9ScP2IFyqjR; Sun, 15 Nov 2026 19:22:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B4A780D85
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794770565;
	b=SbRfEutF9w9KPxmI+k7YuRMSQMVfKvqW0ZEoQOpZa0gnHhlhR43YhRxuOHOQ4GoinoRq
	 rxd4bVhDdWebFLPA4mnuOqQI+Ka/IEzDPGsOofGUjgPzDAoi4SIvkhfQXUjr67pjhd3Ay
	 KKrY5n1ze1N/wuAEIYbQ8cW0sms7xNVTXoF7csjXxm3j52D1sB1r35QUfBbCK2agVNope
	 LkCY8TbwkvS5LcuOdAoNOsvLOITEy1+yP1ViQIMHcjDdnnJngJyiIRAban+fjFjlcb9Hb
	 0yOhPpWu/G4EQz2zFPDn7WK+LWYlVmhJ9siE3gQ5gCQupnJ5NN59HmZun9aqRKGN5EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JkwHjwpIQJGIho5nDhGCL1Oqa4PFbXh35MzlWS3bIyE=;
	b=OhHzxurc44fxwpNK5X/9D1oJhur+QDhs/FkibLQfQrEYVkAo7HRLkIt6fr/uvBsNTUiB
	 C2VH1UOEE3c9UiX05Ojxmx/KdaquOt69AngCqVubUtai0TcJfC3bqgRsFjVDBF5H0YEY3
	 SuI+RMQcNQejQg6U+AOXksVgekx77qWd8uVdx5OzT74fRF1JBi8GS/7LDS6EDJNUqdnfL
	 W+5MnKhrjGvHGocsGr/zR/xyKmw9ps17r5/BlcrVz4litmI6e7NldoY1yq3JkwAa92sre
	 zu86fILwQOQVGYHTpTJhua7BvUAcs4bgdn4w5H5zByAsMr9TXCmMjOzG0bgJlMwp/dQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794770565;
	bh=JkwHjwpIQJGIho5nDhGCL1Oqa4PFbXh35MzlWS3bIyE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qo3hX0yvBK+tmZn8QNZY2FIyxUMHJOF/qxmpwiURqoAFP289j7lG3vzW6yyHxJMW/
	 1gUkz0cBZq4UKPNh2riCQG/MpW76IuHIEqNqPmIe5HXxEy5T4y4WzhwZSZT6hbOpbG
	 mQvP6tOTSMjMNLIFgwm87pcZLIOBQJ/V4LjFaB0vyeNnlVqRxYjNfy7riZEVk8fRuc
	 sxumSBx//R+22sIohMr9ZOocDLNpQo+wwO/0TRSeuWj6SVnihH6QcccjCrXA990dSV
	 ck3zUtwTt8z/mrPfSfEAY4g4dHjGpyWAd36Dgm++gPXe+SsDAHo98tvcd+IVt2FUFQ
	 eDqBoQ547hyVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4A780D85;
	Sun, 15 Nov 2026 19:22:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B73109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A90E2405C3
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D-_yYwns3kT for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4175405B9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UP7Duavf
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4175405B9
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=UP7Duavff1qQ/ht2OAb7dcAP8jahp/9x72UX7YeIxIFOscyNLsck5gRVNw5oM2a6oQtEG5e/gX/olUnWtAcvzRv+KOYZc5PRXLYlwIgU1CTYfAmMXSP/02qK/jcCN4F9eB36rfxXm54GbTwrUFPNAN07n9m8ya6qhdq87bettzKwiHmsdslhhn1UouUYrEYBmBlntl/ck7I95BNM0MCMh0aNwxpSa5NX1vZX1V2M87yrXHk8x4ju3Fj42UQjU61n7ganpRtQr8JQba0hsoahLMNBBERMTwa+hd02Lkl6BJhClMduLxO7Xwal9Ir8SQOGLGiyg0Z+b+jUYefzIvu2RA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=//1TPBYhP4C38oy/fk8DdAwtq7PJTrY0rOWlNEYy6Rc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1326719061; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 19:22:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSfoD-000000002U7-2vSu;
 Sun, 15 Nov 2026 20:22:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261114212225.1098201-2-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 14 Nov 2026 22:22:25 +0100")
References: <20261114212225.1098201-1-ju.o@free.fr>
 <20261114212225.1098201-2-ju.o@free.fr>
Date: Sun, 15 Nov 2026 20:22:37 +0100
Message-ID: <8733t16gsi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: test_iso9660: fix test
 by setting qemu cpu
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Since commit [1] ("tooolchain/toolchain-external:
 > update toolchain-external-bootlin to 2026.08"), test_iso9660.* are
 > failing at runtime due to an illegal instruction in init.
 > The error on the console is:

 > Run /init as init process
 > traps: init[1] trap invalid opcode ip:b7da4230 sp:bfffcbd0 error:0 in libc.so.6[a3230,b7d25000+188000]
 > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

 > This is because the test configurations selects BR2_x86_core2=y, but
 > qemu-system-i386 is started without specifying any machine or cpu.
 > The default machine is "pc" and the default cpu is "qemu32", which
 > emulates less features than a Core2. The toolchain update in [1] also
 > updated its glibc which is now including instructions not supported
 > by the qemu emulated cpu.

 > This commit fixes the issue by explicitly setting the qemu CPU
 > to "core2duo".

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/eeec7b495f6b6127f0cf7020674f7853814a6d06

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
