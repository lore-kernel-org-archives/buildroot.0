Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D04C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D11D6068C;
	Tue, 25 Mar 2025 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IosvWtBJR44b; Tue, 25 Mar 2025 18:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC40660EA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC40660EA2;
	Tue, 25 Mar 2025 18:29:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2804A1B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E2F403EB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KZSbEAnSs8Y for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C3EF40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3EF40399
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C3EF40399
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:29:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2BFB02003B4;
 Tue, 25 Mar 2025 19:29:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48480])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 19:29:20 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 19:29:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast@intel.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250325092115.2588697-1-francois.dugast@intel.com>
References: <20250325092115.2588697-1-francois.dugast@intel.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7fb8e6049eed7e6b3284cd4bd2c8a893@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742927363;
 bh=UFbcsNmI1iCKZpnSQpSAH8WuZfK4RNq9zTNvi+QnZzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wf7faSQK+eol3HSJo/n5KC7CNP8VTbLyMFrN3mWSUWWRubbsd2DM769iQpT+w/cjr
 clzDu6uA9sY0WSUDDJhHZANqNq5ovtRq3g//2xf9NCwWUFCJS/ZIPfIoYdEmmXpsPD
 M3o66oifWn9nTR5cMYxeGqJZRr9NuRgs6KQk5CEFKf9qbXrWCkqG20UlEKqZcRf23k
 UhUUqZ4Fyne3EFJcooYEHu2QBhllkBYxKf3fnw4DlGqVS13bfnzRrrFBOXI1+EkXjM
 KKMmsVWtnl9pvZmM7hAi/bMpSWnsM4ka+KJC7VO4Ku2uFa0R/ICb/09d0q0gf+Iloy
 KVtmaNsxOHImA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wf7faSQK
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 Intel Xe firmware
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

On 25/03/2025 10:21, Francois Dugast wrote:
> Add an option to install the firmware files used by the xe driver.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Applied to master, thanks.
For info, I added the LICENSE.xe hash in the hash file.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
