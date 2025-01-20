Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D26C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 13:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B42183F65;
	Mon, 20 Jan 2025 13:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hY_gkcCbScki; Mon, 20 Jan 2025 13:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E9E84184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E9E84184;
	Mon, 20 Jan 2025 13:24:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDDC69
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 13:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B43461068
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 13:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0CcqtzkdIHV for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 13:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4688C61069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4688C61069
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4688C61069
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 13:24:47 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E908D2C80189;
 Mon, 20 Jan 2025 14:24:44 +0100 (CET)
Message-ID: <361f9ae7-7912-4c2b-a61f-c99b8b436dcf@bubu1.eu>
Date: Mon, 20 Jan 2025 14:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
 <20250114113212.1791033-2-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20250114113212.1791033-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1737379485; bh=4XRJTUArisnvxwDDWIrEji73G2zB3CqcFHKCxeopfn0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=W1ak+8nsn1MNNV9x4nCky/iJ1sqVnZiojoQbAd20RmIpCMXq+DfJ2g1/2PBi2NU88
 szI3KWJ78FtAnPqyBHOp8XxaF9U7LZJeHFqP+MfcVMqa9MNMO9yUeDhtLNU2QaENTM
 d7Nc4Y2aNuX9aTVPbi2JFZvaL+OpPxBD0YPE/oZM0pb5neKkkRPNAs/RdaXBlGuEwT
 RhggM2uJ2Rp0U7BNvszKCU9ybh2BsrGNdULWCLh6J/d8G0zrLyUER05soevvBkCUoX
 FvcvtZES63w2+/QnSa6b+vGoROC9BEw4rO2P1BnTAQwfhs5zqbygTd6/CYaDKgjuEA
 bKz/vPEvO2ruw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=W1ak+8ns
Subject: Re: [Buildroot] [PATCH v8 1/6] package/json-glib: bump to version
 1.10.6
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



On 14.01.25 12:32, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Required to build with gobject-introspection >= 1.82.0, to be bumped
> in a later commit.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
> Changes v7 -> v8 (Fiona):
> * Move json-glib bump to start of series, to avoid broken state after
>    GOI bump
> 
> Changes v6 -> v7 (Fiona):
> * Bump json-glib to version 1.10.6
> 
>   package/json-glib/json-glib.hash | 4 ++--
>   package/json-glib/json-glib.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
> index b78d708391..0c0b2cbb73 100644
> --- a/package/json-glib/json-glib.hash
> +++ b/package/json-glib/json-glib.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
> -sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
> +# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
> +sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
>   
>   # Hash for license file:
>   sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index e216af20b1..04d696987b 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -JSON_GLIB_VERSION_MAJOR = 1.8
> -JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
> +JSON_GLIB_VERSION_MAJOR = 1.10
> +JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
>   JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
>   JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
>   JSON_GLIB_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
