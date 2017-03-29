From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Mar 2017 23:55:12 +0200
Subject: [Buildroot] [PATCH 4/5] package/mesa3d: explicitely disable asm
In-Reply-To: <20170329233528.1eb13394@free-electrons.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
 <20170326162853.3022-4-romain.naour@gmail.com>
 <hgqrqdxivc.ln2@ID-313208.user.individual.net>
 <49fce2a1-49a7-317c-486f-b3b6c37604a9@gmail.com>
 <20170329233528.1eb13394@free-electrons.com>
Message-ID: <4e776b18-226c-091c-1b4b-31a4c7e72c35@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Bernd, All,

Le 29/03/2017 ? 23:35, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed, 29 Mar 2017 23:28:56 +0200, Romain Naour wrote:
> 
>> Le 29/03/2017 ? 06:41, Bernd Kuhls a ?crit :
>>> Am Sun, 26 Mar 2017 18:28:52 +0200 schrieb Romain Naour:
>>>   
>>>> assembly are enabled by default on supported plaforms even while
>>>> crosscompiling if host == target:
>>>>
>>>> checking whether to enable assembly... yes, x86_64
>>>>
>>>> It was also disabled in the mesa package in Fedora since 7.6 [1].
>>>>
>>>> [1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726  
>>>
>>> Hi,
>>>
>>> I am unsure about this patch, why shouldn't we use asm code when 
>>> crosscompiling for host == target CPU?  
>>
>> To be honest I don't really have an issue with assembly being enabled for my use
>> case. But there is an issue when you want a reproducible build with the same
>> defconfig build on a x86 and x86_64 host.
> 
> For which architectures is the assembly code available? We should
> forcefully enable it for those architectures.

Assembly code is available for x86, x86_64/amd64 and sparc (see configure.ac).

The issue while cross-compiling is when assembly are enabled, the build system
build and run a small tool called gen_matypes on the host.

"disable if cross compiling on x86/x86_64 since we must run gen_matypes"

So it allow to enable assembly code while cross-compiling only when the host =
target.

> 
> I agree with Romain that we shouldn't depend on something that looks at
> the architecture of the host machine to decide if a feature for the
> target should be enabled or not.

I believe we don't have the choice... we need to disable it.

Best regards,
Romain

> 
> Thomas
> 
