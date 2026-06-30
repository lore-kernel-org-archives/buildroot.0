Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F515C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C6A82993;
	Tue, 30 Jun 2026 14:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMcrPxCyc0Rm; Tue, 30 Jun 2026 14:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336A682969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782829642;
	bh=XgX3mSRr9kD2wl4t2aBGQsdYldNrW8zRtRnmd8s5O4g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mW7p5mMnH7zc77pDOe5NvUpoCicrRh5vT8RIWkX+L17TGtwAqJ7d0kO/GM051S2VE
	 j10ulOAnmWf83e97AU27zwRKS+ul1r8ITfFrKwRSj1VB/pwx3po3SpvFaVYgXYua2c
	 N7crZDu+h0WxK2Im+7/AvQA2QA+2qQCmiY53aWUFIfVks8Dk8Pkv6WALcQBVscXgP8
	 xS7aBKP8H9UCs5V9eG1xooAlzWlM/8p8BFgxcbIwDIT6j/dZ+noSxOOWXGFJZ7Jawn
	 hpIRrvt/GQ5h1DuZ7jExDu9ODQcdTrdQQ+oz731K1scXl9+o9noH4w77nQy4iiomdv
	 OroCDdhwNvUrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 336A682969;
	Tue, 30 Jun 2026 14:27:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70918ED6
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5632760FFC
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eJmmBDTt6ZO for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 14:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E28A760FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28A760FB5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E28A760FB5
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:27:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1wsL5O2g6g-0079cu; Tue, 30
 Jun 2026 16:27:16 +0200
Message-ID: <36567c9e-ffbe-4978-8602-f4a2d695dde5@gmx.de>
Date: Tue, 30 Jun 2026 16:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
References: <20260629210600.630908-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260629210600.630908-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:uOCHZomb1J6mg9WD5qcsBNifKi4pcYribi/l0XxOktKhscKHy2E
 5Sod8kobUM06m1vP/E6nQsC9I7L7ZevZUaSSltINyl+mfP4ZBMQp7V3t3BV2m/Ntk+4Wl0f
 NIdyGMaaY0KeqQiRB13NS6QYXITE21WY+CZmnTobYHXMUKegC5DzK0PEtu2RSEYu0Cgthvz
 rPn5g25rZNhsH8zKpZNjg==
UI-OutboundReport: notjunk:1;M01:P0:z6ghdc6bBNM=;kF6cSvaagETidQjuiBQ7krr7aIR
 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
 ajMn2SpuE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782829636; x=1783434436; i=fiona.klute@gmx.de;
 bh=/3+VfmtO/RpJnSn/neyrNF1yOlxPT9R3NxRd1yAaJE0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=PFtYlWWokjsa+AfFzc0uVy8PbnjDrd99K96vWvVfhaEt7fyXrWCRnQX/MZ6Tiq+o
 p/5u57Pz/SRHIi62jLSttrIOhZnsJt7bsrmdEZimofPJjWH1N/1QH3UsfCv5lhsy7
 bTkeudWEqb0sOp69+WEFSDZ5EHlyvORNhxTwR9XfKhBmbD+rPN8t+LjtTw7ua7Dfa
 ITiUaJTdrIwrN8epVUw8/SWGkTBH+Q4ZTSkS6s4lKcwXQ4qFjwCPjWiSKbZwDLnzB
 Pj5dlxa38agl4XwWYZn6zsOOvQHIJaAvLv78eVTeCob/e4+JJZJTQ09n1VN2hxq5/
 vTQLFJKA9qhiCJBSpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=PFtYlWWo
Subject: Re: [Buildroot] [PATCH] package/openjpeg: add upstream patch for
 CVE-2026-6192
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

Am 29.06.26 um 23:06 schrieb Thomas Perale via buildroot:
> - CVE-2026-6192:
>      A vulnerability was identified in uclouvain openjpeg up to 2.5.4. This
>      impacts the function opj_pi_initialise_encode in the library
>      src/lib/openjp2/pi.c. The manipulation leads to integer overflow. The
>      attack must be carried out locally. The exploit is publicly available
>      and might be used. The identifier of the patch is
>      839936aa33eb8899bbbd80fda02796bb65068951. It is suggested to install a
>      patch to address this issue.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-6192
>    - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thank you!

> ---
>   ...ng-to-insufficient-memory-allocation.patch | 35 +++++++++++++++++++
>   package/openjpeg/openjpeg.mk                  |  3 ++
>   2 files changed, 38 insertions(+)
>   create mode 100644 package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> 
> diff --git a/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> new file mode 100644
> index 0000000000..de5c925ec0
> --- /dev/null
> +++ b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> @@ -0,0 +1,35 @@
> +From 839936aa33eb8899bbbd80fda02796bb65068951 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Sun, 5 Apr 2026 13:25:27 +0200
> +Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
> + integer overflow leading to insufficient memory allocation
> +
> +Fixes #1619
> +
> +CVE: CVE-2026-6192
> +Upstream: https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/lib/openjp2/pi.c | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
> +index 15ac33142..4abb87af2 100644
> +--- a/src/lib/openjp2/pi.c
> ++++ b/src/lib/openjp2/pi.c
> +@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
> +     l_current_pi = l_pi;
> +
> +     /* memory allocation for include*/
> +-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
> +-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
> +-                            sizeof(OPJ_INT16));
> ++    l_current_pi->include = NULL;
> ++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
> ++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
> ++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
> ++                                sizeof(OPJ_INT16));
> ++    }
> +     if (!l_current_pi->include) {
> +         opj_free(l_tmp_data);
> +         opj_free(l_tmp_ptr);
> diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
> index bc5d8143a6..7ded900856 100644
> --- a/package/openjpeg/openjpeg.mk
> +++ b/package/openjpeg/openjpeg.mk
> @@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
>   OPENJPEG_CPE_ID_VENDOR = uclouvain
>   OPENJPEG_INSTALL_STAGING = YES
>   
> +# 0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> +OPENJPEG_IGNORE_CVES += CVE-2026-6192
> +
>   OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
>   OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
>   OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
