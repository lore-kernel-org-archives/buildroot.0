Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCFBE9539B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CFC060C07;
	Wed,  4 Feb 2026 13:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iODsB-ftl0ch; Wed,  4 Feb 2026 13:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B22860D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211502;
	bh=WuJMwpqh3QI5qms9HRymgrYYQidb7VwpCHOu2/8DSp4=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rwfnWD6NZbemCzP+rTv957wJsdrPSmbZ5bxB5CPtYiiV+GaZZVS39Z7US+0ac+Kkv
	 Xtr720cu3JdxtvL3Y8I0u29eAIdyGhyrOdm5aMGSOI3NBJu16t/GWJnkVn37Nr+VLJ
	 85XgOPu9C30zcG5RDtYj7jMfkzkYGEZGjboRGI6HtSOVCdSc0RC3ikqXci3hUyRNCf
	 trTTsvHDb5eu1mjNepWcVuCiT4ybuLlliqqe6jCHcB0Sj/0UpDYhwy5EUUgnc0K5Xn
	 LHRvBwIYXEYj/b8vmaJF3l70RSGFe1ugeC9ass6kUMTvnEZuihzUa+5mRjOC5ACEYQ
	 jXBi1ho08mHrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B22860D5E;
	Wed,  4 Feb 2026 13:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 253C8F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 076C960D5E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWpSIFpGUXTS for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FE1D60D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE1D60D50
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FE1D60D50
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:24:59 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 00D1131E0B83; Wed, 04 Feb 2026 14:24:57 +0100 (CET)
Date: Wed, 4 Feb 2026 14:24:57 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aYNIqX6Q7ujuS02V@waldemar-brodkorb.de>
References: <aXOEn7q16Jh2oEax@waldemar-brodkorb.de>
 <0f4949da-8d9e-4e8f-8474-f4bbb2c7c164@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f4949da-8d9e-4e8f-8474-f4bbb2c7c164@bubu1.eu>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770211498; bh=Y/Et/WOg43FnbyolSSxwBRm8nC+Vnc3hMFmncvw4Ufo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iIX5rZEV1MH6ERUUgR9zcIakmnd0hdPt4z7AbWYTA/0F/qEMgP+4TuK57EBlDtwxs
 V7bU7OUAiNPXgd69rl1psavYk8Uc8at7tjQ21614hkVTrZEcTqiZODEuYtVxGenrvo
 64rbNo2+s7UleQXOlUlrH6TmMiQSBgIERX0H3KAusKfjyDjE9bsM1iPRRMAy2YYVIn
 EoYPVefL4DTm4S3IxvvzNM2/QtLlVc7VRzRYsIYci62LZRghWBcdNEBH3c2LoFBylr
 K/+hREl9ruBUY5uziGYy5rVsVlon5hsbRg5DhU6zaMmRLYMvwNCupZwReLFY+g/qv8
 baFRs6nyIJuPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH 2/2 v3] package/strongswan: update to 6.0.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,
Marcus Hoffmann wrote,

> Hi Waldemar,
> 
> On 1/23/26 15:24, Waldemar Brodkorb wrote:
> > See here for Changes:
> > https://github.com/strongswan/strongswan/releases/tag/6.0.4
> > 
> > Enable minimal required kernel config options.
> 
> Is this actually related to the version bump? If not it should probably go
> into a separate commit.

It is not, I just realized that Strongswan does not work without it
for the defconfig I used.
 
> Also do you have a reference you can link to that documents the required
> kernel options? Adding a comment to that would make updating the package and
> re-checking the required kernel options easier.

I have no reference, I just added the options by try-and-error.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
