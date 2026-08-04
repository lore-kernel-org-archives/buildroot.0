Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4024C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80AF6079D;
	Tue,  4 Aug 2026 21:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhkeZX7y2pYc; Tue,  4 Aug 2026 21:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99F160791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877466;
	bh=PrYM4O/f2g1BG9myuIRz3I56dhA+Kj44tSX7DGhZe8A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JsX/OXW04HkJNNiEOmhXe0hhur35OIGHB1SR5Mz1dqNiwh1SD0cSDjOgyOvzbQovA
	 /toETvAn8/hMeg0KjgfgtkP2DZB436HwtV3egBE+y9T9RTsE90miPbx2z+Wt7L2+We
	 EW/38iFsW5Ejk97uo80rOVB6kWNDqdWG9HcRESR2Ubx5YrZZdCVloKz5UhcPvSyJzD
	 9e2tTHkdrThW5Lvq9xxbagff7/68BrvG7PlLXO+vXyJFxSGpbe9YDuSRb/FsUf1NE9
	 mzdWmx9kWLDu+GCqJohXkGJg71gVROlsteV69kwKscyGhrMEq0FOpF68aLoXy77ImN
	 +/kyNDCFu4+0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99F160791;
	Tue,  4 Aug 2026 21:04:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E633270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3058940742
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FF477FUwfuzA for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EF5D4073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF5D4073A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EF5D4073A
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D0FA878035E;
 Tue,  4 Aug 2026 23:04:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 23:04:20 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 23:04:20 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Deividas Puplauskas
 <deividas.puplauskas@gmail.com>
In-Reply-To: <ai_eOUXoKOC0S6yd@waldemar-brodkorb.de>
References: <ai_eOUXoKOC0S6yd@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <fa27e9cd004f0ded69e1bc2cc1cb44d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785877463;
 bh=q8jsXS39IEyNkdS2CATM9XZqykxVtX4a3AaE3vAOPG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZC5mDVDB/4Q8DBxXUcGe4nyuOWoS09Ykxw/ZSoJbxFvKCiMwYaQKm+HU8KRim1107
 k1fdmrUagykvsmALu84cm6bBYhcZ9lbj1IdF5FBQUTXJi8H0/NH2Tj+to5LDL7HEFC
 y6AOVoOrrQj5iSCnDUPU/BiKfMi9d/hSj2BdG+obR8linMPyfMnbUDxuVS1THjLlP5
 cSsxYz9ZBEmLMwY533S5kEtAXO6nQSqXl37VKT30y9w4NEUijloRw7VUJiAI0qE8io
 TzCaM7GuzfR6B+3kuysiB/3wRqUEH2emvmSZztVNG01vh+FKgxBtO4/odSLE3n6Xz0
 jRAb6X62/5EzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZC5mDVDB
Subject: Re: [Buildroot] [PATCH] package/perl-cgi-session: new package
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

On 15/06/2026 13:12, Waldemar Brodkorb wrote:
> From: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> 
> See here for a description:
> https://metacpan.org/pod/CGI::Session
> 
> Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
