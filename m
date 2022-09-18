Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D7C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 22:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D337E60AEF;
	Sun, 18 Sep 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D337E60AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsuMOeYabuYw; Sun, 18 Sep 2022 22:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BC6606CB;
	Sun, 18 Sep 2022 22:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BC6606CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B175A1BF41C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA4D41626
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 22:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA4D41626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3RncrTFFpHA for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 22:38:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 042A54161D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 042A54161D
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 22:38:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 960275FF33;
 Mon, 19 Sep 2022 00:38:27 +0200 (CEST)
Received: from 37-164-23-66.coucou-networks.fr ([37.164.23.66])
 by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 19 Sep 2022 00:38:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220917224934.01388da4@windsurf>
References: <20220821160143.16646-1-ju.o@free.fr>
 <20220917224934.01388da4@windsurf>
Message-ID: <3a565e425e1bb39439434e1681918682@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663540707;
 bh=TfmKWiGQTFY/VR1HlysxYBG3odRboE9MM+cuUS1tGQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W2ckebi+GtVu2azjwDoB4fwvxGoAHlj8h/kBG9J++woXVsMlDtz0KHRfvz4P2AmLd
 1H+aK/UOXW2lbyjortiy86jaAdbsg2e/LbFBNw1NicG8sztCWp6i9N4A6FyLt5OxCY
 tZI8oNSKJ4sM1Ut/2lhCJ8AoG4Ns7c/75jQZkc/P7/q3K52Yb+X77zPFjXNi+9ZC4H
 exEuaBOHnOpUORznVcXJ9DOiDHhTjufVZbUhKDLIvqOiM4G374k1ivt9fNl0IG5Hl4
 CV//A6EiDkZRfzfoUhd4gdPKnaPShBRIuQIbjWoK6D74TNGYF+zQUwI2dp/u3aSaF8
 dvYhJYPAU1Fig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W2ckebi+
Subject: Re: [Buildroot] [PATCH next 1/1] package/rdma-core: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 17/09/2022 22:49, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sun, 21 Aug 2022 18:01:43 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> This is the userspace components for the Linux Kernel's
>> drivers/infiniband subsystem.
>> 
>> https://github.com/linux-rdma/rdma-core
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Thanks for this patch. It looks really good. I have just a few
> questions and one super minor comment, see below.
> 
>> diff --git a/package/rdma-core/readme.txt 
>> b/package/rdma-core/readme.txt
>> new file mode 100644
>> index 0000000000..4f90720ca3
>> --- /dev/null
>> +++ b/package/rdma-core/readme.txt
>> @@ -0,0 +1,74 @@
>> +Testing rdma-core userspace tools
>> +=================================
>> +
>> +Testing rdma-core using Linux software RoCE implementation:
>> +https://en.wikipedia.org/wiki/RDMA_over_Converged_Ethernet
>> +
>> +Using two systems with working TCP/IP conficutation, for example:
> 
>                                          ^^^^^^^ minor typo here

Thanks.  I'll fix that in a new patch version.

>> +Kernel configuration
>> +--------------------
>> +
>> +The Linux Kernel needs some Infiniband configuration. In this example
>> +the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). See the
>> +example fragment file provided:
>> +
>> +    package/rdma-core/linux-rdma.fragment
> 
> Did you consider using the <pkg>_LINUX_CONFIG_FIXUPS variable instead?
> This would make sure these configuration options are always enabled in
> the kernel. Or is your fragment just an example?

Yes, I considered <pkg>_LINUX_CONFIG_FIXUPS but decided not to use it.
This fragment is really an example with the rdma_rxe driver. The
rdma-core package could be used with any other Kernel InfiniBand
driver. The reason I picked this one, is it's a purely software
implementation and does not require any specific hardware to test.

The only Kernel config that could always be enabled would be
CONFIG_INFINIBAND to enable the core support. The value would be
limited as it would be an empty shell since no other driver/options
would be enabled.

I could then enable a bit more kernel configs, but I think this would
go against the Buildroot philosophy (which I could summarize as
"Buildroot only enables the mandatory things, the user enables only
what he/she needs/wants").

I used the word "example" for that purpose. If needed, I can clarify
even more in the text.

>> +Buildroot package configuration
>> +-------------------------------
>> +
>> +For setting up a software RoCE link, the "rdma" program is needed. It
>> +is provided by the "iproute2" package, when "libmnl" is also
>> +selected. Make sure to have in your Buildroot configuration:
>> +
>> +    BR2_PACKAGE_IPROUTE2=y
>> +    BR2_PACKAGE_LIBMNL=y
>> +    BR2_PACKAGE_RDMA_CORE=y
> 
> Then is there a reason to not select iproute2 and libmnl? Or is it just
> that they are needed only for specific use cases?

Yes, the reasons are:
- Those are indeed needed for a specific use cases,
- Those are not mandatory dependencies (neither for build nor runtime).

The high level purpose of the rdma-core package is to provides
user-space libraries (libibverbs.so, libibumad.so, librdmacm.so, ...)
that interfaces with kernel /dev/infiniband/* nodes. The package also
includes some test programs (e.g. "rping"...).

One caveat is that this "rdma" binary, likely needed when using
rdma-core is in fact in another package (iproute), and only enabled
when some other libraries is also present (libmnl). This what I tried
to capture and reflect here.

Any suggestion to clarify that in the patch?
Apart from the typo, I'll wait for your inputs before sending a new
patch v4.

> Thanks!
> 
> Thomas

Thanks,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
