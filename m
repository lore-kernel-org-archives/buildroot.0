Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1369CD1283
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 17:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C6E82628;
	Thu, 28 Mar 2024 17:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_KxWjgC-ApA; Thu, 28 Mar 2024 17:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D15F82660
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D15F82660;
	Thu, 28 Mar 2024 17:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D89081BF2F2
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C540540648
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0ZznZ0PvopR for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 17:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 891C1401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891C1401B1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 891C1401B1
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 17:35:53 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 21B7A2C8007F;
 Thu, 28 Mar 2024 18:35:51 +0100 (CET)
Message-ID: <b26c863e-08bc-4b67-9f98-91a0f7018c78@bubu1.eu>
Date: Thu, 28 Mar 2024 18:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240311160323.3015689-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240311160323.3015689-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711647351; bh=FYYH6m3XvyIDModmiOD/VT4edMJjQ4Yxk6CT++YgMfo=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ph9J5CLPsL/bg9bxGRJ5PMa5CtlCpHMG59947GuPYVbZ6l0b1jOV6/BlkMIRWwwHp
 FU1fyAuWf1nMxBuiFAhJ+CR09t3hk8C1RE+pCjx12u6PvjvzawV+HWOkKMkpEhLylj
 W8Bjbv+pX18pIvr+ZzLKY2jDfUewH6/INkZ3/yAScA8QKG5BdoPMiNc3k6Iz76WtZK
 Klj8Uk5jgZqx+Ltsmc9PRoLEIDRntKiDMAkWb8z9Dp35hPUWpFndx8H2v1l3IvU860
 5kPCJFiPdGQ9vuCcpjrBRz30VYwkIUray5v+DRikuBMKEw3ZWYmbuMAz5dulsMYuHk
 7QI9wPpa1z9BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ph9J5CLP
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.46.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11.03.24 17:03, James Hilliard wrote:
> Drop patch which is now upstream.
> 
> CONTRIBUTING.md hash changed due to details added:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/5481ba156804f979cb2d585df3dc012ff3002755
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-By: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   ...-curl-timeout-callback-non-repeating.patch | 44 -------------------
>   package/network-manager/network-manager.hash  |  6 +--
>   package/network-manager/network-manager.mk    |  4 +-
>   3 files changed, 5 insertions(+), 49 deletions(-)
>   delete mode 100644 package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> 
> diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> deleted file mode 100644
> index 8e25805d0c..0000000000
> --- a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
> -From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> -Date: Fri, 13 Oct 2023 16:46:09 +0000
> -Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
> -
> -This reverts commit 05c31da4d9.
> -
> -In the linked commit the callback was made repeating on the assumption
> -that forward progress would result in the callback getting canceled in
> -cb_data_complete. However, this assumption does not hold since a timeout
> -callback does not guarantee completion (or error out) of a request.
> -
> -curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
> -a repeating callback is firing back-to-back without making any progress
> -in doing so.
> -
> -Revert the change and make the callback non-repeating again.
> -
> -Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
> -Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
> -Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ----
> - src/core/nm-connectivity.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
> -index 92de44f17d..d8b0004c38 100644
> ---- a/src/core/nm-connectivity.c
> -+++ b/src/core/nm-connectivity.c
> -@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
> - {
> -     NMConnectivityCheckHandle *cb_data = user_data;
> -
> -+    cb_data->concheck.curl_timer = 0;
> -     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
> -     _complete_queued(cb_data->self);
> --    return G_SOURCE_CONTINUE;
> -+    return G_SOURCE_REMOVE;
> - }
> -
> - static int
> ---
> -GitLab
> -
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index 0196d68c55..8a3c3895fe 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,6 +1,6 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
> -sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
> +sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> -sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
> +sha256  9f7f0d40116e5a0f1566b9da71e9c95738c99364e4b5437d8115aa614490372b  CONTRIBUTING.md
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index f6ef923d55..09bc6aed02 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -NETWORK_MANAGER_VERSION_MAJOR = 1.44
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> +NETWORK_MANAGER_VERSION_MAJOR = 1.46
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
