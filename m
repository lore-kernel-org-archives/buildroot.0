From: Hebbar <gururajakr@sanyo.co.in>
Date: Sun, 17 Feb 2008 20:58:47 -0800 (PST)
Subject: [Buildroot] unable to make libglib12. error about missing
 libglib12.so
In-Reply-To: <12265775.post@talk.nabble.com>
References: <12265775.post@talk.nabble.com>
Message-ID: <15539024.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

when compilling libglib12, configure output says

<snip>
<snip>
<snip>

checking for /opt/arm-uclinux/usr/bin/arm-linux-uclibcgnueabi-ld
-L/opt/arm-uclinux/lib -L/opt/arm-uclinux/usr/lib
--sysroot=/opt/arm-uclinux/ option to reload object files... -r
checking dynamic linker characteristics... no
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking for objdir... .libs
creating libtool
<snip>
<snip>
<snip>

In ltconfig file, host_os is taken as arm_linux. I placed an echo for
host_os at line 1793 in ltconfig file.

echo $ac_n "checking dynamic linker characteristics... for host $host_os
$ac_c" 1>&6
case "$host_os" in

  Here it checks for Dynamic linking characteristics of this os (arm-linux)
and hence it fails the test. So it cannot build shared libraries. 

Can anyone shed some light on this. 

Should i add 
host_os=linux-uclibc 

or 

linux-uclibc*)
arm-linux*)                     ----> add this line. is this correct

Thanks in advance

Regards
Gururaja


Hebbar wrote:
> 
> Hi all,
> 
>  I am trying to make libglib12 and it ends with error about missing
> libglib.so in buildroot/build_arm/staging_dir/lib/. When i searched in
> this firectory i had 
> root at box124:~/project/original/bldrt/buildroot# ls -la
> build_arm/staging_dir/lib/libglib.*
> -rw-r--r-- 1 root root 596464 Aug 22 11:58
> build_arm/staging_dir/lib/libglib.a
> -rwxr-xr-x 1 root root    593 Aug 22 11:58
> build_arm/staging_dir/lib/libglib.la
> 
> Kindly help me to resolve the same. I tried editing libglib12.mk file but
> failed. 
> 
> Regards
> Gururaja
> 
> 
> Make libglib12 error-->  
> 
> 
> cp -dpf
> /home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so
> /home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/
> cp: cannot stat
> `/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so':
> No such file or directory
> make: ***
> [/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/libglib-1.2.so.0.0.10]
> Error 1
> 
> 

-- 
View this message in context: http://www.nabble.com/unable-to-make-libglib12.-error-about-missing-libglib12.so-tp12265775p15539024.html
Sent from the BuildRoot mailing list archive at Nabble.com.
