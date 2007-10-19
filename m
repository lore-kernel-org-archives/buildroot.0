From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 19 Oct 2007 10:20:36 +0200
Subject: [Buildroot] svn At revision 20289 breakage
References: <4717A47F.4000908@asist.si>
	<4717C93A.3080401@promwad.com><0c3501c811c4$63522850$01c4af0a@Glamdring><4717D0BA.1050300@promwad.com><0c5901c811c6$8aecca30$01c4af0a@Glamdring>
	<4718510D.5030602@asist.si>
	<008201c81224$6c96bd80$01c4af0a@Glamdring>
	<4718671F.3040005@asist.si>
Message-ID: <00b101c81229$10e8caf0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Babarovic Ivica" <ivica.babarovic@asist.si>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: <buildroot@uclibc.org>
Sent: Friday, October 19, 2007 10:13 AM
Subject: Re: [Buildroot] svn At revision 20289 breakage


> Ulf Samuelsson wrote:
>>
>> It is always the case that you have to provide a ".config" file for 
>> linux.
>>
>> For some lucky souls Buildroot will do it for you.
>> This is when there is an appropriate definition somewhere in the target 
>> directory,
>> and if you have supplied the right kernel.
> Well, I guess I was lucky until now. I never provided any kernel or 
> .config files.
> I still fail to see why this is important for buildroot build. Kernel 
> headers?
>
> I have a .config file from a kernel I build. Should I put that into 
> buildroot process?
> What differences would it make?
>>


If you want buildroot to build the kernel for you,
you need to ensure that LINUX26_KCONFIG
is defined as a link to your ".config" file when
the linus kernel is built.

The difference is that it will be one less script to run
you will get the modules automatically inserted into the root file system,
and the result will be in the binaries directory.

With the Advanced Kernel Configuration, you should be able to build 
basically
any kernel version, and you are able to apply patches much more freely
than before.

If you use the same version as the kernel headers, then
your kernel version choice is rather limited, and
if you choose to go with the latest, then the kernel version
will be updated once or twice a month.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57 
