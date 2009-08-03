From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 3 Aug 2009 17:37:10 -0400
Subject: [Buildroot] Building Linux system - Beginner Q2
In-Reply-To: <20090803134949.59f5dcc0@danhplaptop>
References: <mailman.16140.1249312217.24852.buildroot@busybox.net><BAY136-W9F7845E64DF97AA4705DDCE0F0@phx.gbl>
	<20090803134949.59f5dcc0@danhplaptop>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901B77666@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, August 03, 2009 1:50 PM, Dan Lyke wrote:
>> I found in the dl the kernel package. Do i have to extract it and
>> "make linux26-menuconfig" and then "make" ?? I am asking this because
>> oi found an extracted kernel inside toolchain_build_i686 directory.
>> thanks
>
> I believe that the one you're looking for to modify is in
> project_build_arm/*/linux-* . I find that when I've modified files
> in there (it's been several months since I've had to do that), I've
> needed to do a
>
>   pushd project_build_arm/*/linux-*
>   make clean
>   popd
>   make
>
> To make sure that the kernel gets rebuilt properly, but there's a good
> chance that since I've last played with this the dependency checking
> stuff has gotten better.
>
> You shouldn't have to extract any files manually, Buildroot should do
> that for you. And if you do a "make menuconfig" at the highest level,
> you can then go to "Kernel->Linux Kernel Configuration", that should be
> the equivalent of just typing "make linux26-menuconfig" directly.

You should never have to manually extract anything.  If an archive is
needed during the make process it will be downloaded and extracted as
required.  You really should create a symbolic link to the dl directory,
this will keep buildroot from deleting any packages you download.

"make menuconfig" just allows you to set the buildroot configuration.  To
configure your kernel you will still need to do "make linux26-menuconfig".
Busybox and a couple other packages have similar "make <package>-menuconfig".

If you change your kernel configuration using "make linux26-menuconfig" it
will get recompiled during the next "make".  If you manually edit or patch
any of the kernel source it will not automatically get recompiled.  To force
a recompile of the kernel do a "make linux26-force" then "make".

Regards,
Hartley
