Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C064EC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C8A60B8C;
	Mon,  1 Aug 2022 18:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C8A60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIPxrjUQMlr2; Mon,  1 Aug 2022 18:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7596072A;
	Mon,  1 Aug 2022 18:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A7596072A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49A571BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6ABF81395
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6ABF81395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYR1-BuqPBgm for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:54:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C4981344
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49C4981344
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:54:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF2A01C0006;
 Mon,  1 Aug 2022 18:54:06 +0000 (UTC)
Date: Mon, 1 Aug 2022 20:54:05 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220801205405.6e9a83a3@windsurf>
In-Reply-To: <83ec6649-bd17-46dc-ae6f-ec30063358c2@mind.be>
References: <20220731113249.93158-1-bernd.kuhls@t-online.de>
 <83ec6649-bd17-46dc-ae6f-ec30063358c2@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659380047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axc8qVrTT4GqfE7sRINLe74I2a6aUQhssNRVUyG9BRM=;
 b=Vz1vCWHLsXJfASc7b+ZDwQ2J9n0aigrxBLDbJU5VKCMRxRCswuAPSBofB/AjZWTEiOFpli
 +1d8nYnAVIJblLS2wuwTbJsVcTJgQb3ptdwaOs5jT+mJuQNNwtcHG+cF45Vfdj+ALkblK4
 r1qzGJYoazh6FQFghA2UBA+SAV9pCtnk0n7qwivjbypSuugL+L3j7usB9R8Belurd+AV03
 w1sY9cVFWIf+V/0J3wgPO6HznsWovKaussORIKcqxkNB+F06WJIiwd02v1qrh478dtHJ/U
 WWXCZ/kvHKxBPgN29PModQYvR+67x5aOvondFyR9RQ5QU0QMGPRslpWR3dev9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vz1vCWHL
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: ignore CVE-2021-38291
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matthew Weber <Matthew.Weber@collins.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 1 Aug 2022 20:02:44 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> >   FFMPEG_CPE_ID_VENDOR = ffmpeg
> > +# fixed in version 4.4.1  
> 
>   For this one, I went and checked, and it is the NVD that is wrong. It has 
> cpe:2.3:a:ffmpeg:ffmpeg:*:*:*:*:*:*:*:*
> 
>   So the proper approach here is to fix it in the NVD. I'm not actually sure how 
> to do that. Matt, Thomas, do you know?

Yes: send an e-mail to nvd@nist.gov.

Here is an example e-mail I sent:

========================================================
Hello,

CVE-2014-3675 is marked in the NVD database as affecting all versions
of cpe:2.3:a:redhat:shim:-:*:*:*:*:*:*:*. However, this CVE has been
fixed by upstream commit
https://github.com/rhboot/shim/commit/e253c2a2c07bc526de1528ed9839b2b584025fa2#diff-874c9b6e2bf4c63b0f0a443f612426773d76e4f09dd313fbe0ad3fd6d42c22d4, which has been part of shim releases since version 0.8.

The problematic code has been introduced in shim 0.3. To the affected
versions are all versions >= 0.3 and < 0.8.

Could this be addressed in the CVE-2014-3675 entry ?

Thanks a lot,

Thomas
========================================================

I had to provide more details later on such as:

========================================================
Your CVE-2014-3675 CVE report points to:

  https://www.openwall.com/lists/oss-security/2014/10/13/4

Which indicates:

"""
1. OOB read access when parsing DHCPv6 packets (remote DoS).
   The severity is low. (CVE-2014-3675)
2. Heap overflow when parsing IPv6 addresses provided by tftp:// DHCPv6
   boot option (RCE).
   The severity is low to medium, as secure boot via PXE6 should
   rarely be seen ITW. Furthermore UEFI firmware seems to fail
   to properly verify provided PXE images at the first place. (CVE-2014-3676)

For both issues above there is a patch proposal:

http://suse.com/~krahmer/priv/shim1.diff
"""

This patch is exactly commit
https://github.com/rhboot/shim/commit/e253c2a2c07bc526de1528ed9839b2b584025fa2
in upstream shim.

And based on the shim Git repository, we can check that commit
e253c2a2c07bc526de1528ed9839b2b584025fa2  was first part of the 0.8
release:

$ git describe --contains e253c2a2c07bc526de1528ed9839b2b584025fa2
0.8~5

This CVE, and the fix for it, is related to the netboot code in
netboot.c. This entire netboot.c code was introduced in upstream commit
d8e330b95368ce43da47e114eb1d699eedb18e57
(https://github.com/rhboot/shim/commit/d8e330b95368ce43da47e114eb1d699eedb18e57).

And this commit itself was first included in the 0.3 release:

$ git describe --contains d8e330b95368ce43da47e114eb1d699eedb18e57
0.3~34

So any version prior to 0.3 is not affected by this issue, as shim
simply did not have netboot support.

This reasoning applies to both CVE-2014-3675 and CVE-2014-3676.

So the affected versions are >= 0.3 and < 0.8.

Does this help ?

Thanks a lot,
========================================================

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
