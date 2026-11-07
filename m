Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB40606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P56fefjV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103FE8125D;
	Sat,  7 Nov 2026 11:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFdEAMlnZIQb; Sat,  7 Nov 2026 11:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 228D8810BB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050814;
	b=cgEPVQa1MG7sXK0CDoALbvI5hTbm1IGDGfxQzoV335csJDlPq9zhjNBpqfUiVfil0/3N
	 1G8sE+d5XXauBH2HEFNi5iIU1NdssPjalzZ9xR4EVWTDQB16gyG6XWxRQp1BPtVXa1sVF
	 CubOvEyOU4ua8tM3CgZtpApAQngsmKCuG14S8aEL5npIl92b1QhKWxf9D0FKmVH9eDC1v
	 REKza4BrvgePmbV1bzL1fF1NDYhYYMHz/WZ9z8fszNMm0iWIjfuxvMuYWHpoOdgrrevnp
	 Ftao0iCsOTXuSPzVSllrN4btBewh24E0wi4q+wH3pFuMI+Jdn4mmA2QuOPaYJyBLyog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=bw3PrNxrYQSzoTt6N9NoQDit2mOevTtpY3QM/+DH1Xk=;
	b=YZ6ZUUoER4zwpSXD7PuN9+/rNYsbLMi1jeaBP2scmIuNEr0kuT2waDf7qGwxWxO27HRK
	 xGXmTes87mTdpMHU5g5euqRVgrV7a/2+EsHeJvFGcyVKCau34MOPcHBHl3p4BGBfF455v
	 cO6N4VJa/kxeIGj7/2ji8NLBJlQ7ocg0DNpWdEgSq7lmTuc8Zz9tFFsfBtfs6NTre3Gy5
	 dwWQUT2xaUpUEAAf8GUUdYMiiFZngREke65AAqfB0DicZbfKy7pWm3rceMz4dF2GqAIgC
	 kOCyYSnZ1jcb8GdjR6jrBwYsF0JGUUhPYjVKD5aP22JTygGZz5c6yh23HAoyluKZgcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050814;
	bh=bw3PrNxrYQSzoTt6N9NoQDit2mOevTtpY3QM/+DH1Xk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P56fefjVJJ3fDJhl6rv8i565o7eRH4qdT2PRUsPuwihKcci3SPjcTMeGgxdIb3rWl
	 D2tCjfQDyeXUrVeFI+GNZrzQo2eN4UHHHrJN32uS6yyOplUyTm8Ylfgf/7n2u7lxLr
	 X2K+gXdXs+L4vf+V7vbAEbDghszv7ZbD1kN1Rek8dWZ5B0iN8xBpstDp4aIcQyAKjh
	 t8yhZQwxUfwWR0cdRXIlg5JuOOszBkfS5TaHzenh5m1JMvlXX2M3Tf18NW9bpZyZdt
	 FcSb0BXRPA3AvDCVhpcBYC7t6t6cBDKeglgtWhGliMkERduumUjcJRX4QtyxtGR5KE
	 Hipufsqh5m7GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228D8810BB;
	Sat,  7 Nov 2026 11:26:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BFCA32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F6A4009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atED0skAg4ee for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:26:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 84CFA4008C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84CFA4008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DCF6519F5C6;
 Sat,  7 Nov 2026 12:26:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 12:26:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 12:26:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20261101191738.2091630-1-bernd@kuhls.net>
References: <20261101191738.2091630-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <8bef56fc7d9e919158f248a2939c7ce3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/4] package/ffmpeg: fix build on i386
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 01/11/2026 20:17, Bernd Kuhls wrote:
> Fixes build error:
> 
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  libavutil/x86/tx_float.o: warning:
>  relocation in read-only section `.text'
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> For details see:
> https://bugzilla.redhat.com/show_bug.cgi?id=2428281
> https://src.fedoraproject.org/rpms/ffmpeg/c/786464f23944a2a6e082404b589d1ec7ac568d00?branch=rawhide
> 
> Fixes:
> https://autobuild.buildroot.net/results/c3a/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38/
> 
> The oldest build error of this kind dates back to 2024:
> https://autobuild.buildroot.net/results/e66/e665577347857b548f34f9b4fc86f2c573f27282/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
