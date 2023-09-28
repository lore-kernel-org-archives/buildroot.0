Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6A5CE7AFC
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 18:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9270242D01;
	Thu, 28 Sep 2023 18:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9270242D01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En-XEublUlSh; Thu, 28 Sep 2023 18:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98A242D06;
	Thu, 28 Sep 2023 18:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98A242D06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE7F31BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 18:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D4460ADF
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 18:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D4460ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KivGDDgP0AJT for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 18:18:10 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59C60607C7
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 18:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C60607C7
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.166] ([178.165.194.191]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MO9zH-1r10WQ2eNt-00Oa5d; Thu, 28
 Sep 2023 20:18:03 +0200
Message-ID: <c488cc8a-6df4-49d2-bb36-096abe1394b8@gmx.at>
Date: Thu, 28 Sep 2023 20:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20230921181916.546643-1-aduskett@gmail.com>
 <20230921181916.546643-2-aduskett@gmail.com>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230921181916.546643-2-aduskett@gmail.com>
X-Provags-ID: V03:K1:B37CL3aI1ShIn7mxzgGaLfB5j3dzMtiBXyl57qn6Mv1skrP0m6J
 uWqCN5opkHcMaPj/k44Won67MBRlr4Wq07twx4WZ3vwAiU85aIaMi3+IZ7/FNcbSZNLLSVc
 m+2R06OQDQJQxtc+zfAD1llV2jut+p75R2gHCmVZ8r2+/zlRy0O/1YiiT6QTAk7DYSWVAzW
 xE0v5pvkd5ypuQbUhMAGA==
UI-OutboundReport: notjunk:1;M01:P0:YM7gYBZfTTc=;NVFXiFVqc46kGvnGbYNfSXt8Q7x
 O4RxUxFP+iBR/wuIYnQY5fpLgWTBwGLA0AT2H3wUKxZ+cxxQUg89qK2CVgitD8EFlfhp+48UB
 IqPFo6pO7Qdgk5GbU5XFX62NhLzT5YhvvAjIixT8GLFaQBXbFrsRmLvGA6yIeu43sbpgA1gWh
 VTArmuRATyPR+5BFgtHeZtblNKyrFeDShpKpVhhNEBHk1RuyJS8xtZr3nn2SF563HqDfo0amK
 bshyad5nRw0Wh5/yKzJshussb+nqVAoWrJ2gMf+LGiJjWcMEgJA+yQ/9D72b0I5Y9144ch5H2
 By7VRFBjkICdMyOrgx1yrrkF+N7c5tRLl1firfKOMlzNbj3o+1Lwe2HJkBmk1nA8IJbueKgtM
 vX8+uL/y7OJOnde8mUq+kdaQvuknTaE9xBAq8lMZZtk6PTvz1umfgPaszOMndBdO4TklEj8iy
 kpLv6HF8+PizgLREyA5Kwdiqfkj56+oI+r9WGAyuFBy3yWamkuXyj9NWtShZ41Z2cTSKNJByB
 uAN1y0ExPKrYmRyMvooKI/IiEmQICVw3mhmATwdrB+BBmoJU1lfabtZOp7myEMd2OtAze/5vA
 B6lRHu86jsklx9ieh6BXvaEFFAu3HEEQjlnPu5LyfJuXkpFsgHfUIXaFxT+o4bgY8hXXE34j+
 npE2iwrOWn2Jxdx/CNUHtzSsjf6O5SylLe4DFuIa1D1i6LgyI/SxM+wiAl3e3vH4j+I+gA4rH
 1+wfAGfGUcbe5OXoxHfSXKjJsW/Obvo8T7ayCnrWYaC/CDM6b7X45IFrFKPXSY17cM+uD/qty
 JqT+hhdT537X0TmSTccxSu5MZXDHU8ZgY943jB9N8nv+etmfbrWTqAlqmyNEgsW4QZKvO9Z3Z
 a6h6NTFMJ039eYcoApiNpAaKBrBoZDxV33FoUznxUvI2CVWyuXMm4TxyXtjmxgvZ9UJYf4bqB
 +kVs1Lc9vBX9Y1jw+qmVkD+xIYw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695925083; x=1696529883; i=dalang@gmx.at;
 bh=GnMAc2CrOppjVInXdDSsuliUQ37mJfznGLGTLcEVTy4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=J4IAy+ZHsjP3gLlzYQ0qKC/r3pigJOVRnGDA2MtuWj6e04fw7FAFZ5tE9TIM0JdxPSLns2/Y/l7
 KF4Xqwuyp0KM6fEbNBIiRQGDifdiMOtoRgA9nCLH6UGvpHpFsiyVOullYWn88fJ9KGoUrElWXgllt
 TzKkAMxnnsUlwOUS21d3DDy7u8hwT9pX2UxQr0qsqB3F+c9zQ4NJVFBOyEJZKEM3tSdjvbUYt/Vf3
 gBzmnSkLi8bIrMFmkZyj3OaqIqXuo14XGnl8oGHpvtRuDrnNYfsAdRVKKCJft/jtoz4LTqEfFez04
 mRonW6f9bfflNjQxZx8mpy2ax2fy81USyBdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=J4IAy+ZH
Subject: Re: [Buildroot] [PATCH 2/3] package/glibmm: bump version to 2.78.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Adam,

thanks for the patch!

On 21.09.23 20:19, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Reviewed-by: Daniel Lang <dalang@gmx.at>



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
