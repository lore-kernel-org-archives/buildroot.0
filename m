Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22923C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 13:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C38A080BB5;
	Sun, 16 Aug 2026 13:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN-U2afHRkWB; Sun, 16 Aug 2026 13:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1136980B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786887866;
	bh=VqPJMUEchBXYMipimlL9lARLS5ItbcNiLCIPTzpr2bk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X7MydPF1xMMCV71r7GSdONBhHMMA91G4RyL7ROzdV2XAnVKYW1Y4S0PDhTFS0m9b9
	 j7UpvWl3BmUwEXcE5i/sKY9q80RFMkkm53DFGdaq360pJA3oAQ4PF9Llue/NMpcMIR
	 zUw1f+sjyHQWjbil0N3B9Egv+sgYZ0p4TInKObxVLEHplXYwNIzTEe5G2oQ5xE0ugh
	 A+Wn8J3JUpoRbzvuQprLDjB/4MyMmhG/2ZsEsTG9yKawF9L4b9cdDG7AO4Lcuzrg12
	 OgIyt99jCKwQWHroL3hSVdzDeGvR+zBCzoYl4hVmn+ltWup7ZmCZKc2/y4fC7Ibfqc
	 AxCfZw5c3IHjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1136980B33;
	Sun, 16 Aug 2026 13:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8563D337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F364005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbEPRk2dTjyN for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 13:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01BA44004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01BA44004E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01BA44004E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:44:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A2034B0053E;
 Sun, 16 Aug 2026 15:44:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 15:44:18 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 15:44:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad.86@gmail.com>
In-Reply-To: <aoGwJidOrpQIFCAd@waldemar-brodkorb.de>
References: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
 <aoGwJidOrpQIFCAd@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <b077c425201840b0021c5b983ca7dc5f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to 2026-06-04
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

On 16/08/2026 14:42, Waldemar Brodkorb wrote:
> Hi,
> 
> forgot to add Maintainer to CC.
> 
> Waldemar Brodkorb wrote,
> 
>> See here for a Changelog:
>> https://bellard.org/quickjs/Changelog
>> 
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
