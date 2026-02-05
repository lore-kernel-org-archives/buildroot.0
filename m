Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D14EECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EC2418F9;
	Thu,  5 Feb 2026 21:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmI7lT8TrKa8; Thu,  5 Feb 2026 21:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6066C41821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770327014;
	bh=uDEXcg9Wtr5SSFId1XF1HYSZ3NtobTTxddgZrlBlr2Q=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=bYqmkaNU3eLC7pWPwEUz6ZubKTyYAsm+1aLAVYiK18x+Vmn+oeKyWbhKouQkYsAoX
	 oL35C9UVm7cwUuzqJoASKx7cbfUQQsq3TYPJ1N1c7SLmZyMZs2G4HhzMm/HA9rXp2u
	 uOR0ssc/6cHIAHiqECpPupAbX8pM37jSn/xghGSQJ7CSP8KTVdZU8boowcuuMgoFYJ
	 yumoh+EYg8MdTtX5du1VUZufbrObO84limij6LSPF478NPQReeYf/w5xnW7aTN3Per
	 tYNmHN+xYBml2dVFDqMKvpppjTjhX2MbUc4LUFCMeJW914H+BOPruhRVqLeFI23ioQ
	 zoTr3s9qCeHjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6066C41821;
	Thu,  5 Feb 2026 21:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B9C7470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4682680FB5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4LfxqHLZQQN for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A35481008
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A35481008
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A35481008
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:30:12 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 934C22C8330D;
 Thu, 05 Feb 2026 22:30:09 +0100 (CET)
Message-ID: <be99cb99-250e-443d-9d8b-29ca4f91906d@bubu1.eu>
Date: Thu, 5 Feb 2026 22:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aYOKhsGmWtZsI5Xy@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aYOKhsGmWtZsI5Xy@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770327009; bh=xIy4a0fi1TFgEt6yU9J/+wUO82HN0/thsqAtWyM/kPg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=JnmS9d58N+IBYEQbsttE+SSkejTvDwcnuMeWUSbTq1L4av1T+8e7gGlY28hbfEd3N
 wm0UGZ1XNuGDMQQOtan/aAsdzoi0Hezw3Xz147Vwew6pwnKzuFK25PmI4jYLLEJF0l
 0WwCPyp9BWbL3dksjkvWIl5qJwJMdqN6mrjUygkrWOUgb2ceQmdPw/+z3r0q83+3it
 nzBp18zSCE+FbKrye4DxIf1TZDoSsGXrUcFwySFwiwiY6dIErgwfR7iihqy9anSdkP
 4/Jr5mh4kJHU4GCWzF0YmJGxySspgiCSK5VtpFMPAqpVZftAbYsCEQIc6ICWepLA6L
 rFAcu1U7MYHaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=JnmS9d58
Subject: Re: [Buildroot] [PATCH] package/asterisk: bump to 22.8.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/4/26 19:05, Waldemar Brodkorb wrote:
> See here for Changes:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.1.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.7.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.6.0.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Committed to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
