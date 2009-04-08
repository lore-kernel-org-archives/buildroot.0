From: Mike Sander <msander@cogeco.ca>
Date: Wed, 08 Apr 2009 13:52:29 -0400
Subject: [Buildroot] u-boot fails with custom board support
In-Reply-To: <d6cda7730904080809i60285474o2517a57de6019aa5@mail.gmail.com>
References: <49DCAFCE.4030001@cogeco.ca>
	<d6cda7730904080809i60285474o2517a57de6019aa5@mail.gmail.com>
Message-ID: <49DCE45D.2080705@cogeco.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a wrote:
> Hi Mike,
>
> On Wed, Apr 8, 2009 at 11:08 AM, mike sander <msander@cogeco.ca> wrote:
>   
>> /usr/bin/make -C board/atmel/xx/
>> make: Entering an unknown directory
>> make: *** board/atmel/xx/: No such file or directory.  Stop.
>> make: Leaving an unknown directory
>> make[1]: *** [board/atmel/xx/libxx.a] Error 2
>> make[1]: Leaving directory
>> `/home/br/buildroot/project_build_arm/xx/u-boot-2009.03'
>> make: ***
>> [/home/br/buildroot/project_build_arm/xx/u-boot-2009.03/u-boot.bin] Error 2
>>     
>
>    Are you sure it's the same u-boot sources? AFAIK, Atmel didn't push
> u-boot patches to upstream, and therefore it were using a prepatched
> u-boot that was comming from somewhere else. That's the reason we have
> different u-boot versions and special handling for ARM.
>   This might have change since I last saw it though as I don't use ARM myself.
>
> Kind Regards,
>    Thiago A. Correa
>
>   

Thiago,

yes these are right sources, this is the u-boot from buildroot with at91 
specific patches.   Ulf pointed out that I was probably building 
incorrectly (see other messages in thread).   Still the way I was 
building with "make BOARD=<project>" worked for everything but u-boot.  
Based on the current documentation "make BOARD=<project> " seem to be 
the right way to build a custom board configuration.  Somehow the 
<project> identifier gets pushed into the u-boot make and it fails.

If I follow the "normal" build command line pointed out by Ulf "make 
BOARD=<project> getconfig ; make" I do not see this error.    Honestly I 
do not know if this is a buildroot bug, or if the error is at the 
keyboard interface level.

If this is a bug, I can debug further if you can give me some ideas on 
where to look in the build process.

regards,

mike
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
