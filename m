Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0F7C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 22:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C71640AA9;
	Fri, 22 Jul 2022 22:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C71640AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JL4OtcOeVP4; Fri, 22 Jul 2022 22:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACAA41651;
	Fri, 22 Jul 2022 22:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ACAA41651
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 001CD1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DA884888
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DA884888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8-el09plXtP for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 22:24:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC898487C
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC898487C
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 22:24:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F13wo4Es9JtD2F13woHl52; Sat, 23 Jul 2022 00:24:03 +0200
Message-ID: <2e56164a-cf96-6e97-410c-132f52ba7fe2@benettiengineering.com>
Date: Sat, 23 Jul 2022 00:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAPi7W825_W9CaJKSSY4DW9qT2GjWtfvTOP9KaCz2KCAyKF8LiA@mail.gmail.com>
 <20211228095539.25395-1-giulio.benetti@benettiengineering.com>
 <20220722233112.7c00f940@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220722233112.7c00f940@windsurf>
X-CMAE-Envelope: MS4xfO1TrwO4B9kKHM99GlsHzv3Z98ENzs5gVzVERfHHQI8EqsVT+iunnkgCg4Ssln+D4M81blUu7fOqh222ebPcnv9vMI1HCOLmmFX2L3TAItdW0n5GkpRx
 vE7GJQ7wAlG2IiPJK4NQNRV6qqQAS7xNRkQ54awA4xjY+qMuduoOmoSCjoCX5AFZupaPl31bqHSH15lg0GIGMQ9Licj57DX3XqXJkg+ceTxX3dLN6xm4M6Nf
 3HRGCQZH/7IjkETJXH20BvMORYNhydB5LBC2pRuRSNDlZ10A0IeUDwuJg4VaGQ6qQK1vRTmqqFDcT37O1Ym00Vm59/EplCj/A3j6BFYAx7SQEJM/FMpt9MZg
 4iV90OWkg5QNfYoa9QGzXD918UHa2eWnwg0NLOe5+VVictDISaaH65DBtp+t91VAs5qEwesqHlfd9yrThuE3sW4HhHA2CEjDIAJt27A31Xm8bI4RbQ0R/nPy
 thYY0PS//KJe4kMM3h5UIujKyOz26lAVs1cycfRb/k4noKVnNZ5+mKvWgLfrWErM1eggM2bgeMbobb77hNJe3QmaNhmJJk3TyaBj27mjraqrpV/Wtt60SFyl
 QTLrNmDQ4EtFNfVTr9QJd8BSYxX6/g81J0JmtwrX/0VC12qb7OQ5p6zZIfOct1PriPlhSIdOSiRJicgJY+Aac4YH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658528643; bh=pgp08BHQuGwZ6Ym2YX+GTmWdbArK6ELtMEPi/o1e0Cc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=oHyuNRk4TwvKUUGOEmSilEIVWHfD/ftJMtvNDypBOU+VLW5LgKt/Tcz0qrSzL1DiF
 /2uK3i/44d6fcsZ1SXxFaFpIQ8TOTBc1H1MCAoJOln0/g/ZxzxU4AydgWqN59RM4YB
 v8MJcY0KfYPDLHi5jGyOQjXUNbxif1KU1fncJaiZayKe9Nyzm52+55QIozvomcEvMH
 Y4dBJQJLh9r/THGHrzaY7uIf2HoLKQzgdIe8jnQBzf1Xq3o0gpVxyHYwemMpnheVRO
 g1Rxy9ZmoHLCVSLPknmtS+r5taAJNLcAlQCKLtP9zAL8JH9dTvcOescFvvtq6fSrox
 onhOwTJCm/tjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=oHyuNRk4
Subject: Re: [Buildroot] [PATCH v3] package/harfbuzz: fix host build failure
 due to C++11
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/07/22 23:31, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Tue, 28 Dec 2021 10:55:39 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Package harfbuzz fails to build for host with error:
>> ```
>> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>>     static_assert (std::is_trivially_copyable<K>::value, "");
>> ```
>>
>> Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
>> of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz itself
>> and all host-harfbuzz dependencies, but let's also depend on
>> BR2_TOOLCHAIN_GCC_AT_LEAST_5 for all the harfbuzz direct and reverse
>> dependencies since the configure/build statements are the same for host
>> and target harfbuzz package.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * add BR2_TOOLCHAIN_GCC_AT_LEAST_5 to harfbuzz and its dependencies
>> V2->V3:
>> * add BR2_HOST_GCC_AT_LEAST_5 to all host-harfbuzz dependencies
>> ---
>>   package/adwaita-icon-theme/Config.in           |  5 +++++
>>   package/cwiid/Config.in                        |  2 +-
>>   package/efl/Config.in                          |  1 +
>>   package/enlightenment/Config.in                |  6 +++---
>>   package/gstreamer1/gst1-plugins-bad/Config.in  | 17 +++++++++--------
>>   package/gstreamer1/gst1-plugins-base/Config.in |  6 +++---
>>   package/gtkmm3/Config.in                       |  2 +-
>>   package/harfbuzz/Config.in                     |  8 +++++---
>>   package/imagemagick/Config.in.host             |  4 ++++
>>   package/kodi/Config.in                         |  2 +-
>>   package/libass/Config.in                       |  6 +++---
>>   package/libfm/Config.in                        |  6 +++---
>>   package/libgtk2/Config.in                      |  6 +++---
>>   package/libgtk3/Config.in                      |  2 +-
>>   package/librsvg/Config.in                      |  6 +++---
>>   package/mupdf/Config.in                        |  6 +++---
>>   package/openbox/Config.in                      |  6 +++---
>>   package/pango/Config.in                        |  8 +++++---
>>   package/pangomm/Config.in                      |  8 ++++----
>>   package/pcmanfm/Config.in                      |  6 +++---
>>   package/pinentry/Config.in                     |  6 +++---
>>   package/python-pymupdf/Config.in               |  6 +++---
>>   package/qt5/qt5base/Config.in                  |  2 +-
>>   package/rrdtool/Config.in                      |  6 +++---
>>   package/supertuxkart/Config.in                 |  6 +++---
>>   package/xscreensaver/Config.in                 |  6 +++---
>>   26 files changed, 80 insertions(+), 65 deletions(-)
> 
> This patch is no longer needed since harfbuzz upstream commit
> c657c4e1f8e6f23828fefbc441b01f7bee685c79, which is upstream since
> release 4.3.0.
> 
> This commit goes like this:
> 
> commit c657c4e1f8e6f23828fefbc441b01f7bee685c79
> Author: Thomas Devoogdt <thomas.devoogdt@barco.com>
> Date:   Tue May 10 10:00:06 2022 +0200
> 
>      [meta] fix type traits on gcc 4.9 #3526
>      
>      Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Much simpler than having to propagate this crazy host gcc dependency!
> :-)

Totally,

thank you for taking care and explaining.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
