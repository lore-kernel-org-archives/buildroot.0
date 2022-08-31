Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B80ECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FE661151;
	Wed, 31 Aug 2022 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21FE661151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vODMpCfLlZsN; Wed, 31 Aug 2022 19:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8AF61148;
	Wed, 31 Aug 2022 19:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A8AF61148
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E11321BF2BC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7D5741884
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D5741884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UogOR6wEhiQG for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30273408A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30273408A8
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:43:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a07:37d4:42bb:3116])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8EB7413F895;
 Wed, 31 Aug 2022 21:43:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 31 Aug 2022 21:43:10 +0200
Date: Wed, 31 Aug 2022 21:43:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220831194310.GI68979@scaer>
References: <20220829173754.214890-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829173754.214890-1-marcus.hoffmann@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661974994;
 bh=/1GbeWv7nu7z7aItQZKmArGj0QsaCCU3+iHWBc9A5Fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dz6p+wM4hBiizo+ZJmUz18MRi8DSsTz2XX6sxUG5KKB4jOTs9HURW13BqoGU8+eTq
 9WmFzqHZvizxtyJdu01/NQ9DXBgqwG6Sj/NvM+tyMNVvY7OhBqliouhmrW9/H6Xvx8
 Kkw0CIT/30nPr7lrri5gjYSo3N/xD62ynjTf94Df3zasXB9xU2o0IHd5ewZ+3FVe5m
 VUZAthZYbYtl6DTngknJytQMa+Q6nrE7j4KvtWV/6SgaRNpw+UhPjf1nEk2vvhw+Pq
 aBAy+2bhhQkpH8dl21erQ6Y6vBqCGpvCBa426MKNR/0ApaJf+17/rUUV4zjTdsysVO
 JI9873J60PJ6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dz6p+wM4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-paho-mqtt: fix package
 for python 3.10
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2022-08-29 19:37 +0200, Marcus Hoffmann spake thusly:
> Fixes the following error on calling mqtt.publish():
> 
>   File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
>     multiple([msg], hostname, port, client_id, keepalive, will, auth, tls,
>   File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in multiple
>     if not isinstance(msgs, collections.Iterable):
> AttributeError: module 'collections' has no attribute 'Iterable'
> 
> Backported from https://github.com/eclipse/paho.mqtt.python/pull/497/
> 
> This was deprecated in python 3.9 and stopped working in python 3.10
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-fix-publish-for-python-3-10.patch    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
> 
> diff --git a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
> new file mode 100644
> index 0000000000..aad6b5d723
> --- /dev/null
> +++ b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
> @@ -0,0 +1,37 @@
> +From e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed Mon Sep 17 00:00:00 2001
> +From: Brishen Hawkins <brishen.hawkins@gmail.com>
> +Date: Tue, 9 Jun 2020 00:18:39 -0600
> +Subject: [PATCH] Fix for Python 3.9 moving Iterable to collections.abc
> +
> +Signed-off-by: Brishen Hawkins <brishen.hawkins@gmail.com>
> +
> +Backported from: e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed
> +Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> +---
> + src/paho/mqtt/publish.py | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/paho/mqtt/publish.py b/src/paho/mqtt/publish.py
> +index f9f1986e..dcb34ff1 100644
> +--- a/src/paho/mqtt/publish.py
> ++++ b/src/paho/mqtt/publish.py
> +@@ -21,6 +21,10 @@
> + from __future__ import absolute_import
> + 
> + import collections
> ++try:
> ++    from collections.abc import Iterable
> ++except ImportError:
> ++    from collections import Iterable
> + 
> + from . import client as paho
> + from .. import mqtt
> +@@ -124,7 +128,7 @@ def multiple(msgs, hostname="localhost", port=1883, client_id="", keepalive=60,
> +     proxy_args: a dictionary that will be given to the client.
> +     """
> + 
> +-    if not isinstance(msgs, collections.Iterable):
> ++    if not isinstance(msgs, Iterable):
> +         raise TypeError('msgs must be an iterable')
> + 
> +     client = paho.Client(client_id=client_id, userdata=collections.deque(msgs),
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
