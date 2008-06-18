From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 18 Jun 2008 07:03:24 +0200
Subject: [Buildroot]
	svncommit:	trunk/buildroot/toolchain/external-toolchain
References: <20080616122246.C821B3C987@busybox.net><20080617042319.GA17083@cloud.net.au><87ej6wwmxw.fsf@macbook.be.48ers.dk><20080617104754.GA25850@cloud.net.au><87fxrcmazj.fsf@macbook.be.48ers.dk>
	<20080618011812.GE4283@cloud.net.au>
Message-ID: <013b01c8d104$f200c430$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Tue, Jun 17, 2008 at 03:45:04PM +0200, Peter Korsgaard wrote:
>>  Hamish> Well I've got one board ("tools", in
>>  Hamish> local/tools/tools.config) to build the toolchain which I
>>  then Hamish> use as external toolchain to build several other
>>  boards (all Hamish> armeb-linux-uclibcgnu). So my toolchain lives
>>  in the staging Hamish> directory in the same tree.
>> 
>> So they all put libraries / headers in the same staging_dir? Doesn't
> 
> Yes.
> 
>> that give problems with packages detecting optional stuff at compile
>> time that might not be available for a specific variant (E.G. one
>> variant has expat, and another doesn't - Some configure script checks
>> for expat and finds it in staging_dir even though it isn't going to
>> be there at runtime).
> 
> Good point. So far all my boards are very similar so this hasn't been
> a problem, but that won't always be the case.
> 
> IMHO this is a flaw of the project support - everything should be
> built into a project-specific directory. Currently only the kernel
> and busybox are built in project_build_$arch.
> 
> How would everyone react to a patch which redefines BUILD_DIR to match
> PROJECT_BUILD_DIR, ie each project would have
> project_build_$arch/$project/staging_dir etc?

No, then you might as well use several buildroot trees.

> 
> I think Ulf commented in the past that he doesn't want to waste the
> time spent compiling each package for each board separately, but that
> seems to be the only way to do it correctly.
> 

You have to be aware of the limitations, that's for sure.
There are a number of packages which can only be built one way
and they can reside in build_<arch>, packages which have different
options needs to be built in project_build_<arch>

> Hamish

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57


Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/
