From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon, 2 Apr 2018 12:05:51 +0200
Subject: [Buildroot] [PATCH v4 04/11] package/mesa3d: enable llvm support
In-Reply-To: <20180401225302.3a4284cd@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-5-valentin.korenblit@smile.fr>
 <20180401225302.3a4284cd@windsurf>
Message-ID: <6cbae11f-1fc3-e46e-dddc-5bdbcb8a0ce0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

On 01/04/2018 22:53, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 29 Mar 2018 13:33:39 +0200, Valentin Korenblit wrote:
>
>> +config BR2_PACKAGE_MESA3D_LLVM
>> +	bool "mesa3d w/ llvm"
> We're already under the mesa3d option, so repeating mesa3d in the
> prompt is not useless. Just "llvm support" is enough.
>
> Should the option be: bool "llvmpipe" ? Or is LLVM used by mesa3d for
> something else ?

We could leave "LLVM" because llvmpipe is not the only feature, r600 needs
llvm AMDGPU backend when llvm is selected, and then we could add radeonsi
Gallium Driver for newer GPUs.

>> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_LLVM
>> +
>> +comment "mesa3d w/ llvm needs llvm"
>> +	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> This comment doesn't make sense: BR2_PACKAGE_LLVM_ARCH_SUPPORTS is an
> architecture limitation, and therefore that the user can do about it.
> Just drop this comment.

Ok, perfect.

>
> Thanks,
>
> Thomas

Thanks,

Valentin
