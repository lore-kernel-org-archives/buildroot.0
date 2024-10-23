Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6379DD0BB41
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4784035C;
	Wed, 23 Oct 2024 22:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7BpClSItqBY; Wed, 23 Oct 2024 22:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513F540538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513F540538;
	Wed, 23 Oct 2024 22:14:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E9D4960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5498A402E6
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hfFhgQ1-UGi for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C7A640213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C7A640213
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C7A640213
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:14:17 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:15a2:bb79:d1c3:8100])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C720E19F58A;
 Thu, 24 Oct 2024 00:14:13 +0200 (CEST)
Date: Thu, 24 Oct 2024 00:14:13 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <yumklp6vzcucotsbtjeqdgyxg2lv5rtxeuekyf33j7m5g7xmpk@qkce2k2dfzbp>
References: <20241023213643.915658-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241023213643.915658-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729721654;
 bh=aOHCsYQU5fUH50Jqd6G7iiIoMUS+puMx9NmtYiA4DTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N39H+qmiIDO8e3OC309N/pB2siFMnjO+Vfm62XznAhD5Wox2vm0qxXPxxF1gQ8vQj
 cMqusr6VO33QwJpM6UVepqaJ8f2ZADC3x2SArc0S10WOk2ssmR1ZKexOkUzk7O1V1h
 ryeGjGkoKzBj1m0VFN+SoupMMF1XSq20Qk0/7eANvs5vW7d2+XyKyf3JK090PLmwJr
 cJONIVgzN55FSi8Ap9i3gmunlCXhRAgNh74nrQr+SPrKA1O9b23JkSLaAzNK/2pi6o
 58KIF+BVpMpnWDO1B/6zqTY+ND6dLdtIZrWbNVw75YNZpTLwHLCev5prVQmQwNH2EN
 iaF3pyF38pEIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N39H+qmi
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add dpdk runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

It is a good start for a set of tests for the DPDK ; it confirms that it can run.

Ack't

best regards,
  Vincent

On Wed, Oct 23, 2024 at 11:36:43PM UTC, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8169488724
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_dpdk.py | 46 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 support/testing/tests/package/test_dpdk.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 386b4ef38f..f08e15425a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1880,6 +1880,7 @@ F:	support/testing/tests/package/test_dmidecode.py
>  F:	support/testing/tests/package/test_dos2unix.py
>  F:	support/testing/tests/package/test_dosfstools.py
>  F:	support/testing/tests/package/test_dosfstools/
> +F:	support/testing/tests/package/test_dpdk.py
>  F:	support/testing/tests/package/test_ed.py
>  F:	support/testing/tests/package/test_ethtool.py
>  F:	support/testing/tests/package/test_ethtool/
> diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
> new file mode 100644
> index 0000000000..de2828298a
> --- /dev/null
> +++ b/support/testing/tests/package/test_dpdk.py
> @@ -0,0 +1,46 @@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
