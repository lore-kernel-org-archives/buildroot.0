Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFA1C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E81D6079B;
	Tue, 30 Jun 2026 20:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeKVILn-5bRS; Tue, 30 Jun 2026 20:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0E560838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782850298;
	bh=//yujds33WhSNW6/aP282xGA2paBbSIDRSwr1JnBeNI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rzkDSHRRElmb6cB4NiIoeGMcEL4oqP/ITbRUlJtX+gpsbn98QEqzMjkFS62TM+/bu
	 T9oZk5xB6MV9inzG3nQ/p4gSoMns/vt6Mx7qby84eWCUscUKbK/+3MN77YvKmmf0UO
	 Us1g2SFVrf2Wps+xstvgRH1s66XaHYVeKKDin5+wl5aVykkShFji0aHPF5qPJbEIEW
	 JtiiQWQVV8cqOfD6CHmnttMCRr/p2oYOhmMLsby+RWbIKIKHY9jXyyCKrLQdQt0Yz/
	 L6sL9/cCeBGA0O2iJdkJuG1PaVTXvcW9YS7G04eVNLsdDfTB0vEDLBV/v7ySK4IoIq
	 72HPr/yPveDew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0E560838;
	Tue, 30 Jun 2026 20:11:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C79271338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8C0A60BD8
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XomthZ_4IbZx for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 20:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51D8A6079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D8A6079B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51D8A6079B
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 20:11:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXBp-1ws7Bk0QJl-00GUjR; Tue, 30
 Jun 2026 22:11:33 +0200
Message-ID: <ba671d36-029c-4e80-8ff2-f659b8a67128@gmx.de>
Date: Tue, 30 Jun 2026 22:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260630194200.250234-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260630194200.250234-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:Y9zj25jNSpIZ5Q7RYlB4SELF0B7HRgVkBUd/wFXLOWm6LevRMEv
 cbRtIApUvYismz6ZLxyAMqIQWeWPLEmcB2RtJ9KVmg1NbtmWl75t09Yxtc8ZgTHDZLrTyKQ
 GUYFYF0h6bW1inpF2UczPIbuLCUu7J077cNftQWCVdvUqTCrEyjgsT01FDR6Js3/8dXrMkK
 2rrLn+Krkuiqyq8DFmgCQ==
UI-OutboundReport: notjunk:1;M01:P0:SImTIDMOkDs=;8n3RU/JX9+qrFbd5EiQUz5p96Az
 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
 EvwZjEae0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782850293; x=1783455093; i=fiona.klute@gmx.de;
 bh=kHYvN+UPyYTTxV+J0DBmwnG3EaY11k1RFFaMiSp0amk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=c7eeeE9TwkAWpeQlcj9woOE/61UO1RgPSIaETv2VVOqL6wkQ2eIbfRY0knX1LYhJ
 w+8gJw/wx39GwolWc2jM0EBTAqPag+lHmDYkVYnyJVJqpGoOjisD2F/7OzcuT754g
 QMUbNQcCWZIXvO0mMYVSXcpFqOANwpDzQkOWhgn8yWENYaVc9NWPMWDlKb94geDWX
 VfAByNUhAmjPPCvUk7xF42TmkEpBMrRiYlqHQCUSHFciP53woj68CMLiYXabEqKu9
 QzvgsjDTt2Qqu7L6H9sZ4e5VJqHCzyJAqjQ+jp4P4Cbb5zRMXX83Bes8fTfGracwp
 b4HdLZxiErWATd4h5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=c7eeeE9T
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libssh2: add upstream patch
 for CVE-2026-55199
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 30.06.26 um 21:41 schrieb Thomas Perale:
> Fixes the following vulnerability:
> 
> - CVE-2026-55199:
>      libssh2 through 1.11.1, fixed in commit 1762685, contains a pre-
>      authentication denial of service vulnerability in the SSH_MSG_EXT_INFO
>      handler in src/packet.c that allows a malicious SSH server to cause a
>      client CPU exhaustion loop by sending a crafted extension count value.
>      A malicious server can set nr_extensions to 0xFFFFFFFF during key
>      exchange, causing the client to spin in a tight CPU loop for over 60
>      seconds because return values from _libssh2_get_string() are unchecked
>      and the session timeout does not apply to CPU-bound loops.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-55199
>    - https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

And series applied to master, thank you!

> ---
>   ...et-string-return-in-EXT-INFO-handler.patch | 43 +++++++++++++++++++
>   package/libssh2/libssh2.mk                    |  3 ++
>   2 files changed, 46 insertions(+)
>   create mode 100644 package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> 
> diff --git a/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> new file mode 100644
> index 0000000000..c7319a6b51
> --- /dev/null
> +++ b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> @@ -0,0 +1,43 @@
> +From 17626857d20b3c9a1addfa45979dadcee1cd84a4 Mon Sep 17 00:00:00 2001
> +From: TristanInSec <tristan.mtn@gmail.com>
> +Date: Wed, 15 Apr 2026 14:51:08 -0400
> +Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
> + handler
> +
> +The `SSH_MSG_EXT_INFO` handler discards the return values from
> +`_libssh2_get_string()` when parsing extension name/value pairs. When
> +the buffer is exhausted before all claimed extensions are parsed,
> +the loop continues with no-op iterations until `nr_extensions` reaches
> +zero.
> +
> +The `nr_extensions >= 1024` cap limits the worst case, but the loop
> +should still break on parse failure for correctness and consistency
> +with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
> +`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
> +
> +Closes #1864
> +
> +CVE: CVE-2026-55199
> +Upstream: https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/packet.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/packet.c b/src/packet.c
> +index ae86365d2a..8a7a0d2690 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +
> +                     nr_extensions -= 1;
> +
> +-                    _libssh2_get_string(&buf, &name, &name_len);
> +-                    _libssh2_get_string(&buf, &value, &value_len);
> ++                    if(_libssh2_get_string(&buf, &name, &name_len))
> ++                        break;
> ++                    if(_libssh2_get_string(&buf, &value, &value_len))
> ++                        break;
> +
> +                     if(name && value) {
> +                         _libssh2_debug((session,
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 1843d25051..c85129a7cd 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -16,6 +16,9 @@ LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
>   # 0001-username-len-bound-checking.patch
>   LIBSSH2_IGNORE_CVES += CVE-2026-7598
>   
> +# 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> +LIBSSH2_IGNORE_CVES += CVE-2026-55199
> +
>   ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>   LIBSSH2_DEPENDENCIES += mbedtls
>   LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
