Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68F606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gXEV83cz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A78D8607BE;
	Fri, 20 Nov 2026 10:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAqmdnA5X3mJ; Fri, 20 Nov 2026 10:05:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93ECC60E41
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795169127;
	b=Td/PikVqVDGozCuwPOQtA6zZgq9T2E47mrjsr/X393vHFOldft/uPWIPrDV2vVgBTBtB
	 tt+/SL0sJvA2Nuy/3Xwb5gqNaR9wq9fMBl5Y4SYpBwO45tG2A3K87zORlOc3U9RthRB4W
	 yYWtlahPnVCYRu83zELwk8wBrQnycwNSNoIpGKdKoeQ0RhmTMtHFxN4aoZh6jBlz3pPqy
	 DcDPtfRwlR16dCqyl69eqp23pxgazG20SLTDs/KzA8gqNnLjhA9nSI0evjLMrRlPt+rFF
	 JNjdKrmX/Z2/qEkafTmp0BBykLRX93KV14QxjWjQRo562R/4RbhIc4lLbRb4QlGmkQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795169127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=HtYNOOk+hgUs5cwhDLxXVPCpdDo1e48Xn2+hIGp9D4I=;
	b=rMeaG7x+KIcdKz0bj5w55W4WJcIYBNHtm3CS9LfTmRj+/YIeu/oTfn1sQw0brnmQuYIS
	 uX+I3ncSSK2BiFkOO5/SJ/FnREY/gDoZY1RumRf7CoCmpw8DR9LgypujMJwsI32IeLwRm
	 U1LL0j1B+GaXtavFz2fGXwAmerWfx6hDxXXmpkvlxZR1JAk6GoqPLDyMEEQxMQMvyaM8w
	 0ftXS5dlbd5F+88CLSO7v19uNOIgZlnKCJeso5AADvHEv/QMpBV49YQPW6QpZutXAhVtG
	 vGrbRD1CLVs7+MgkDWx0vPPFY4TxiwLVRYuyYn/iC1R29YFyGCkXTcd2XZYM1TPXMjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795169127;
	bh=HtYNOOk+hgUs5cwhDLxXVPCpdDo1e48Xn2+hIGp9D4I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gXEV83czbyLnrYwXtB33KRPPi1G+O2w+fA2iBhJT3XhtcwY3Z3LkyCBVgOroKGjuz
	 ANPvzc2CVq+UXlv0vkJBUmu6EqJnMozHTdWSVH+gRSbOp8jpKtAl/CirOSogPsLWQm
	 ABS5DXoiZu7fSqd2G8Y8QU2Z1nnnp+5b4vPuMtZ6CTBiKZFip3mqfqKkZLk9jlkCGc
	 OHtAEAzV1Hm5qIgu0LKM8kL9wWUbCMFxpk/C/Q+mBG0uHeBI4okNMUXb2Dbh8I1Pz7
	 47vucEzRFBtIeZJ5teY7mqtS8BGsjPEp/a/EatCAoRAPGPVxiz6d45yAosom0mezoZ
	 TRGlqvizijY/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93ECC60E41;
	Fri, 20 Nov 2026 10:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BEAAE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8BA60E54
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPpyMH1mhFTg for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:05:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8244F607BE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8244F607BE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:05:23 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795169122; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:INjQPPsXVClPEOFgXyk89iwBxCxm
 NPEP/GldiLaFiMpqpp3R35Ge4uQhVu60rX/DGZkeUEHUUIIW6BP8RVcgSeyQ7Ci9hVorfjjtGG+
 YMONuSZzZRknspTsVyVckW+THwZ85ltWYTpz/agp03zL9qyugHL4QLMBelvUTvetwVeaaD2SRMo
 VDBl1VMhwV286xulaALUISGbfE15O+dUHWEQkQzqe/ukqaTFbTian8J16FVsiZp9OBSMPYCeb0H
 H1l8mUsp5O7d/qMjf9CWYfjb6VvbTcMScJWHBhhhHE7Cm7zOAko3OWxEV3TNk1WlJiEqMCcWA5b
 FlieVbsCcJQzRQ==;
Message-Instance: m=1; h=sha256: 8+rbP/2tAX5RtoUr6S1DsSaUSdj9A6OzS6PVMGy/MEw=:
 dkZnpBByQxJK+x3Leyr/TzOyLI079ai28MbKNXsiHQU=, sha512:
 HvyLfYQ9tb43KJYS+QQY3pqh4Kg+vJYX+Mg2/NRNzfY8tAOhBqLYOr/sY1WBCFx6gY6MpheYWits3A4hlqhJeQ==:
 zTdk2kxUmGkKb7fMn3yBo7Cuy8mGIeI/P9eb2K5QeUUxvrPWgccAh+e81F9lEP8kcIyojdosp06KDF3PPSJMFw==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1xoThu3hmL-00MZXN; Fri, 20
 Nov 2026 11:05:20 +0100
