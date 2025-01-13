Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13594C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A02606D6;
	Mon, 13 Jan 2025 21:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aqv4E7_S9j8P; Mon, 13 Jan 2025 21:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EACBA6078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACBA6078C;
	Mon, 13 Jan 2025 21:07:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED2C9942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA96260762
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHC7JK033rZM for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B9B6606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B9B6606D6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B9B6606D6
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:07:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1tlXDr1ptd-008RId; Mon, 13
 Jan 2025 22:07:22 +0100
Message-ID: <096f7ff9-4032-40bc-9c03-cccbca4d675f@gmx.de>
Date: Mon, 13 Jan 2025 22:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-6-fiona.klute@gmx.de>
 <20250113213300.4ba5d4b8@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250113213300.4ba5d4b8@windsurf>
X-Provags-ID: V03:K1:m5hdZUZ+FCvAuszea904H/FsM/75zYMjnoFoHUuBlSSFkQxZOH6
 ik5a8La4Yhw1d3NswtjUe6CTnznaRgyUqihWO7ig7vG+MYC36uHiOp8AZJUOlRcK7y7ayXv
 mzuM8A8ZiE7IEYsOnRtKXCcQvmxMz+AnqZA5RbiFV6Ot7II5o30ft0goOZS+iQKLp20bLfd
 99lyMginI/OSR7NdxyFmw==
UI-OutboundReport: notjunk:1;M01:P0:joWZ6mmUCqk=;pzQOtcBoCLvJsOxfD+BriawoPMd
 zxaRtTYITXISOSjEu0iYj7UE4B9YezpS/zdy7PUV6yNNeoMVSBWesRKRcvuh300vkr9+U/kZ9
 iWwNkOC7AJY8vFeWVIUSw7+zkyS1Cgyxlle3oy7ncdZOxhQxgx9K7XbxUFRSKdghwi7pu9+gj
 gN7MnQ8STRNn9EsuFOq3XhsA/eDy+dHkngOIuce7r2UepdN+EmDCbTTozkET9jDEcBkRfMJzB
 BcVYBmKbB7Dy426h47M78LnEkDfq9gqE58eiUQW8VDcvaTlWEPT11QP3q3lRz35CVLgwnhykd
 9+xsgxxRLoat00aQFvgU+Gh1ywyOKK+RLvznHogaukcwbcCudZ19NNoGuxvlEM0mA1u+YyVTN
 3l+D6EdVZfAhOEc7rr4S448Bt3yEgXOFBXiUeQKy9/kS6g3gn8a3gIBM9330kq+kR5/BLXlTl
 mf6/CaiILXg3A80wZ/caZmtkbbAOyhf8rypkxBaqjie+NyObLqzgpfYajYTMTrGi4MLsfog3D
 2OYjpzaQLsdK2avSuXOkMdVuB/RcnVJc63mrlWmv+emplXQjfLoqN5v8KnWmM2t4wGr77qt4C
 qPHtLgPxQSM6hPexD3/ZZ7tSz8I66zhdxE1pZVpgBKaCoO/UBYnuPpL9zgRCl3wbHeH97wtuh
 VAMaxH5xIclJvIpdEbv9lzXHyKMJnYYuuRASbk83PRkaFoM9B1L2myenpbJcB5zTxHM2jLScy
 mxAE6rsYtF2Gqq4BUOb41OAFRfW5lmR+7shfEFOlPnKbcbEuqk9KLSHoU063WOdH9LGJ487FI
 D8YpApu1ZrEcy8BrRN8ElkMSti3lyz1xO8quTe8De50u7hhO2cwcd8vageyqCO79aEG1O1vha
 HDn9gxsAtIN0mEamOTL0PUkRAnPV5QLA12AN442B/HaJ5Bt5t2jyM1wMNxSNEoNZ4j39Jbi40
 uFkWOhRaqpjgdAwdy5MgmsC3kIYB8fhqgcLXfAmhyd6ggKNoIbTsHyDavuS0SF1uXaae8YdVm
 KQwvLfnA1+Ivk98e6RMeRtuyhr0V9Gy0YJhJG029PG/2fATX28jUe/SRQV4P1sIBMjH58rve6
 cMpzinPiuMfQ5lJm/h+Kqr1qOG3IKh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736802442; x=1737407242; i=fiona.klute@gmx.de;
 bh=wXUvZAHL9J4Ddj6CuyUnCUV0Ed05pYcM530mItLV4Eg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ph5i5PzlDjMMrHhtR9EwqBXe8Mnd6WrCzZbClY7/x4aohvGFR0cfwNHxn1h1yyB6
 xivcTHxFmCOfoqzO92tGyFOYwOmcXTJopyyN848T5UdciFxMCJlL07iMSrDmOdW9U
 FOC560JsnsAdYpgr65R16WSZX9ECymLNPVQq5/QtT9YiBVBhHo6GB2x0x9458/vBb
 zg2c+lf4bybdOSw7Ezh+5v+wdkkJopKHVHxHbKmApua4M0M5cGX8H6o6YQpdJyaZH
 oFd7OImq1NFDZ3fWnvu9lXb+l6P77GD8t44z8yJFNzoIvuu0t9GrCGlRBdVcS9Xkq
 gOVXgxUAavqBbd/GTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ph5i5Pzl
Subject: Re: [Buildroot] [PATCH v7 5/5] package/json-glib: bump to version
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 21:33 schrieb Thomas Petazzoni:
> Hello,
>
> On Mon, 13 Jan 2025 21:04:54 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Fixes a build failure due to warnings from g-ir-scanner:
>
> Does this happen due to the bump in PATCH 1/5 ? Does it happen already
> before ? If it is happen due to the bump in PATCH 1/5, can this patch
> be added *before* PATCH 1/5 in the series, i.e does it work with
> earlier versions of glib/GOI ?

I'll have to test a clean build to answer that, the upstream changelog
doesn't mention a specific version dependency. My notes say the issue
first appeared with the gobject-introspection update to 1.82.0, probably
some checks became stricter there.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
