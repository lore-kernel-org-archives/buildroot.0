Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BCC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429D060E7D;
	Wed, 28 Feb 2024 16:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryGs1elb05Yk; Wed, 28 Feb 2024 16:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D99360E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D99360E81;
	Wed, 28 Feb 2024 16:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2771BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03B144017B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFUJOs8AGO4W for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6275B400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6275B400D9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6275B400D9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:24:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF41C000C;
 Wed, 28 Feb 2024 16:24:42 +0000 (UTC)
Message-ID: <08ec51d4-8aad-40e8-81f0-33b8ac66299d@korsgaard.com>
Date: Wed, 28 Feb 2024 17:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-3-thomas@devoogdt.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231110164617.569602-3-thomas@devoogdt.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v5 3/3] package/webkitgtk: bump to version
 2.42.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/11/2023 17.46, Thomas Devoogdt wrote:
> Update to a new major release.
> 
> Release notes:
> 
> https://webkitgtk.org/2023/09/15/webkitgtk2.42.0-released.html
> https://webkitgtk.org/2023/09/27/webkitgtk2.42.1-released.html
> https://webkitgtk.org/2023/11/10/webkitgtk2.42.2-released.html
> 
> Security notes:
> 
> https://webkitgtk.org/security/WSA-2023-0008.html
> 
> - USE_JPEGXL is enabled by default now [1], so add a libjxl if used.
> 
> - ENABLE_GLES2 has been dropped, so drop it also here [2].
>    Instead, enable USE_OPENGL_OR_ES if libgles is present. Beware that also
>    libegl is needed for USE_OPENGL_OR_ES, but that one is most of the time a
>    dependency for libgles, so leave it out here.
> 
> - Also raise the minimal GCC version to 10.2, which is required since webkitgtk-2.42.x [3].
>    Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
>    we do check on >= GCC 10, because we can't check on >= GCC 10.2.
> 
> [1] https://github.com/WebKit/WebKit/commit/93865414f33190c57e293a80492e10edc461d7f0
> [2] https://github.com/WebKit/WebKit/commit/cfe917fec45bf72c371087ece034feee8454f1b4
> [3] https://github.com/WebKit/WebKit/commit/133498aaee8f44443d9e3b2a08be4a4b77b93fc9
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>   v2: n/a
>   v3:
>   - replace for package/webkitgtk: add a USE_OPENGL_OR_ES config option
>   - 2.42.0 needs an extra bunch of patches, so bump to immediately to 2.42.1
>   v4:
>   - fixed incomplete git massage (a ____ line splits the git message apparently)
>   - re-added patches with upstream cherry-pick and hash
>   v5:
>   - 2.42.1 needs an extra bunch of patches, so bump to immediately to 2.42.2

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
