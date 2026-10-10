Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC0CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8608560F16;
	Sat, 10 Oct 2026 09:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B509qcuu9QxZ; Sat, 10 Oct 2026 09:29:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7D5860EE9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624549;
	b=KMFSXnSJ7gdBJXjganbFTW7GYNCB7asjyqWcoXfK+DpZkvkn2ktrlG/l5LN2qwLO3BU5
	 uGRYt+V0c5eI6jVm2SGNtIQ+EHEbDMF1iCtSUWXIxbm1SgluMRZRzzrSI/x33syKueyLe
	 8fcXiB1Q23ygpjFghJiaR6iZrXIYvqHFqx2nHyCkgHfEC2F1wkKiBX8luE4u3eZZL8pyB
	 hZYSgV+DwbklzR1Gw91vWjedA4rfM+EPrTMDX1gbIntO8mdKgfMb3UETLnVBISmp5Od3F
	 /+wQ3sJKWEwLMMb0tbPn8xhANseTnIeNw2wSDKzs05fbbk09aeRrmAjssu0/RTNatvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pTm4xLA5BQW9s37On7fK5UR4S52rFHfUgcInxEfJ8F4=;
	b=X8E5k5W7N3IznpfWyWqwMJrSqGEcoHley0//jEQoUGXwLMxKWGDAJLOJVLWcZFZ1D68w
	 luGSRTMDPVHfo1pqtQl8ec3bKkURU4xjf9kI7/6Gk++Tgdp3bX+7JKqzsYD2sBHp1JDn3
	 N452lcEHENDQKPxZ195UCBqVkzWVJgDiuoNwoyeJzg8cMtcu5331U8qSVocB+4oa5z4vK
	 iPfFnnhrtSalgqcoPhGHrjxMW9afjhNlhUaBsi5o8ApLW1B+ThMb9gMYjNEdkhbhBt5cd
	 5+UC+9VAytlndrqhfz/9IcynfFN2b/kyb5V0FAAiydMS9HuoAPtei0dMuiUrYn1CF4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624549;
	bh=pTm4xLA5BQW9s37On7fK5UR4S52rFHfUgcInxEfJ8F4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iBC/ofKYaOs8xQgFhZUPcgB66pg5ozh7JojXSOhuw9d6H/j2T3s0LRAMCWe3Cx6Nb
	 qsLsHcuquPPdYuWBRLPINMyT/JJN72ZzXnWcaZ9uhmvzKa1/NAGupC1WgXWofeb9hi
	 TXKgsl+wdBxjs/slDKDfGNmPuQXdJoOcwWJQSeEPIlDujs1ttn2lTMQjIoC7nA4GIU
	 4v9WaiX6ccRn7X+7TrYDWClednP8QERjHYQn4dTeEEzP8S4h322dpC1mmhndWv4lan
	 tJUAI01S2eQe0xEeis6XL3bTxuT10FosTbxoNvIldmizxevGr0iCbK+njDKIPIPwYB
	 N69d7VJB3/Vcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D5860EE9;
	Sat, 10 Oct 2026 09:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E24375
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD96400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lyso0wYzTxum for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:29:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 59C0340004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624547;
 b=K9yqs6H2KKVngJ+du3FZ6QLTWtShoyBnETl1/3sqFS4vJ3v5gKT0heRaHcs814gYgDHI
 bZZuZrzHwG/jcSNWeq99YyceYmx01dq9Vi9noNMJjL77ZtF+GkeK7mHOHoFshdRIBIRyg
 Pn/HMxc5JZDHQN8SuWRc8NOC1YKkiZf1gGZm7xvBXmpJx51ggFiqDtxSgtfYOv5WZCqhP
 Dv6kAbImUfNOvh89FHlzakg+dFbOAoTb29PJAd+WFeiOgWA12j120x06hGloGansFqSwU
 XvdOepTpNKpG+/u7Wm70b+6/ycFMzJMpRMc0K8DizxCyDJXZFl+xVQ0wfd/2mlzHF6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624547;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=E9iTEUBuGPv/K6AzMcxtrw2YVuNK6Nbksf5hkX6Etwo=;
 b=keF1n4YQWp/vhrHXzNYck62AplbaFKG6eaDY/AEU3VCGoy7eb29O6xpuT3yfE4Aks1HZ
 bhwuOYPbvimS74KN8xmHMePVP3uXQb1MK4wXDUqMZX3sgtS2MLLp2PkRWKfinU8aLCbxw
 X1Hycj8QfkJ0JrX6cFp906N+1ZENqM7rOKqXhL7ACJQc+CThONBrOvZulbS04/uzqN869
 Vfa6/O1bH2NC2LKxPG9C5pcNJfcQZq1Ogg/tgwPuYlSXQbNUww4gfMnBfhH5E1LU1JHHD
 zG3q9j664Rz+z/J7cNuH4QlsPEa2g83hjxa2kVHkN/gnhmNM/9rEAnzSSSHSXo7DSXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=T1tV4sR9; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59C0340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:29:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7FBA44E40EC7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:29:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43F1C6075C;
 Sat, 10 Oct 2026 09:29:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C1AD11D701F5; 
 Sat, 10 Oct 2026 11:29:03 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:29:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
	Francois Perrad <francois.perrad.86@gmail.com>
Message-ID: <asoFPaAXXMunqOAF@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-42-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-42-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 41/84] package/perl-net-ssleay: Add
 support for OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:22PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks! Hopefully there will be an upstream release
that includes those patches so that we can drop them.

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
