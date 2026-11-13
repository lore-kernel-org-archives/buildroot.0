Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE12606B25F
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K2WkdsDY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDFEA60F0B;
	Fri, 13 Nov 2026 10:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ujTz2MQ6gBb; Fri, 13 Nov 2026 10:55:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9431060FF9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794567300;
	b=bRmuTdXCwpQviBNbZsYMvNb0lX9gIefrhS9EZD/Dpvrb6fl/ECAFkm/O2nU6J/5mPOoS
	 S1qHylhMOMVvicXCAfskcc/JHFKKHf3U2dolS+rC/4SMiYQa4J5jJnDLMTWItsPaaVtcL
	 ti9zxE3rjAQ2i1hFx/cZ2pyfK3PV8QFgWg6BWe4d+P99jZ/2YMcC6riNhrX4YSwzGmC7K
	 ChS+hsZTohDkYr+4nCEapJLuwmS3eIMeC9EU1aTA0M4cEWtd+OZnM2zamCKrdyOauwlzf
	 Qiy5kaHFbEmE0FFL337WZ5HXBZ6BOFCiHmuceGT5Joq+W8zL++IDSNY6bpBaeTG/eeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794567300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=k1fwcP3ziu1NcegmCee6HGfOU5oyg6JIjwrgqE9ft0s=;
	b=Z0i3rrUuGBWjJfQbYbed+00iOc1xkyQOqaHEXjARsN9tOVncOkxYlbDYEfgNyD6+n8cb
	 nUCHdn4QDTBvYprDfM6mmdVH/oOO5K9n3tstq48g/ho5Yj5Gdm71dvh1aBtd3dWiYceCS
	 x/2vpuuGanepV9pZmG+BB1Xehli8yDQqUbSmo5XnevjrSp/TqOkygOySKPkaJsQgjyPzz
	 q4Kunk4gmHzovTmOGfqRP6H0e1vEMhiHe5Smq6PtkGDCn1+w2biLk/DYB4wyurdl5/DMj
	 PAvCPtxnSQOVuOk/fu6lLDgSTClBvJXSMVE0g49dX0BnYiTM9YgDjJYSYVDwjndQsiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794567300;
	bh=k1fwcP3ziu1NcegmCee6HGfOU5oyg6JIjwrgqE9ft0s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K2WkdsDYtxypiczYGnXKR/WXRhbU/eNILjVDjfIF7wqUcoJ2S/pOx/nN+yw8wA+A3
	 QNOFJ0s0jX9/c40diYehSTcik+xudh3t4wcQAUPs/iV8Z8uUo63dEym9tMSWwTfhGU
	 O6YcaWfeXjS5bFzPOi1UMCoP+iE5zQvuXz5xkmQMM6xAPldVOqNeEROBtddGcJha99
	 gxvixVnAYddV05ZS2icP18cMtTFAWhQqLv/0xTZy8IqOkTS+jXzRHyGr2D7hatZVNI
	 jeah3J0Qe8HdHKaY7k8GBpkFT+QcUvdEwCag8ra26P1Lm+MjcFIauCPgpiOwoobSxq
	 vDiRaSZflP/Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9431060FF9;
	Fri, 13 Nov 2026 10:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC0522FE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F9D640E23
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKuVEIiSHJMg for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 10:54:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CA0E840E10
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA0E840E10
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:54:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9FA4B60148;
 Fri, 13 Nov 2026 11:54:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 13 Nov 2026 11:54:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 11:54:49 +0100
To: David Luca <davidluca3000@yahoo.com>
Cc: Julien Olivain via Buildroot <buildroot@buildroot.org>
In-Reply-To: <813093532.2289630.1794564858648@mail.yahoo.com>
References: <813093532.2289630.1794564858648.ref@mail.yahoo.com>
 <813093532.2289630.1794564858648@mail.yahoo.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <a22a7aab9348cba875acdd68ffa30efa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] Fail to compile Linux kernel 5.14 with GCC15
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

On 13/11/2026 11:14, David Luca via buildroot wrote:
> Hello,
> As mentioned in the title, I receive a compile error for
> arch/x86/realmode/rm/wakemain.c:
> ./include/linux/stddef:11:9: error: cannot use keyword 'false' as
> enumeration constant
> Note: 'false'is a keyword with' '-std=c23' onwards.
> So I patched my buildroot linux/linux.mk to add:
> ifeq ($(BR_TOOLCHAIN_GCC_AT_LEAST_15),y)
> LINUX_CFLAGS += -std=gnu17
> endif
> However the compiler error is still happening, any idea how to fix?

Kernel 5.14 was not a LTS, you should consider updating
your kernel. If not possible, you could probably backport
fixes from 5.15, such as:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f28b14d235a810e4f6634832062b6e0ffc482b5a
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=518eadd15f7ecde6d301974388c6be03d5c57a0c
...

You can probably search relevant commits with:
git log -S std= linux-5.15.y

> Best regards,
> David.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
