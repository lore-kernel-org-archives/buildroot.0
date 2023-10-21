Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F82C0032E
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 09:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF614EE01;
	Sat, 21 Oct 2023 09:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CF614EE01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhEDUcz_CGNa; Sat, 21 Oct 2023 09:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1D64EEE4;
	Sat, 21 Oct 2023 09:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1D64EEE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9C111BF429
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 09:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA704EEE4
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 09:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA704EEE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0aq_f0oW7cy for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 09:19:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85CB14EE01
 for <buildroot@uclibc.org>; Sat, 21 Oct 2023 09:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CB14EE01
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qu88U-0008it-MV
 for buildroot@uclibc.org; Sat, 21 Oct 2023 11:19:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 21 Oct 2023 11:18:19 +0200
Message-ID: <pan$3de0e$61d32a06$2e652447$868cdd00@ID-313208.user.individual.net>
References: <20231020120158.2684019-1-andyshrk@163.com>
 <fa6fbdf3-6a59-4893-9128-7087db14b91f@kuhls.net>
 <16d2b4bf.15c3.18b5174c2f1.Coremail.andyshrk__45408.7439969712$1697878733$gmane$org@163.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v3 1/1] igt-gpu-tools: add igt-gpu-tools
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

Am Sat, 21 Oct 2023 16:58:08 +0800 (CST) schrieb Andy Yan:

>>elfutils has another dependency which would need backporting:
>>
>>	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
>>
>>But when my patch series
>>https://patchwork.ozlabs.org/project/buildroot/patch/
20231019214953.4002609-1-bernd@kuhls.net/
> 
>>lands there is no need to add this dependency to igt-gpu-tools ;)
> 
> So maybe I can wait for this pach lands before sending v4.

if you do so then you will need to add a patch to igt-gpu-tools which 
fixes build errors with musl toolchains. I prepared a ready-to-commit 
version here: https://github.com/bkuhls/buildroot/blob/master_patches/
package/igt-gpu-tools/0001-musl.patch which you can add to the next 
iteration of your patch, which then depends on my elfutils patch.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
