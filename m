Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B7C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92354404EF;
	Thu, 20 Feb 2025 14:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUFPuEHgwm9b; Thu, 20 Feb 2025 14:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420C24050D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420C24050D;
	Thu, 20 Feb 2025 14:51:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B93EACF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A967383A8F
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc8LvmZfKSpd for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 14:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C06F83A77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C06F83A77
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C06F83A77
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 14:51:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.224]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzfv-1trROi0uRF-00RKma; Thu, 20
 Feb 2025 15:51:21 +0100
Message-ID: <6a01e7dd-8b09-4d60-928b-52f0de88be70@gmx.de>
Date: Thu, 20 Feb 2025 15:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20250220133635.26056-1-mf@go-sys.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250220133635.26056-1-mf@go-sys.de>
X-Provags-ID: V03:K1:NWXjPwH9toZaHkKGmG/W1+z1KrAxcU6XPy67J1nSaUDXBOc7Ayp
 JqkPFvjRR0fNvZvySH//9zJHB4QQ+32dwPx+iyBwb+v93+TLvo7oi5z13lKw8VzzrzJmuPN
 QGO8rJ4QALIquofmNUMj+q+z4BD5v2QbM+RC5L017Q5pw3wWXdsiAmOAKxVppO7MJuHHFhs
 G8Y49Rq6nOFToA0b/DX3w==
UI-OutboundReport: notjunk:1;M01:P0:0yKNN9YG/z0=;wcDbJQiNym1EKjgIJrYu0EYDyOw
 kBcmOvm1RhBYP3DJCPasRsb3zhdSZXtq0o46yleqdCymJ3p6qk4mZfkL4cZEKsbucLmgPskaQ
 S+O5ZqiUh4Mxc1DHWtV3/Ff8Ou3EkvJ+6Cg+XNbwJtv+82FV28weHN9hnQisgWru4JIqx6X24
 x3OWbVRUsZrZnjEPjZ1GW3/CIQDRGkvtdfAVVNdxqQZausO5l2f460e321mN8cwWcsSDd/gWu
 ChNGFeOpvbvxQUaZ+n2YXKGsdqYovRpVwfPf2yOwTYTdDW76HQGK4MamkmNxziwuQZaymoeXD
 D9Ian5ghNfSojEfxabqM8qv/OzyH+4fuQO5kKf8VHsWzwhtEB23h9QChmjGx3Bn3S9Zjjsw6u
 zdMimO6/CqezRjvQdjNGbSY6AcrPh4/YWP4F3gnSDD0B0puK1zAndAlgfkfvSiuhVS4h1rrd2
 O5q04aBcSTX9QmW15N0mj2GgSYSaxmnPnRHqJHSlJOg7IFKf1g6jhRPl1fe8qKL0niGEo8md2
 9hvrzIp7FBKPMuN0rl/WvY7g5kMVBM4z2tbs9tiWy+7dcUhrLSU+m2y3+dwDoEHp6rvB3cT7s
 V1XnhVBdbLzte/bjqiP1HadPSV3JE8gau+K9Ofrm0ZY9X+ccCRwcnvzKhd73Pb8sk8DWlKRPa
 6aeMGbOVpazf1TdGJ/NQpQPYxHDFbuY+gsEOqGJIlE3sBYhj4zJ6gmwLNBPGKN0CpOzczVqWN
 W52l3OqsNDoJjCpDBd6gwoje9z9avcl5lCoDryI77L18P/aJno/xUpl5iVYO91rfh3fNt8HMn
 o8z0nn0l6xIqpBXf7lfcOKFSKwVNsLL0BGWBsslv9rc4UEZJJkCLy8h+GVQ21B7CxLTZUfjwG
 3Cgz6/2T62YzP1+zJShNU5TrT+5CYqkD2sqQ8P8YWewPb7ULXz1cRczka/FnFsd4df6cptBdB
 WbT3/2gwIAgl+jGmfcY0N5L7BUJ9AoTrJE/7zDLkOdHB9c1zmkVTXiVh76gEfiYG4CJMqzM+4
 hGBzUjvrXF3c4udrtBdICPwD0na8eFkmqI4/bJIWP/60sG/AHDKzXOj2wO2mFl+wOJ+7Fr2gf
 prAMirUM3H/7xcCn1x597azJVL8KMtVl+XQlnz/wPN3ab3+9k9ig5/gqJjdTaRBjW5VuZBHj6
 Lakh4GYLaDp2vbIn3wgQS2B/H9WAR1G6iY6iMsR4fBVgQBtvti9tcyzRsJk6kQmC9K0Gws36u
 erzygE8uufDTWiIHDwf09tD7m3dRbk6cfbxzymnSoG2Ih5jhDkkqik0quWtvw3Zx1RRxBdO9i
 C5JwF+54RLMidy1slAFrEP/dqPJEX3S5nH37Q1WyMJO58gK/7rBZHSM/x43D/Ur1LuG4mSJiR
 yPx/hea1wYUqI6g64gp0pd1fmQNLAjGzwnbKD5kAEU621rOjRb5g8iQR61t1UT/zb+oHuVqVP
 Ybz6ADA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740063081; x=1740667881; i=fiona.klute@gmx.de;
 bh=9TRXkDtcVdrZblo1Uj01hsPLyVCYjPfL350+LPGdCfI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=R4mqF+kOWWaXKRdhx8TCuhc38K7/Si8dHTplhqxXQv2Qu8XbueC53gpFkguQ1jzZ
 2OcIWx4rrtkamGE1yoveSKPXx3bjBJJj2XG9wArJ8f01FuDdrI8mWdprzyRffUBbT
 ggdEBYYIQFyOxTSGPWqqWcN4dYyOGgrJsXaVPwCehOr0QbDTiBdf0EETXXas775aY
 3a3vl0nPSAusb4oHdCbWVC7Hw2GnnLjNOIfNmeCyCdQ0l6D4OJPh6YiSdOM2CpgkT
 VXdYa2TJ9PGVt/eNb+NLppwUz0of0WTZlhJtNtkNP0lkIRqwILRNzj1qtDhpA/7kC
 FN86CqTV9Uxfhldxiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=R4mqF+kO
