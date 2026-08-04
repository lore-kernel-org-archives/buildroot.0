Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94E4C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AC36074D;
	Tue,  4 Aug 2026 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4H-DXw6a6DL; Tue,  4 Aug 2026 12:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EC4605FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785847777;
	bh=DfI01qGqlCd11eN+DJLRP95NC7QvlQ/Yy5zhtYmPV4Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XNfIoZY/X0a/oZd9xEYiVYZb4rKUI96AE1cjpXcyzkEAxtLopUGKubHrtodXuyxWX
	 P+xjcElleTw3B3wZfaT+xiGiFZ/qo35zTJ3xXTe9bUE2GozgeOwBFmigkRoGNFRtZw
	 GUgR5rwdmdI4dF2NI2NmfuD7gAPXnsXwSoGLpb7aCC08BZf22W09VrldU5H/qAQKwT
	 JNA08SeBTTcnycDIpdY2Mh5d+kfNsnHqaoTVZnaBO2ZY2aqqsCZACl6fI2dqEbq6wr
	 U76iiNrfCw/mS608ZJsYowohnUvXctgWKPvDfppvsQO/ZKCj43bMQATONFE9y8zuRN
	 StQvgL7pe238g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EC4605FA;
	Tue,  4 Aug 2026 12:49:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0118326C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB514406E6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxMBu2kpqHM5 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6F77406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F77406E2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6F77406E2
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:49:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1xFqpX0EMk-00bFZD; Tue, 04
 Aug 2026 14:49:29 +0200
Message-ID: <039a4a84-fed9-4c9a-a622-1d31d2697ab4@gmx.de>
Date: Tue, 4 Aug 2026 14:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>
References: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
 <20260607085844.1334630-1-jeanmichel.hautbois@yoseli.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260607085844.1334630-1-jeanmichel.hautbois@yoseli.org>
X-Provags-ID: V03:K1:Y+j7/7dTK//QuACcpdJPo/m25az+C/5bBmwy41xuLgWndkt0sYY
 DMs++OaaEpD7XOxeZ45DFzuJIWsxYaHdektcDojkALMonic7GLKavccpzZBxY7hZPKDd5Oi
 SQw/dkzYUKJT71o3h75XuW6gdY4mVltff1pv4MLWzsskNUdv8S5tmUFYEfkaWEKl0t23moO
 RlACDI/9eh9jCzCUhhhFg==
UI-OutboundReport: notjunk:1;M01:P0:qo9pN/S1wfo=;cxoKGnB2qnMgBRhT+dhV5ykIndg
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785847769; x=1786452569; i=fiona.klute@gmx.de;
 bh=dAN+/Y6xKOeJ+xrMN2K7jxwJ1jUAdEe9Z+9lz3Peydw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KhHAs/mx8RFu3v/ElBD9plB5E3CUboEkE3lWDE0QPTDENlF8FObBufciAuDFlcvH
 4JgawQXQzn6y7L80kp93QnjWslCvTHxOfi9I5Z3vLKmfUsz45xLI9D/xMHCCjmaHX
 5jiStQFQMyadtFELKwKp2m2+7rmDg/BMfbUN9Q59YE2WPRTeskOErjkiQQpgLkVl7
 yPqVS9q0FPCZD/sVbLcKOT97CZ3HVOjIgq4s2dCwjZRSymve7UQY3wZwPXG1juREY
 JxcYapUSARconCGvyUXcYtO4/XETUTcxWgmdWMIB7Fwm2Gi9qo/XGjKRZAs7g8zJ8
 9f1lMzPVD+2qk6X9yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KhHAs/mx
Subject: Re: [Buildroot] [PATCH v2] package/libglib2: disable sysprof for
 the host build
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

Am 07.06.26 um 10:58 schrieb Jean-Michel Hautbois:
> Whether the host libglib2 picks up sysprof support depends on whether
> libsysprof-capture happens to be installed on the build machine, which
> makes the host build depend on the host environment. Disable sysprof
> explicitly for the host build so the result is deterministic.
> 
> Keep sysprof enabled for the target build: it is useful to profile and
> measure the performance of applications running on the target.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Applied to master, thank you. I've modified the patch to make the same 
change in package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk.

Ideally we should explicitly set the sysprof option for the target 
build, too, rather than letting autodetection do its thing. I see that 
package/sysprof depends on libglib2 though, so there might be a 
dependency loop. Maybe you or Adrian could look into that?

Best regards,
Fiona

> ---
> Changes since v1:
>   - Disable sysprof only for the host build (HOST_LIBGLIB2_CONF_OPTS)
>     instead of disabling it globally, keeping it available on the
>     target, as suggested by Adrian Perez de Castro.
>   - Reword the commit message accordingly.
> 
>   package/libglib2/libglib2.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index cae8a85a28..ae4b653a15 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -30,7 +30,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
>   	-Dsystemtap=false \
>   	-Dxattr=false \
>   	-Dtests=false \
> -	-Doss_fuzz=disabled
> +	-Doss_fuzz=disabled \
> +	-Dsysprof=disabled
>   
>   LIBGLIB2_DEPENDENCIES = \
>   	host-pkgconf host-libglib2 \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