Message-ID: <ca311b49-d82c-4ada-ac0b-e65582f8f320@gmx.de>
Date: Fri, 20 Nov 2026 11:05:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20261118212153.37218-1-ps.report@gmx.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261118212153.37218-1-ps.report@gmx.net>
X-Provags-ID: V03:K1:0yaRw1wiunIm0JqgGnt2++XG6w/qLC0919QtMy7gJ4t9acf+yjb
 f6faF6L31zXWR398BpaQzzK1RmbHUMG0yYX6scA8XsiKpIBdACkGqjKzRDbngAsQWr/lywu
 I/ndPDUQ0aqF9vMtdPomzlhd2si48GvSpw+fy4dCgQPyBeqrWGBHDNNdG/kyha3OJBNHBMJ
 fHbalUQcpBa1XO6xJpjeQ==
UI-OutboundReport: notjunk:1;M01:P0:eT/WLqNUpbY=;sg5UDZF4GdkKbZ1xKJxiHLXxiL+
 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
Subject: Re: [Buildroot] [PATCH v3] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 18.11.26 um 22:21 schrieb Peter Seiderer:
> - bump version to 3.3.0 (for details see [1] and [2])
> - disable new/optional systemd-hwdb (not needed on target/host)
> - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
> - move group 'clock' from systemd to common udev package as it is now
>    although needed by eudev (see [3], [4])

"also"?

> [1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
> [2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
> [3] https://github.com/eudev-project/eudev/commit/bce05987bfea5cda8060f59159becb7de7353a46
> [4] https://github.com/eudev-project/eudev/commit/82956a47e9191f4c1d8a8ceacaeaf1a9d7581847
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

While running tests I had build failures with older toolchains, turns 
out there's a missing import of linux/fs.h (affecting linux-headers < 
6.2). I've sent a patch upstream, you can just add that:
https://github.com/eudev-project/eudev/pull/306

I'd still prefer to have the clock group move in a first patch and 
version bump in a second. That should be a minimal change, am I missing 
anything that'd make it difficult?

Best regards,
Fiona

> ---
> Changes v1 -> v2:
>   - disable systemd-hwdb
>   - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
>     (as suggested by Fiona Klute)
>   - add new group 'clock' to common udev package
>     (as suggested by Fiona Klute)
> 
> Changes v2 -> v3:
>   - remove existing group 'clock' from systemd
>     (as suggested by Fiona Klute)
> 
> Notes:
>   - This version bump increases the target install size from 11.8 MB to
>     14.0 MB (according to graph-size). See following (uncomplete) list of
>     installed file size values:
> 
>     eudev-3.2.15                        eudev-3.3.0
> 
>     /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
>     /sbin/udevd            435K         /sbin/udevd             927K
>     /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
>     /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
>     /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
> ---
>   package/eudev/eudev.hash   |  2 +-
>   package/eudev/eudev.mk     | 10 +++++++---
>   package/systemd/systemd.mk |  2 --
>   package/udev/udev.mk       |  1 +
>   4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> index 0e24957621..58aa19b695 100644
> --- a/package/eudev/eudev.hash
> +++ b/package/eudev/eudev.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
> +sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 0deb0e53c6..94634f4405 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EUDEV_VERSION = 3.2.15
> +EUDEV_VERSION = 3.3.0
>   EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
>   EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>   EUDEV_LICENSE_FILES = COPYING
> @@ -14,7 +14,9 @@ EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--libexecdir=/lib \
>   	--enable-kmod \
> -	--enable-blkid
> +	--enable-blkid \
> +	--disable-systemd-hwdb \
> +	--enable-tpm2
>   
>   # eudev requires only the util-linux libraries at build time
>   EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
> @@ -79,7 +81,9 @@ HOST_EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--disable-rule-generator \
>   	--disable-selinux \
> -	--enable-hwdb
> +	--enable-hwdb \
> +	--disable-systemd-hwdb \
> +	--disable-tpm2
>   
>   define HOST_EUDEV_INSTALL_CMDS
>   	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index f5fa0920ef..937c419227 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -703,8 +703,6 @@ define SYSTEMD_PERMISSIONS
>   endef
>   
>   define SYSTEMD_USERS
> -	# udev user groups
> -	- - clock -1 * - - - PTP and RTC device group
>   	# systemd user groups
>   	- - systemd-journal -1 * - - - Journal
>   	$(SYSTEMD_REMOTE_USER)
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 3518e874a5..507c1b8022 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -6,6 +6,7 @@
>   
>   # Required by default rules
>   define UDEV_USERS
> +	- - clock -1 * - - - RTC/PTP device group
>   	- - input -1 * - - - Input device group
>   	- - kvm -1 * - - - kvm nodes
>   	- - render -1 * - - - DRI rendering nodes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