Subject: Re: [Buildroot] [PATCH v2] package/openssh: security bump version
 to 9.9p2
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

Am 20.02.25 um 14:36 schrieb Michael Fischer:
> Release note: https://www.openssh.com/txt/release-9.9p2
>
> Fixes: CVE-2025-26465 (ssh) , CVE-2025-26466 (sshd)
>
> Drop upstream patch: 0001-build-construct_utmp-when-USE_BTMP-is-set.patch
>
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Builds and works without the patch now. :-)

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thank you,
Fiona

> ---
>   ...-construct_utmp-when-USE_BTMP-is-set.patch | 35 -------------------
>   package/openssh/openssh.hash                  |  4 +--
>   package/openssh/openssh.mk                    |  2 +-
>   3 files changed, 3 insertions(+), 38 deletions(-)
>   delete mode 100644 package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
>
> diff --git a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
> deleted file mode 100644
> index 85ad5a538c..0000000000
> --- a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 76a618d2842c34c16cd21a4efc7230e2f459008d Mon Sep 17 00:00:00 2001
> -From: Damien Miller <djm@mindrot.org>
> -Date: Wed, 25 Sep 2024 11:13:05 +1000
> -Subject: [PATCH] build construct_utmp() when USE_BTMP is set
> -
> -Fixes compile error on Void Linux/Musl
> -
> -Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d
> -Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ----
> - loginrec.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/loginrec.c b/loginrec.c
> -index 45f13dee8b1f..7b1818b86753 100644
> ---- a/loginrec.c
> -+++ b/loginrec.c
> -@@ -614,7 +614,7 @@ line_abbrevname(char *dst, const char *src, int dstsize)
> -  ** into account.
> -  **/
> -
> --#if defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
> -+#if defined(USE_BTMP) || defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
> -
> - /* build the utmp structure */
> - void
> -@@ -698,7 +698,7 @@ construct_utmp(struct logininfo *li,
> - 	}
> - # endif
> - }
> --#endif /* USE_UTMP || USE_WTMP || USE_LOGIN */
> -+#endif /* USE_BTMP || USE_UTMP || USE_WTMP || USE_LOGIN */
> -
> - /**
> -  ** utmpx utility functions
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 5758ce4f36..0bbc4874df 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-9.9
> -sha256  b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02  openssh-9.9p1.tar.gz
> +# From https://www.openssh.com/txt/release-9.9p2
> +sha256  91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673  openssh-9.9p2.tar.gz
>   # Locally calculated
>   sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 95c059e03d..115290ce13 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>
>   OPENSSH_VERSION_MAJOR = 9.9
> -OPENSSH_VERSION_MINOR = p1
> +OPENSSH_VERSION_MINOR = p2
>   OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>   OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
>   OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
