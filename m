From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 29 May 2007 22:04:08 +0200
Subject: [Buildroot] ALSA for build root
In-Reply-To: <1180422192.32245.22.camel@localhost.localdomain>
References: <4656F77D.30303@teamboyce.co.uk> <465847FE.6050304@teamboyce.co.uk>
	<1180422192.32245.22.camel@localhost.localdomain>
Message-ID: <20070529200408.GB30684@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 29, 2007 at 09:03:12AM +0200, Hans-Christian Egtvedt wrote:
>On Sat, 2007-05-26 at 15:45 +0100, Rod Boyce wrote:
>> Rod Boyce wrote:
>
><cut intro about alsa patches>
>
>> As promised attached is a patch to add ALSA packages to build root I 
>> have only tested on i386 but it seems to work for me.  This patch is 
>> against the latest SVN repository No. 18694.  I have not tested the 
>> alsa-tools well and in-fact because I am not using X or GTK most will 
>> not compile I have disabled all the the ac3dec by default.  Also I am 
>> assuming the latest version of ALSA and a compatible kernel.
>
>I am working on the exactly same package (alsa + alsa-util) for
>buildroot, so far testing on an AVR32 platform.
>
>> diff -Nu --recursive --exclude=.svn --exclude=config --exclude=libogg
>> --exclude=libvorbis ../trunk/package/alsa-lib/alsa-lib.mk
>> package/alsa-lib/alsa-lib.mk
>> --- ../trunk/package/alsa-lib/alsa-lib.mk       1970-01-01
>> 01:00:00.000000000 +0100
>> +++ package/alsa-lib/alsa-lib.mk        2007-05-26 08:17:42.849975524
>> +0100
>> @@ -0,0 +1,135 @@
>> +#############################################################
>> +#
>> +# ALSA library
>> +#
>> +#############################################################
>> +
>> +ALSA-LIB_VERSION=1.0.14rc4
>> +ALSA-LIB_SOURCE=alsa-lib-$(ALSA-LIB_VERSION).tar.bz2
>> +ALSA-LIB_SITE=ftp://ftp.alsa-project.org/pub/lib/
>> +ALSA-LIB_DIR=$(BUILD_DIR)/${shell basename
>> $(ALSA-LIB_SOURCE) .tar.bz2}

And please don't forget to strip this basename nonsense off.

thanks,
