Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EF7C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C0081FC2;
	Sat, 18 Mar 2023 22:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C0081FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZV1Pg3vPsjhM; Sat, 18 Mar 2023 22:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070D581FA0;
	Sat, 18 Mar 2023 22:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070D581FA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B82D1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35BFF40407
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35BFF40407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLhFbo3g0hIK for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:06:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D432403B8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D432403B8
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:05:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49CE060005;
 Sat, 18 Mar 2023 22:05:58 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:05:57 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230318230557.62e9acfb@windsurf>
In-Reply-To: <20230317193326.17298-1-ps.report@gmx.net>
References: <20230317193326.17298-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679177158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOlt/jU4vSq03GXXBGf1lddGuI+wLraDw8fIbJ270W8=;
 b=gFJpwDCoWznsT8U8l8+HNkz2YmBD5uTjUJoEIb8JPkGelZwhjv93kmQ5z37HlIOdPoicsW
 bSE2OVsvWcvgjKRXmrj4jiM+vr0QxBoEyS4K5HHmwsSol0xlE+gzjE+ZxNQIcw8W6YUhFv
 5QPU/U6FEhQMsTdXqnXLfh77qBAHgE0F8gSxyWGvEdz/y24bynpAJFjCWCgvlHbsgfKQ5l
 N7NfjEzH4gpeNXdpSnstQ7noaCrZAyg6a4UaF3ViTpbf2Dloecy4AnP2YHr5iX5EWv4uTs
 o9S6kpaS/3/p5cwoAWlWYsszuoYQ9yLT69S7Ct1KCdIasWDzSr9C7YPJQVuufg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFJpwDCo
Subject: Re: [Buildroot] [PATCH v1] package/qt6base: network module needs
 libopenssl PSK feature
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 Mar 2023 20:33:26 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/fdf2b2eb252a24e81bddad1c81c4fdfb03dc0afe
> 
>   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp: In member function 'bool dtlsopenssl::DtlsState::initCtxAndConnection(QDtlsBasePrivate*)':
>   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:669:9: error: 'q_SSL_set_psk_server_callback' was not declared in this scope; did you mean 'q_SSL_set_psk_use_session_callback'?
>     669 |         q_SSL_set_psk_server_callback(newConnection.data(), dtlscallbacks::q_PSK_server_callback);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |         q_SSL_set_psk_use_session_callback
>   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:671:9: error: 'q_SSL_set_psk_client_callback' was not declared in this scope; did you mean 'q_SSL_set_info_callback'?
>     671 |         q_SSL_set_psk_client_callback(newConnection.data(), dtlscallbacks::q_PSK_client_callback);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |         q_SSL_set_info_callback
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt6/qt6base/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
