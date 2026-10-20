Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03103606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cfHNypOw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=a+sraMUx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8D6810B5;
	Tue, 20 Oct 2026 10:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFk5lJrI80J6; Tue, 20 Oct 2026 10:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 125DF8109F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491662;
	b=AETksa4ludgJ8ZEekD6Gmet4YSbBzINBvBSJyux6UaO73qEhyhL35spyBERfALB2y/i0
	 HzGn2fjQ7VvQCJhasZGrtmUGHpI/xEjoBQ8ExhBU9fTVmz1QHN62wqUk46em8DoNflC4F
	 HIflA+IDt/yHh8kGEbLae01knItyN3k8KhKSBhqk3FCYbUV3rXqrJCkQpvD1BHupPYSYe
	 YNxdAl+B7UgNLr5/0Egr4BnTmgy7vm1iyMKHDNO+VgaI1qGPiVzf2+nTCWuGwtIUQJQUV
	 wzhyPiUay4azBdBudPadzOKhZSPI/R2eO1G5zD+ulEDWqR7XrXC6SyPCzNcqCxW97NA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YxJIqORvegV1vqFDrBcSnLrMV2EjFiMi7UZorH4GVxs=;
	b=rBtHIeUONvlWSWYx/7LFnPKBWspAeEvsEEQLisYDgjyFgm64t2eMnUblHI1mWhv3cybj
	 2jxgmPjQlqsAvseEx8uU6545kE4GbPmJluoTYAXWKoyBPzTZZEuxvHgn6kFmlfZ2mC8s2
	 V2s0E8pzEnW6+XWf8e3/7cBcYfGFqUXYGZzO9bp1Mb+TJy+AMunv4sfotBTAkHWturSgo
	 TwPQeMewzFmjYEZAO+Rqq9buQSDfANk9eWa0PN1lse4YdSKVe8CcIYGc3eHeUbTqBW7Ui
	 zc5xLlsrsJgng0SxZEEp9H8cJNvEERe6jSTdz71sWqOA54dCGGV43mQwdXJITFGCTdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491662;
	bh=YxJIqORvegV1vqFDrBcSnLrMV2EjFiMi7UZorH4GVxs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cfHNypOw133kw10RYIgpTdMUoZE+IqgFszPnK/J0G816go16KC7fGBnqR9dmZE44x
	 LNm60ODloYIPuoKAzfQG18z8QhaRqHln82z/E65JE0ItV2LEwTk0ZnlThuFM/Tanh9
	 UTLSJqNK8fhQ+kS0pkeMct/7cxsI8LTm0kR9uDtSfVkkQl/XXO9fMDr0YwKfQxXtO3
	 C4b/xGhm+iahDLBtJhAuUgxyj1OnsUPsWe9Z1lo4BkFYWjAOBOGQ3HKDStApJE5ER3
	 GENFk/J4ZxZ3qB+RgC6FCncamoh7Pw/yHFztdrZclxrqkY2ABIQrMMYLZadYMY7HW/
	 ofqtyRRVl0Kvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 125DF8109F;
	Tue, 20 Oct 2026 10:21:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9DD3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E061A4016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xISpDzYUmCN3 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B5C4400FC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491660;
 b=iwAS8qvOO1O9+BtWB5K+T8p8hQppGxQrwTWCSQaL0ZWKjxI4X45++8tb15gCa1M3yY7o
 4Ayau6mHU7mVOaxASDXlD0cHdFe9j5Of6YZMpOvDt/1+TMAsNX8pGnCxuJeeqWQkO/6Hd
 6wRhfFCF4NsD1cyEarwNlhDnvrNOWJxcBarU4hFNqZuIWerU6qZt2ajeza0RkC6DTdaFm
 3dFGwwmbtiOBrHiHYz1XWfyHDqscEj0XPedF0pkgpAON0IFFXoAYs7pY671nywoL3hvLq
 S0NOHC55ieo9N3rEvuWbkFLTgf5d4c93u/w8N0lCB+X0Q97FMwWc+uWpVNgSrZYKPIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491660;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=sQ3ueYKjF7SX2shfijG4z4EAv0/TpVTgBwuyTK+erZ0=;
 b=sYf4rviEjhV4sCch59efCstpeLBwIOW1U65jdzwOECwLDEEaVkiyxJ7+yd7atOkKWBe+
 km3n245CsJhJUCHhQZYpYTwSSOZMkUYU/7HisDwbSk+owgSw9joH3Ct0XnfIYhriTX2xn
 l9/YfI6Ug1qACJl42r056HhnEDW2aGEtyHV9RaoBUGvytSmATul4HA/NIS4njP8KjeJ66
 ltks4cE8H32u4zx8h/t2rU4ByXY1gRzTnUq941cT/Oslp02r4xb3zZF7cYOAVgOhpf0Ql
 +oDXRAl3+5X8uW8WMBBeqTulZaEq6T7ZK/q84P14FuYEQRL4XDx1tXzB/+omTDlS8UA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=a+sraMUx; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=a+sraMUx
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B5C4400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:20:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=a+sraMUxKPlbsg8vwsEAqGZ97v/g569mVpJ1Q51o/jGSXTUU9YJU2KMuC6ixyIfi5EKrWro9Tcjfp2+GIsYuIXl5J/UMjbc47XyVcdHwS4wQNgK0VenvSEXmfpIsYDXJay+2utZQs/UQYtdcJa/lb3MUxOiAwwOvQmTmKI9q5LCrdhwYbjmZl1TC40Cf1FhV7PmsBlp2pNrPUEq0weJUb/C669DAHQZ6opHvac/RSRzXQaA6xRNvH+2si9btSpzsc/4wSmVMx8NiT7InKJH8mkMfpKxLq7mf9pWWoOMi+sqqnmBrYyIs1Xgl/bpFQNJKiWW8AazVWYtKq8QbWM/ASg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=4EUwccNxS9XsPPj36UFsplEnauvyYHhMa/88Cp5Ld0c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -666403234; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:20:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJ6xl-000000081k8-0Z4O;
 Tue, 20 Oct 2026 12:20:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261019072335.575107-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Oct 2026 09:23:32 +0200")
References: <20261019072335.575107-1-peter@korsgaard.com>
Date: Tue, 20 Oct 2026 12:20:57 +0200
Message-ID: <87bj8od65y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/freescale_imx93frdm: bump
 U-Boot, TF-A and Linux to LF6.18.37-2.1.0
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
