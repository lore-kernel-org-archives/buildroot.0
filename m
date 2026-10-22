Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C200B606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zphl+LWx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862298127A;
	Thu, 22 Oct 2026 21:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fzvLgbBrHUJ; Thu, 22 Oct 2026 21:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AF5F81255
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703148;
	b=dex2cD7BQyA7y54xOYar8XOkVcMMDFwfQ300va7ruKX71AQ9UU3fXecuwCXGQrE38t95
	 yxgSidjUF4P223+Ocl65jbMiLn0mN+T+Ez9C58yX3ygsXRfmnIVSCC7t2va+jmy4SeB0q
	 iqdw21F9yBHsPXUd/7PklrHxIZGUBnSDCK1i8r5puR9ctxZz9Xgjwdzz5m+63mOA22JB7
	 t0ZRV55EvYdrmyBUitT7NeMJkula1b9EJCXcbqCaJWn4bFtt7ISn7v9DnGEe+0vWSs/uT
	 KNAldMPuIiIEbLQs73mVetjMqFgeZkuweOzHMiz8ce9urnYNesKHm5LJQQzi5Zx1tFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HloI7K2JozOBKA4QUH7ROnQPVjm/drIPhRVKvdcMmRo=;
	b=kTyFPMu5ahG/4ERReMd4UDOZqWHCSotAgoWSIRznXid27HFg2A5ueMwS5x/Y7A5nw4RC
	 x7gpr3/+TbiSSLS7BuB6BwnwlB+7hkOnPtrXqJckk9hVg0JClNVF5uNF6UqvL1N0PmURZ
	 MsoAoVZAZVOaLJ5GnImOEK5OA7iQlz6AycGGhcbDMavinkAeI1O37+iac8gEGTsNZZiZs
	 SB1fibgvMazpR7uRRegeXAKRm34Tcl2yPytEO/QY8WEmW/ppcFkWVRh4aUgj6MdifQuDB
	 6Od8QHicWilv24y5JW/l0mDyYWdVzQ1b/ZaqU2ONMAM9pRQ+6MeqP6ZNAVpzmXIpm2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703148;
	bh=HloI7K2JozOBKA4QUH7ROnQPVjm/drIPhRVKvdcMmRo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zphl+LWx0OtEtH0+qomknLHdHXAYu+bcWwf+jW0sH0L10Y8SXLaoL7EAUXMLCeKiW
	 a4LNXXAeDdUQDxzcKHJCEh2JVsna2deViBb6PrG1wyDx/zfA0aD2ET/5O47b6gfKCZ
	 a+U+8THhFLTERH7LxgVNaq+UgwzwFC/nuZ9iB1Wdltnl3fkU89l5eHCuE/rYTiuKCA
	 2r/dfmFJuPsd+33YXFH5wQbXW4ufvJpFYYI+07NjPpCJR7h7++NGOnWDQ4uIC/tlsY
	 5e3ycFH01b/4jfQksz+rGx7pg0DLubgUfFEqAoC3jufIeE/E+l4d3qJ4ibXs/0GcSu
	 evKnkEaafPhHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF5F81255;
	Thu, 22 Oct 2026 21:05:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E566E499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2B96606A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r07qxHpHhhRR for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:05:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 686656080C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703145;
 b=FW3EoJnjesJyl5Bjy7p1eiwT5hMDqFvSQJlbDCBsZo/PrhY9h/3N+clToW6NtTn0MNTB
 QpVx7qFNf8gkoTgjum4T+Zo9Y6rXqv9EprR6TJBsol5HI76cv75W517hmgW/0t1w3hPj6
 gF9M2IwsIIrFDy6HW+p1O72QAUU9Mg8dIQP6KuRkimLyNYzSP7JuHZvdiieLH9Sg3x2e0
 GroYM7UmaimtMClx6YbZUaeBvqea/Q9/or7eU0LioDYP1GTa6zyn7VcTJxFkEhmll/9xw
 oYsBKffERTfAfSJBu2Bm2UxQyt6tr8sL0Zw8nEsefM2y9bPV1irYW8Wl+jXLReAtplg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703145;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mEXmFytMfqG8TcQKKIyZPDV347b+Nkl8npWyOLXSMek=;
 b=kgMUmeo+qPOtM+1WM1k8vxBKK8+PiK2XTYdDN9r8LK0mWv8lT9X28V2gdZydTfYVaIFf
 4KnZp79ShXAZIQhmEA8U1CtpwEbFYGCCRNUr3lsw+4qY7nUxiSTwUpEK0NOMfsRBnyZTc
 BJGMwiSbwwGi6rvbesUnwxZQolaQHFneBhp6aTJ5zBCCoSYmrhIcBhqeYoH++kIZbQ08o
 l2e+scWaESpadwl6aD+KAvW4Sa2+7238kbTZIjAanEf74zojig/laPGsgH4aBeZKXLBhh
 n3GE9frMcKkf7ov7eyAy+FzIVsWq71wimOQvIGPMGz75m8e0Nr3Azkw5JGLAA9Lhwbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=B+dRz7mR; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 686656080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8241BC51457
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:06:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 051F460763;
 Thu, 22 Oct 2026 21:05:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F02CA103281B0; 
 Thu, 22 Oct 2026 23:05:36 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:05:36 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atp6mXzAKc_qdtqm@windsurf>
References: <20261022170737.3937695-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022170737.3937695-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/tailscale: enable missing
 kernel options
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:07:36AM -0600, James Hilliard wrote:
> Enable NF_CONNTRACK_MARK and its NETFILTER_ADVANCED dependency for the
> nftables connection mark save/restore rules. Enable NFT_COUNTER for
> older kernels where counter support is separately configurable.
> 
> Enable the networking and TUN prerequisites, IPv4 policy routing and
> Unix domain sockets. Also enable procfs and its sysctl interface for
> IPv6 detection and network configuration.
> 
> Enable packet sockets for the TS_ENABLE_RAW_DISCO receiver.
> 
> Drop NF_TABLES_INET, since Tailscale uses separate IPv4 and IPv6 tables.
> NF_TABLES and NFT_NAT already select NETFILTER_NETLINK and NF_NAT, so
> remove those redundant fixups.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Both applied to master, thanks!

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
