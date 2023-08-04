Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51C6C00528
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 21:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B5941E54;
	Fri,  4 Aug 2023 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B5941E54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0PkAly35suH; Fri,  4 Aug 2023 21:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C0741715;
	Fri,  4 Aug 2023 21:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C0741715
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB411BF31C
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 21:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 392D782C3E
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 21:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 392D782C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7Atqok-LGB9 for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 21:30:16 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE064812C6
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 21:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE064812C6
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 23DA820039E;
 Fri,  4 Aug 2023 23:30:07 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47862])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Aug 2023 23:30:07 +0200
MIME-Version: 1.0
Date: Fri, 04 Aug 2023 23:30:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230801003858.43eb3fb9@windsurf>
References: <20230512014056.2107657-1-christian@aperture.us>
 <20230801003858.43eb3fb9@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <b761f284b557b40079e6fa83f408927b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691184613;
 bh=OvWuxH8QGd7wot9pxqOAC+JO9OUFZSfw+x3F3GTrEls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JVk490UOUP9oBY/ASFJicOLYVTEKSysZXNS61lUInmjzZT5YlF6msFzIsaozNx73S
 pwecE8pOWgktwG7MpUryZ8u5oKhGDvINO/1e32UdaSEtjjq/V8VDgSJjktaojAFClf
 ENZ+2qCMAVj8aOVqX1nfbq+Ll1dtrnDVcjGYha7hT9U850BwRRtWYswgxQTQZnEW7c
 C1plXXoKdqnjs+o7RqU0dt70G0ab/P6gXT3pBYFdkOpGFjBpoBMyQ8vxiMuhgXQjuD
 Mp7xukw/sTbjZN0ynFUQACMCsquEBiC+XqqU0o14QEtByCo9gQOI6cwgSNgqr5UMJh
 fN7wvnTwe2DrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JVk490UO
Subject: Re: [Buildroot] [PATCH v1 1/1] package/crio: new package
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, Christian Stewart <christian@aperture.us>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Christian, All,

On 01/08/2023 00:38, Thomas Petazzoni wrote:
> Hello Christian,
> 
> Thanks for the patch. See below some review.
> 
> On Thu, 11 May 2023 18:40:56 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
> 
>>  package/Config.in      |  1 +
>>  package/crio/Config.in | 54 ++++++++++++++++++++++++++++
>>  package/crio/crio.hash |  3 ++
>>  package/crio/crio.mk   | 82 
>> ++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 140 insertions(+)
> 
> Entry in DEVELOPERS file missing.
> 
>> diff --git a/package/crio/Config.in b/package/crio/Config.in
>> new file mode 100644
>> index 0000000000..35a38c587e
>> --- /dev/null
>> +++ b/package/crio/Config.in
>> @@ -0,0 +1,54 @@
>> +config BR2_PACKAGE_CRIO
>> +	bool "crio"
>> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2, 
>> __kernel_{u,}long_t
>> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> 
> uClibc has fexecve() now
> 
>> +	depends on BR2_USE_MMU # libgpgme, iproute2, fork()
> 
> 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme
> 
> is missing
> 
>> +	select BR2_PACKAGE_IPROUTE2
>> +	select BR2_PACKAGE_IPTABLES
> 
> Neither of these are referenced in the .mk file. Are these runtime
> dependencies? If so, please indicate this via a comment.
> 
> For this kind of package, a runtime test in support/testing/ would be
> very good. You can ask Julien Olivain for help here :-)

I will be glad to help! For a good runtime test, we need:

1. a simple reference Buildroot configuration that compiles the
package, and

2. a simple reference "known working" sequence that is sufficiently
stable in time (to require minimum maintenance after package updates).

I was thinking about this CRI-O tutorial:
https://github.com/cri-o/cri-o/blob/main/tutorials/crictl.md

But it requires crictl, from the cri-tools package:
https://github.com/kubernetes-sigs/cri-tools/tree/master

Christian:
Are you planning to add this package later?  Or do you know a
better/simpler way to start a small container?

Moreover, when I quickly tried this patch, starting from
qemu_aarch64_virt_defconfig. (without systemd) I observed
the following:

I had a build failure due to a missing libseccomp. Maybe a build
dependency is missing?

Once built, the service failed to start (by running "crio" manually),
due to missing runtime dependencies to: conmon, runc, nsenter (from
util-linux). Could you check those are mandatory (and add those as
runtime dependency), or if they can be disabled by configuration?

Once installed, I finally got an error due to the missing
/var/lib/crio directory on the target filesystem. Maybe it is missing
in CRIO_INSTALL_TARGET_CMDS?  Please also check if specific
permissions are needed, and define a CRIO_PERMISSIONS if needed. See:
https://nightly.buildroot.org/manual.html#generic-package-reference

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
