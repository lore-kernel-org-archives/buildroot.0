Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B48606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RstGf3CF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C706084F;
	Tue, 20 Oct 2026 14:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avp4NhjPzkMc; Tue, 20 Oct 2026 14:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72FED607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792505070;
	b=MXTG+kUbfC1zBS49OXY0a6AoVhrYQBKHcvGn9rwahe+3jkDc1Um+ZGWv13A7aCa/vfmf
	 ow92+NHhxaW7AB/jh9ZE7PO1l9eky6LJ3Bq12fvgm6c1YNoC8oaNlF+OgF14uKWQ9c7dy
	 0hgfFxumSRt+oTZQfqSkymcXJC+CUoqm3SWyZ9eBg3cp3jN7FXjQCN44nFIvJ6Y6Ygyt3
	 ULEM7o5c+cqjx7pJsuS3CLeS/Do80NWaG4JEtKXTpI7hvvX2WQsV2mwpLJ4CUqh36LtzH
	 pXlBD/gDulP196EVAw73CxjlHIRei9+5QpplANiQYHJn8Z2228Xmri9hnMsJN2VUPmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792505070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q22FrP2jfB3NdAmLKBrH9tTrCvDjHvgdES/5STmkcu8=;
	b=GVUb3Rh1NA3Y4r5vBtRZgIJo+PMNG5S16dRsnQbsb633ziVgxSy7uOEeYNTD1m7yVHdW
	 l8WUc9e8UBlwAKcIubnfiT5AVDa+FwgM5yYRl9PKC1dPfZb39emsDDDZPNw3aR8H/ZDdD
	 m9spf8o4dGL21BFjGVUojITKtiBDbHCzxwjUpKRe2vWHYdD6JL7Gu9icaSxxNPFfkho3x
	 N3WaNoV2bSQa8W5ChKGPMBgTsV5W4KAmFG+qZNrntYXK7I8+2mbWFImUEh00pkip67FUn
	 SRTApOVR0ESildY86jip66263+AbLJFhh791e+KtknXfae21Wii654DdqcNMwEohcRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792505070;
	bh=Q22FrP2jfB3NdAmLKBrH9tTrCvDjHvgdES/5STmkcu8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RstGf3CF15eRLt3hMN8N0cXbDhPvIQHNGZ7D00VsTkWUkTRgatL/nD1YW9kpVKT+2
	 bHdAVcMLE1vXgRGTdPHNlXsbNlbSNaSJmz6pVMRT10qflghL0fdcQJ9Ckq80QLuH/4
	 1oMOmEzTfEkv+I+w734GEsdYERcq4iGJuSYNKhYtNq8UJ9CS0rLU5bPvisIbP3aJ9J
	 ChrpMeUw0/HEg9ooC9KhOP1Y3D4ABirzu78fe7/ZxT7W+umc7wE5AZ2ULmeqMsXfeH
	 icftWQxfjLk2tcLm53oxSNr3K7if2lFuJqzXVzOx6rKkMraAzQhAU6RdZvR5Vq30Ni
	 uKlBrvh4sqAkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72FED607ED;
	Tue, 20 Oct 2026 14:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9271AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E58580F34
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYC7YSE85_gi for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAC4480F22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792505068;
 b=mtqsmXMjyv+j3vNATGo3HaoNc0PMUt3BzfahKW2TnLWvPOwWYaPx7i3YgHQ2seaLfSUY
 ddCrs75Ts4mTV8bmBckO/OFipZXGaz+v+cQmoVVTE3Ed5DjOT9rOB1F9TAu86x6A5hSfE
 hPLnRvuDz1o+Yojxtso1rG0f5KfQo8lxyuw8CLCH3wFjnRTRg1jjOqJfCdTWp/DqL0Jpw
 6rrXgiM1dqLZDNruK0ynnDqjp85N0xhRBnpmLQi5vmwYCAd9ru7CixhScj8efQ7gAt1AQ
 cXExfbhF9IutpKKoa/8bVT/SC3xl6o8bc/K15611W5jJMQnfJMGLMl/rN1IZifrDaHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792505068;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=f93UO9Rdy5EwObHnKEN4zFMGi3dG/vSOqkudVnJbKxc=;
 b=AFJYu1GouBKg2NHEuSHrNnDDOLF1vl3MDZ0d/l5PtmuLQ4jroqf1ilL2tdQiQfqYXJoc
 0dlGaj1jzABbJnpIetZ1O/eVPQp0DUfzyYJRaVZVthsDIJ7Kj+tlmfRiC5YVpLnB6vwFJ
 uCohWrBDV2dbHmfiqBbNwibSJROUTDHg12c458ebnswJO1z5VmaBxin6oubv69K4z392/
 wVLrustiXppldPoEIk2jTxWFCBaJx4Hdef3nkxMATfXhtrla4sRvTxsQDmhRQNuIDtpM8
 UvhEUkaFPi2pHWXPmYZsBbcncQ3WxWeWj3EXq9Ovb5Y6mg3e9bQQPH6nQLL/xjIozgA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ve922cLc; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC4480F22
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C79BF1A1291
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9CF9060393;
 Tue, 20 Oct 2026 14:04:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2532910328DD0; 
 Tue, 20 Oct 2026 16:04:20 +0200 (CEST)
Date: Tue, 20 Oct 2026 16:04:18 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <atd03lI9AqiO72jJ@windsurf>
References: <20261020131404.7333-2-fl@n621.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020131404.7333-2-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.27.3
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:13:58PM +0200, Florian Larysch wrote:
> https://go.dev/doc/devel/release#go1.27.3
> https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ
> 
> Fixes CVE-2026-111943.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
