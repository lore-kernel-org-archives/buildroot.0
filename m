From: joyful at sonic.net <joyful@sonic.net>
Date: Mon, 28 Dec 2009 21:59:59 -0800
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <ca97c59d98e2891cf752ddf02b2de681.squirrel@webmail.sonic.net>
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
	<62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
	<87fx73xxrk.fsf@macbook.be.48ers.dk>
	<e14e708720ddfeae76da70a20047b110.squirrel@webmail.sonic.net>
	<877hsdwchq.fsf@macbook.be.48ers.dk>
	<ca97c59d98e2891cf752ddf02b2de681.squirrel@webmail.sonic.net>
Message-ID: <99c29bc6a922cbb004b34bdc010362dd.squirrel@webmail.sonic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Peter,

I selected few more package and build root gave more errors:
configure.sh: WARNING: unrecognized options: --disable-gtk-doc, --disable-nls

   rsync 3.0.6 configuration successful

>>> rsync 3.0.6 Building
PATH="/tmp/buildroot/output/toolchain/bin:/tmp/buildroot/output/host/bin:/tmp/buildroot/output/host/usr/bin:/tmp/buildroot/output/st
aging/bin:/tmp/buildroot/output/staging/usr/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/data/dnsmux2/bin"
 /usr/bin/make -j1
 -C /tmp/buildroot/output/build/rsync-3.0.6/
make[1]: Entering directory `/tmp/buildroot/output/build/rsync-3.0.6'
In file included from ./rsync.h:886,
                from ./rounding.c:20:
./lib/addrinfo.h:141: error: redefinition of 'struct sockaddr_storage'
Failed to create rounding.h!
make[1]: *** [rounding.h] Error 1
make[1]: Leaving directory `/tmp/buildroot/output/build/rsync-3.0.6'
make: *** [/tmp/buildroot/output/build/rsync-3.0.6/.stamp_built] Error 2

I also ran into error when I try to include the latest bind-9.7.0rc1 to
build both the named and bind-lib.  I found an old bind.mk that build both
named and bind_lib, but that always fail, too.




>
> Thanks! I thought without kernel, it would not boot.  That was why I
> selected to build the kernel. Sorry for the silly mistake!
>
> Joy
>
>
>>>>>>> "joyful" == joyful  <joyful@sonic.net> writes:
>>
>>  joyful> Hi Peter,
>>  joyful> Thanks. Attached please see the .config file.  I don't really
>> care
>>  joyful> about using busybox, but the make defconfig would not give me
>> chance
>>  joyful> to say no. Then I just hit enter for the default values.
>>
>>  joyful> I tried hard to get it working, but it just keeps giving me
>> errors.
>>
>>  joyful> Thanks and Happy Holidays.
>>
>> You have:
>>
>> BR2_KERNEL_LINUX=y
>> BR2_PACKAGE_LINUX=y
>> BR2_PACKAGE_LINUX_KCONFIG=""
>> BR2_PACKAGE_LINUX_FORMAT=""
>>
>> E.G. build a Linux kernel with "" as the .config, which ofcourse won't
>> work.
>>
>> Either specify the .config you want to use or disable the Linux kernel
>> build.
>>
>> --
>> Bye, Peter Korsgaard
>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
