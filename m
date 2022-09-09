Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23485ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 15:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AECD541642;
	Fri,  9 Sep 2022 15:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AECD541642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ub62VZHHZAQ5; Fri,  9 Sep 2022 15:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E37DE415EE;
	Fri,  9 Sep 2022 15:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E37DE415EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 998C51BF232
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 15:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D1283449
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 15:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D1283449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSokjC4qJt08 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 15:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C53D383E17
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C53D383E17
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 15:40:23 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mleo0-1pEIOB0pO6-00imii; Fri, 09 Sep 2022 17:40:17 +0200
Message-ID: <c1d1e5ac-efe5-eeff-af5d-dd9d6eae5696@green-communications.fr>
Date: Fri, 9 Sep 2022 17:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Alex <earthquake.de@freenet.de>, buildroot@buildroot.org
References: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
X-Provags-ID: V03:K1:jFsyGImckYNPkzMLNv34ln/N7CkM8oB9xCGvi3Wq5vcS4M6jmTk
 qlxGrwAz7jpoEw9NzKliyJBnc+h4hT3BWuz9U5p869lakk2dEt0onjq++fWHfysDbOuQsUD
 kMzZohHvs8ViJvESWS67dAaG9JcHZfT4CStpYc/C7o4XzywUOXKeFNuASV8Yf5qZq4BapUi
 Ro35hph5VWhSmz+XmR4+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xs+F8TPVJSY=:mLeSV2WFz94Li2JfwBeqLS
 hcG8g9j51mjkZHVfr2BkRVOA763irWuLhw58s0By9v8IsY9H/8LL26SZG4h7H3b1kB0EUfOwT
 +4/MUw+WH4h7tJ/LG7b4Fis35T0IgYQGPX3Knjf4iuXxrdXmEjI8gArPYKokl3pL8nzmFJy8i
 O6m5sZrBxUSc/59S9Eh7CFrQWTam9eqQAIirFDANuviDQSXe540jNEofI+w0bsfbIUHErv+Km
 RwRipfOBF5SGkggyBX8vxCd2oAj+x0+C+Bhv+rn9R6JOxdATxXtfFzOOi3LBbI7G3z1CsaSaZ
 G8bAXAjrqvEW2tbGEgDVEwcrFFG28O9HKRGa1g3fYTYHnsiTrZ/GxiAWCnHPvUnpcghETcjSz
 9QXn0aOaEDa5XwLEVMRl7/yD67M39qWhivHFHwIBACb+reIelkiAdsf201DdtdHYzLZMb32pT
 qttSr2910hACzSeK66zc+DRQd0AXtfQEimqmLECZD8odDr4vkOq3ssUfgYSgKKHAkT8//FpVH
 YiSJp1/3GgO9i1MZAyWkbRArIHkAzcGMwEb4mCr79OGl0jiZcm+YbEgUVGOludc5/kS8nI/Wz
 1znixdaQDfUYu9sSKaQ8rbynECsqWMGbqFku4uLI46nadPAWe8PHMdR/veklVXnphpMWRvTzw
 rB90K3ms+v/jmAlNINjhNU92imtoDuj7p1Z7/qDfbYk4FE6Pi6qc+Eg9pva+LQwdsAJnpo34M
 2MaVcF4+W82ObtSHqsZvM1MB0r7BKvYRAkaqt2TOU8s+Y2Eu6wRmWyFiXopwl72vwOUQti8Ks
 TZm758aBwjiUZBuggyU6AL65uT1G726Gbgp9+C9MrMTBACr/AQ=
Subject: Re: [Buildroot] libstdc++ DSO missing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/09/2022 14:34, Alex wrote:
> Hi,
> 
> I intergrated my application to buildroot. Complie is successfull by
> when linking I get errors:
> 
> x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libstdc++.so.6: error
> adding symbols: DSO missing from command line

This error means that:
- the linker found a library with a DT_NEEDED dependency on libstdc++.so.6
- the linker found libstdc++.so.6
- the linker is missing symbols
- the linker found the missing symbols in libstdc++.so.6
- but the linker command line does not include libstdc++.so.6
- so the linker is not sure if the user actually intended to link with 
libstdc++.so.6.
- so it refuses to link.

Since libstdc++.so.6 is the C++ runtime library, this either mean that:
- you are linking a C++ program with ld or gcc instead of g++
- you are linking a C program with a C++ library that requires libstdc++.so.6, 
in this case you may need -lstdc++ on the linker command line.

> Are libraries missing from buildroot environment?

No, only the linker command line is incorrect.

> Additional I get warnings that some .so files not found, but they are
> available in output/build/<Tool>/lib

The compiler will only search libraries in output/staging/lib or 
output/staging/usr/lib.
The package for <Tool> should install the libraries there, so that other 
programs can link with them. This is done by putting

<TOOL>_INSTALL_STAGING = YES

in its .mk file.  If <Tool> is a generic-package (and not a 
autotools/meson/cmake package), then you also need to manually explain how to 
install libraries to $(STAGING_DIR)/lib:

https://nightly.buildroot.org/manual.html#_infrastructure_for_packages_with_specific_build_systems

> But I included this path by $(@D)/../<Tool>/lib

While it may work, this is a kludge.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
