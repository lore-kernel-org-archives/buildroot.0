From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 21:35:13 +0200
Subject: [Buildroot] [RFC PATCH v2 06/30] lld: new package
In-Reply-To: <86e76345-b5eb-76b1-ed81-ccaa36b205de@mind.be>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-7-michael.drake@codethink.co.uk>
 <86e76345-b5eb-76b1-ed81-ccaa36b205de@mind.be>
Message-ID: <31d8a2ba-40a9-011a-69a1-5858872d0734@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 20/10/2019 ? 00:39, Arnout Vandecappelle a ?crit?:
>> +++ b/package/lld/Config.in.host
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_HOST_LLD
>> +	bool "host lld"
>> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
>> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
>> +	select BR2_PACKAGE_HOST_LLVM
> 
>  I'm confused now... I thought the previous patch would be needed to support
> lld, but you don't select BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH here, so the
> option introduced in the previous patch is not used at all... Why is that patch
> needed then?
> 
> 
>  Also, in Joseph's original submission, [1] was included. Now it is no longer
> there. Was it not needed after all?
> 
>  Anyway, I think I'll apply Joseph's original patch now.

Thanks for merging lld :)

But lld package needs to be at the same version as llvm (currently 9.0.0).
lld package was sent to the mailing list at the time where llvm package was
using 8.0.0.

I'm not sure how it's related but the are some build issues with host-lld package:
http://autobuild.buildroot.org/results/9a0/9a0534c4206b40963d32494ff9675543e78125d1/build-end.log

I believe we need to bump lld version and add a small comment like for llvm and
clang package.

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
> [1] http://patchwork.ozlabs.org/patch/1136469/
> 
