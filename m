Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1475606A333
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CGIaZVjx
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E884072E;
	Thu,  5 Nov 2026 10:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GC3lNtOA5rSK; Thu,  5 Nov 2026 10:32:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 657F940731
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793874775;
	b=IYlOyHGv7rgRThbWNMBgKkTiVUFrGJhScnsxxZpNOOSGmHpp+jyi/H0CO3Z7HbIkxNc3
	 v/Jkl/5SYjkDYnx9dcRmjQy11nW9gniTgj4g1WY0QnJfDBElc73sV7Fa8sCEu3pcJ4ly6
	 BR3WXZVxGDQq0oGkckTxsFzrFKcA4/ndxwsD/pZy7NaE+hQLKRLIxT59Ueer2ZDv/u9f7
	 t0ZgZ04M661Arm+ZNhlQKqS1C2doosTIhNLG9YkDWipPCLWxd8UPQxNXTw+drpZfWjPIx
	 nf5FxDgGb3UxZ3zmOlVcdDR5CviolsvdpMO+qA2J8KtOXPT/rSqAi7vObhqY/hmUHKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793874775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h7zk5c7gDwAl64NpD/AOuvlwhUok++ZbJo6XlTBxwUM=;
	b=QznwNtcaUDex00SwU6aEblQ25bbZxfIqUwlpFbyxFgq5inpHGk6mjm4i3JvmF7zx1Wsd
	 Mjq0m2r4LGGXgQ2Urma1cXNkfEUw9nUQgoopxNqDKwzFgd5DLkpvFNmrQvM2DULAgylQ5
	 GQ0/WAB0J+VYEJPrZV/aCsDcc4F9z59erUflKRokYLMmlUldM0oHEYB2/+h9orRa4yNqk
	 n+pohF/ZMOH25+txai8JseQ8sg/fLzVHVerGiDfbGU6BgWtRXqIULx/FgAzpptB9E/EEH
	 H0EB0SEBMJMWpDCrbDCrJl8U6rwPhs93EoOEMTt6dLeebJ5QS+NTZjz+IS+mYrdA8MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793874775;
	bh=h7zk5c7gDwAl64NpD/AOuvlwhUok++ZbJo6XlTBxwUM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CGIaZVjxazfldJGCN9Mn8UZs6XSMq4KCQpThYbN4Erb60RdNej5whPucTCYi/4eUB
	 jsTnpHjlTrxu5qTugIFDc2oR7EN64wQ9vnBIEysCOJCN0dME7g5kCyDPEgWxywyWZy
	 +QLrrIZPtr+8RFUL8E+97dVds/dFkSJS/WYaeEuCs8117kJnXo2i+iBjT/2RsG8/A8
	 zj+kX2TIAThoqiT6TyPt89SMb6lg8WyfJlsV+tXI6jM386CLdeKox/lKEV+OiTt7VT
	 00LGPGyyodVvYu7462IC91ZTfRcFwf71kZNVN99QKiijTXJhxS27Uor0amaxyCMa3f
	 NkUzHh2Q/hKMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 657F940731;
	Thu,  5 Nov 2026 10:32:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3086A1779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DD656078E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmZH5rId9NaM for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4D67606AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4D67606AA
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:32:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 771DF1A07FE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:32:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CD685FF85;
 Thu,  5 Nov 2026 10:32:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0151810329233; Thu,  5 Nov 2026 11:32:47 +0100 (CET)
Date: Thu, 5 Nov 2026 11:32:47 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auxbF07TUc6JFvPf@windsurf>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
 <20261105102458.1795886-2-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105102458.1795886-2-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/3] website: add a showcase page
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Thu, Nov 05, 2026 at 11:24:57AM +0100, Angelo Compagnucci wrote:
> Add a page listing products and projects whose operating system is
> built with Buildroot, each one with a link to a public source:

Very good idea!

> - well known products: Tesla, Home Assistant OS, Google Fiber and
>   GoPro;

And several of these quite old? At least Tesla is old, Google Fiber is
old, I'm not sure about GoPro. Do we have more up-to-date examples?

Perhaps we could ask on the mailing list?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
