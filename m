From: Leonid <Leonid@a-k-a.net>
Date: Wed, 26 Sep 2007 11:56:09 -0700
Subject: [Buildroot] Buildroot for at91rm9200df
In-Reply-To: <406A31B117F2734987636D6CCC93EE3CB05B8B@ehost011-3.exch011.intermedia.net>
References: <20070925220441.CE64FA681D@busybox.net><1190759987.19731.105.camel@elrond.atmel.sweden><406A31B117F2734987636D6CCC93EE3C023DCAF3@ehost011-3.exch011.intermedia.net><1190796961.4933.11.camel@elrond.atmel.sweden>
	<406A31B117F2734987636D6CCC93EE3CB05B8B@ehost011-3.exch011.intermedia.net>
Message-ID: <406A31B117F2734987636D6CCC93EE3C023DCCCA@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I cannot find anyhting wrong with my mkdevs operation. On which step
project_build_<ARCH>/root/dev directory is populated? 
Can project_build_<ARCH>/root be used for NFSing as it is (in
buildroot-atmel it could) or some special massaging is needed?

Also I'm using separately built 2.6.16 kernel (it works with
buildroot-atmel). Shall I use newer Linux kernel instead?

Thanks,

Leonid.
-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Leonid
Sent: Wednesday, September 26, 2007 6:54 AM
To: ulf at atmel.com
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Buildroot for at91rm9200df

Hi, Ulf:

Thanks a lot for your reply. Meanwhile I made some progress and have
found that my busybox-xxx.config file was empty - naturally, busybox
applets were not installed!

So, this problem is over, filesystem is fully populated. However it
didn't work yet when I NFS there - no console output. I have found that
devices in /dev directory have not been created properly (they don't
look as device nodes). See tty0 entry for example:

# ls -al /dev/tty*
-rw-rw-rw-    1 501      leonid          0 Sep 25  2007 /dev/tty
-rw-rw-rw-    1 501      leonid          0 Sep 25  2007 /dev/tty0

In filesystem which I have built from your buildroot (and which works)
situation is quite different:

crw-rw----    1 root     root       4,   0 Dec 31 17:00 tty0

So, I have some problem while creating devices. I will look into that
but let me know if you see the root cause right away.

Thanks,

Leonid.

-----Original Message-----
From: Ulf Samuelsson [mailto:ulf at atmel.com]
Sent: Wednesday, September 26, 2007 1:56 AM
To: Leonid
Cc: buildroot at uclibc.org
Subject: Re: Buildroot for at91rm9200df

tis 2007-09-25 klockan 16:53 -0700 skrev Leonid:
> Hi, Ulf:
> 
> Your buildroot from at91 site is working nice, but I couldn't build
for
> this target when I checked out yesterday daily snapshot. I tried to
use
> your at91rm9200df.config as a reference, had to add some defines (like
> BR2_STRIP_strip) but looks like it still lacks something (I have 
> attached it) - builds stops without visible failures yet filesystem is

> not completely built. For example, there are no all these system 
> utilites (like ls, rm, cd, etc... Which are actually busybox applets).
> Busybox executable gets created but is not copied into root 
> filesystem... Some misconfiguration I guess.
> 
> Do you have config file for this target which will work with latest 
> buildroot or config file is not enough and some additional "massaging"
> is required (you run project/config/conf for example in your
buildroot)?
> Or this target is not supported by simple way by latest buildroot?
> 

It was some time since I looked at the AT91RM9200DF board, so things
might have happened.
I will see If I cen get time to retest.


> Thanks,
> 
> Leonid.
> 

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
