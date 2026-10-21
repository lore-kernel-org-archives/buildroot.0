Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2AE606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kPuVDPgA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C922640ACD;
	Wed, 21 Oct 2026 21:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As4SUIOFxhd1; Wed, 21 Oct 2026 21:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E33A140AAA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617542;
	b=tYZijwEif7kMTnHJ/tJ8Rs/vAscPH+rh2KL5QOE4C2tFgCKa1+rWQBWY8BRemWu1S5aT
	 frwKmrAhRo8OiBkMH1IhjpbbtfPFV8itXOP+Oc8Acdh7u18HOP8rl7Gw5Lak8aqIYvFHw
	 zavjsiQO9BzkBcrCajErhYTvmNM/Kr3yk1RV/zt8Y57TnK7tFCkQQE7xzqYPjUetEWf9K
	 EsGH+wt8j47tqHXHkquMwI2+vQEABj2dvxGLs1kmnGp91q/glNuUd0n4LFfTBscTqdiD6
	 9y1kLDSNbaHYfFQchGClLeVNQ4GKIlvn77IA4iHH2NPWRPp0Ooxyz8eQ1K/mCC9JFeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pAtaXJFhs4lyO9Vbk65rqgCKcL4E2993FjTxPWiV5Ac=;
	b=ITL4oF0zkrNSocoa958zSE78tuMgeOeIF5L93Du5JkDG3RrHTpnGhO53LtdMmTkEjiek
	 orgR7jwMbEgHHyq3fXqrZfX8ecQIdAXs9U173ODZNYhzBuQmRvypXZ/s2qIvKawBUc+QB
	 HrkachNL8A6ot5z2K4hmYKvkZiplitxynSYZzbMQ/zw0w2w4cRd2E6ncVzMtm5KbX5XiM
	 4MQCYRXcqtlJmYakxOeJAp0Q2mvczAx5lnAFqnWp9dXZ5WZPCrksIk5J2KOYI6TtAchZd
	 ZRjt69rF6c1On3P6Ea8Zekw+mJWxq+RF3EodT8sNEoBpuHkj2gZCr0dvx9e4OYRMlWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617542;
	bh=pAtaXJFhs4lyO9Vbk65rqgCKcL4E2993FjTxPWiV5Ac=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kPuVDPgAtt/VOUgTBN2UdOQLpbWyiW8iBKV23f0d8Z3bJEcqByRQgKfhoCbPTqHca
	 hwX1649qT33g4CiR3EbiRgxhV10meVr4fB61A2Rz5fqlEc2dTPYThtjLII072J3+Z/
	 IEVmlDK22GF05mqG0O736tCwQXKRflksKUsPVvC11JX8fqyrgk4owsiSkREHlESYPV
	 Z9p4Ici102ATgoRh4d7C+FvbCcvNlThBd+e+eS7u+vqBPXPWZOHZllfeg/g67Tlfdi
	 Ff7lGiY8gfOhSbnWOYkdAGYztg4ylsMR9jOeoIsmNX8QSSmwmq5wTKaD1ipgEVKILo
	 OGc4xjKMjCLvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33A140AAA;
	Wed, 21 Oct 2026 21:19:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4E81184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 627DC4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfkUz0Yxwwml for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0DBFD40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617539;
 b=D4oWl/KW6xU9JdhAYoZhJGr0KPX+btgO1oHnjrZGjWV0KIsZw6uwtYqQT246PWl+dNYb
 vgPzc91ZxcxwJdDKzhJbntbRDkFeyWmloog9GFTU7Q77f9bneixfIdvNGl7rbXfyFsVeW
 B8l/+c+LxwkxnhQIfq9DEODkdlVmQ99HT3uC05PUyiOtBXGjBnX5RIzGD4Wl1FjQwakru
 hS8w0Y3qnih37a3nPUTK+w5EV86BB1dDVyf8n6pZnGeB8ZMoa3ITcoGYUy+pywdp0xaAL
 dgLx79XgmmJh3sxFTmLcO3X0R7tRUstsVbcaZnrzETEqSaBupzS/Pc4w/R5rJET3hGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617539;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=RezPO1aAnvCKDzCbUWZFG8EzQNEsI8BWUUGWNIPk+iw=;
 b=TpFUtNwsiR2RClayLghyua15+qwjpUONPGpYT4s1BWSuvXsGUQqgy3qcI3wwaW51UWJD
 anDscL8w5agidK7pI/9H71vDV9I6/mPjJQo+xRuR4x8VrkUb+SPpELltVFp8++AnOFfR4
 oQlJq/TNdjCxMDqV3B6qof9SYfAsFLqy2KEttwbhhYWwDuHkOWj+yO44jgGDc5gA9dbyf
 liNZu3rLpqBwQ8RlLFj2MbEUdnXSfXS0G194wXA1/A8UCS9tg22SuF+3A6qit3WQirSCL
 hCG0si6UZXHPU8edVSw4RBn9vcOqePWZGkE7SC2fFSXiTWU0PF0pK0PzXNe8xdD4PVQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NmYEpstA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DBFD40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:18:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5568C4E41296
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:18:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DCBD606E3;
 Wed, 21 Oct 2026 21:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D4AD103289F5; 
 Wed, 21 Oct 2026 23:18:50 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:18:50 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>
Message-ID: <atksNVBSMVieUr9J@windsurf>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-2-j@j-ernberg.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614155328.304282-2-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/8] package/foot: Prefer ncurses
 terminfo if ncurses is selected
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

On Sun, Jun 14, 2026 at 05:53:21PM +0200, John Ernberg wrote:
> foot's INSTALL.md says to use the ncurses provided terminfo. [1]
> 
> If the ncurses package is being installed, disable generating the bundled
> terminfo in favor of the ncurses one.
> 
> Note that the ncurses terminfo is smaller, meaning that some edge case
> features may no longer work properly after this.
> 
> Link: https://codeberg.org/dnkl/foot/src/branch/master/INSTALL.md#other [1]
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 

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
