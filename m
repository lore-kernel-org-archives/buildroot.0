Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB2BC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6B5608EC;
	Tue, 14 Jul 2026 09:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpGiIs_3gL29; Tue, 14 Jul 2026 09:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A0CF608DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021934;
	bh=amMitZy6+MTF4XIPtHoGjfxqitX+YROvSYF3e3yMnwI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TBltALlInG4zqvqSOyjRjKXkYrdAeFDeFjxy8uJ77AuchljYLatcbC+PVAt7vdKKV
	 QD1tKC+oJcTohRlKC7yglY7+3T2A+sV4Y1IqVbpc2CEvtf5WiAj+yYxb/UMncjkWOb
	 hX29P2vs4AYYp7KEumUsjcmkJ+ldCdPzbiKq16twTePfa+K3kwfzwNhCm9CqeHwe2i
	 nJrlMaZPFnPzZcGpOskXSQ3mXBs68gjZ8jv/We9OTNJ+MaGAbYdCoZ+AdWwlpXnC3n
	 AlK6/AjQm4Fbw5ALkuk2vQMlCC1DmWoJc++o0sEurEZqTgLULJy/cjQ057CF5bOLdx
	 fv9ZcemhF59HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0CF608DA;
	Tue, 14 Jul 2026 09:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6A796C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22493406A3
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BdFc-g1RoPO for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4847405BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4847405BB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4847405BB
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C1B552003E0;
 Tue, 14 Jul 2026 11:38:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 11:38:45 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 11:38:45 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <20260706100301.60854-1-thomas.perale@mind.be>
References: <20260706100301.60854-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <ab13d9259139130265c3f5dd4823afe1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784021930;
 bh=2+++7lp5obboqcLBHDD0geYXqlK5wlCxxj5AaODJFLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K6cbqvgxKsy4i4miyrhYhY+n9z/7Svkfzb+atAqu3EDLEGvqcW72e2eDIE5op1Fdq
 cnyvr/6AFqDW5ZvQTJryRZthEQMpqoCpZY5h9lW/YrUg1os2MslC/PAr2ShrwZscCR
 aWJZL69crVcdqcqqUL8dGBslHkDqoYoIBviv8pIZdA5DKEyrurDd2gnP91sJNN+Aox
 JmJps3jUh1wZPW06T9k4HzyBREyJ3It/pzIicdSWEUlkpaj81xL/OzYX5PkCVJX4Vz
 ixzlaPPai9DIF/cj+BG2IB9qFU2FHqUGRBupeHkQ6UYgp8R7sxxhd+my8FVMxHO8kD
 jlfOo5YmUIWgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K6cbqvgx
Subject: Re: [Buildroot] [PATCH 1/3] package/ogre: add CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/07/2026 12:02, Thomas Perale via buildroot wrote:
> Vulnerabilities such as [1][2] are assigned to the ogre package with 
> the
> cpe: ogre3d:ogre.
> 
> To correctly match against those vulnerabilities the CPE_ID_VERSION 
> uses
> the version without the 'v' prepended.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-11014
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-11017
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
