Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E30E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 08:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBCA40234;
	Sat, 28 Dec 2024 08:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCMmFV1HNasS; Sat, 28 Dec 2024 08:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37CE401BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37CE401BF;
	Sat, 28 Dec 2024 08:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36EC8E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D3F401BF
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYGjFTIcsC8Y for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 08:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B02924021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02924021C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B02924021C
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:43:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8E8520004;
 Sat, 28 Dec 2024 08:43:12 +0000 (UTC)
Message-ID: <9b9e8823-0b42-45de-a99d-198cd278a120@korsgaard.com>
Date: Sat, 28 Dec 2024 09:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
References: <20241215100724.3835761-1-peter@korsgaard.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241215100724.3835761-1-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libsoup3: security bump to version
 3.6.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/15/24 11:07, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2024-52531: GNOME libsoup before 3.6.1 allows a buffer overflow in
> applications that perform conversion to UTF-8 in
> soup_header_parse_param_list_strict.  Input received over the network cannot
> trigger this.
> 
> https://www.cve.org/CVERecord?id=CVE-2024-52531
> 
> CVE-2024-52532: GNOME libsoup before 3.6.1 has an infinite loop, and memory
> consumption.  during the reading of certain patterns of WebSocket data from
> clients.
> 
> https://www.cve.org/CVERecord?id=CVE-2024-52532
> 
> Changelog: https://gitlab.gnome.org/GNOME/libsoup/-/blob/3.6.1/NEWS
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
