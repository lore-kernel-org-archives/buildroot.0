Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE929CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769578453B;
	Wed,  5 Nov 2025 20:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KknkzKvsRW92; Wed,  5 Nov 2025 20:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8419D84532
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8419D84532;
	Wed,  5 Nov 2025 20:41:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAD64C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F0FF613E7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Td3YXpLgonM for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 101C4613E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 101C4613E6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 101C4613E6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C3764780504;
 Wed,  5 Nov 2025 21:41:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 21:41:27 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 21:41:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20251102113740.1398246-1-bernd@kuhls.net>
References: <20251102113740.1398246-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0e39a46df35a890e6e64ccdd483495ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762375291;
 bh=JKYDMXi5BjlzFbGQrT9ByGqqB1JyFOXc0/deMw1qIlc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZPzUWWzhQG3i8gzCRQcwb435fwV6F3xnDTiFY0rhHdLpBppiU20ifxMkTran+EViJ
 bw1b6UR9FlZkrYIPbp0elQ5B5xM2T0WwpiIb6a79lR0GLAWjDz8jSVPRc228bGT6bO
 VkgyuDHM79s9bFxo5EANa1bR2qzUipJSAfLsECJfJWgarvSVAmZZoDY6pN8H4AA5RS
 YSWtRA7yBl3JIRgKYh9SJ81biTuqUG+LEO9LXHfiSkPRNkbtzzlf3oH6TLkAX6vuTf
 E6Ona/dWkTedm9AV0UYaWlV9J1yn2npSoLKGpOCUEr9HaaJo7e49tqUSla0HxyxAY6
 pcphr8DWT55MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZPzUWWzh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-cors: remove
 license file
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

On 02/11/2025 12:37, Bernd Kuhls wrote:
> Upstream tarball does not contain a license file anymore since version
> 5.0.1 [1] which causes errors after buildroot commit
> 04cd135b26406dcc31cb66af1480d53fffe81e59 which bumped the package
> version from 5.0.0 to 6.0.1.
> 
> Fixes:
> https://autobuild.buildroot.net/results/1eb/1eb9d68616793c9241bcb55bc2ea1929608c68bd/
> 
> [1] https://github.com/corydolphin/flask-cors/issues/382
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
