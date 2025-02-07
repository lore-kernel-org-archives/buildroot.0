Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BDC0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39385606E9;
	Fri,  7 Feb 2025 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEHIDrF0-0oH; Fri,  7 Feb 2025 21:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8FE6129F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8FE6129F;
	Fri,  7 Feb 2025 21:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A51E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F39781164
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZMhFVjGSQFm for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90FE5811A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90FE5811A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90FE5811A5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:35:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 775FA13F854;
 Fri,  7 Feb 2025 22:35:38 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:50434])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Feb 2025 22:35:38 +0100
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 22:35:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207181946.2746366-1-bernd@kuhls.net>
References: <20250207181946.2746366-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <9ca8052b44448d877723129fffeac997@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738964139;
 bh=mXUc0o61aZl9GoRaVJ7rHToo67FQ6/MzypcyAPFrVoI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mDpgbdmcVegjgiDYhexTQHJqC7Deunwu3C1Zg0MvcmViJByQTCgpeafcEowXliE7g
 czEno+5ifgM7yCYpJZWZg1h04oE8b4cvN9IUOE9WklUKHjFNRY0Wuv4Jar2yFo0LT4
 S6yOvh1D1EmcrXvGZTDaVW8sLI7Aip6nR4QUfu3L/s3eMq4SrGs4OWl6idmgId8BRf
 0i2GID/ac9h9wrMdhy0y5fPqhcZHsZcRk6FWS1v1oDaa62oHzPNEIcsPMZxooMw1Un
 87sZNfKYDCfrm86/lEaAW5ssEtuQeaL44TFgVQFRwysjGLS9rleegcjwSN/MQwqY0x
 lWcu3NCDKV2vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mDpgbdmc
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.1.1
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

On 07/02/2025 19:19, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
