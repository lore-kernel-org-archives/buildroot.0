Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25283C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 13:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7866084F;
	Sat,  5 Jul 2025 13:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K22fErSzmou; Sat,  5 Jul 2025 13:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3176660E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3176660E2D;
	Sat,  5 Jul 2025 13:44:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEF6E15F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC72060E2D
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHr0r5tmt4Me for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 13:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1E416084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E416084F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1E416084F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:44:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B1BA57804FD;
 Sat,  5 Jul 2025 15:44:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 15:44:19 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 15:44:19 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250705115751.610287-1-thomas.perale@mind.be>
References: <20250705115751.610287-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <e4e913e713cfc746c4808481c94bfc13@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751723060;
 bh=o3hndBynPF/6aZXWBAjyXNUQRIYcFTBGeQnXHNgTwYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D87SjEG1D6bGHkVV5wEU7mGgoUfsBC9xSSJCvciPHUSRfWylVzxhza1dZgc0KadpF
 W0EnZ9GzWusMvjoJOtoYLP+iB30q6HIMKFquWj4f1UqyP+tEFDdRHWRqvlYbZing0Q
 +/Y5Z7wwW93n0fObCKajogYiqIiyXo/+aXIaD3lSEuzxxVXin+rV6Zj6J6/q9VwBwj
 t6Tc1HgW/ZYsGULHtdCOpNlE9WcMZ+7BSXq9LVjsEWsG4Bpj42sMdHcSr1ejfZKcRF
 BSU2Q3pIw2rqZTHvxNPMHKv7wYXSh7/LQJ1ADW7w0y1l4jYtTzqeOpTF7LXBBy8jUU
 n2t5p9hZc8qtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D87SjEG1
Subject: Re: [Buildroot] [PATCH] package/shadowsocks-libev: fix build w/
 mbedtls v3.6
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

On 05/07/2025 13:57, Thomas Perale via buildroot wrote:
> Since the mbedtls bump to v3.6 [1] the shadowsocks-libev package is
> failling  on the autobuilder:
> 
> ```
> checking for mbedtls_cipher_setup in -lmbedcrypto... yes
> checking whether mbedtls supports Cipher Feedback mode or not... 
> configure: error: MBEDTLS_CIPHER_MODE_CFB required
> make: *** [package/pkg-generic.mk:263: 
> /workdir/instance-0/output-1/build/shadowsocks-libev-3.3.5/.stamp_configured] 
> Error 1
> make: Leaving directory '/workdir/instance-0/buildroot'
> ```
> 
> This is due to the breaking changes in the mbedtls API with the version
> bump.
> 
> This patch adds the upstream patch [2] that address this issue by 
> verifying
> conditionally the version of mbedtls we are running on to make the API
> calls and includes.
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] 
> https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6#
> 
> Fixes: 
> https://autobuild.buildroot.org/results/070/070581d95f2739cee3b4cb8252639dd92b5a8421
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
