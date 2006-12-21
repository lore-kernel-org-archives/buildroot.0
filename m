From: Joe Pruett <joey@clean.q7.com>
Date: Thu, 21 Dec 2006 07:26:38 -0800 (PST)
Subject: [Buildroot] Kernel Panic .....
In-Reply-To: <20061221090438.GB1192@aon.at>
References: <Pine.LNX.4.64.0612191302220.31862@smtcorms05.samuelmanutech.com>
	<Pine.LNX.4.64.0612192336370.31862@smtcorms05.samuelmanutech.com>
	<Pine.LNX.4.64.0612192039380.11555@q7.q7.com>
	<Pine.LNX.4.64.0612192344000.31862@smtcorms05.samuelmanutech.com>
	<20061220154303.GA24288@aon.at>
	<Pine.LNX.4.64.0612202113430.2373@q7.q7.com>
	<20061221090438.GB1192@aon.at>
Message-ID: <Pine.LNX.4.64.0612210719460.4708@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >i'm not sure where those two changes should be done officially, or i'd 
> >submit a patch.  it seems that if the iso relies on ramdisk support, then 
> >it makes sense to have that enabled by default, and the LINUX_KERNEL vs 
> >LINUX26_KERNEL make var should be addressed.  
> 
> Care to send your patch to outline what could be done to resolve this?

the kernel change was done by running make linux26-menuconfig and changing 
the ramdisk device from m to y.  so that maybe goes into 
target/device/x86/i386/linux26.config

and the change i made for LINUX_KERNEL was to add the line:
LINUX_KERNEL=$(LINUX26_KERNEL)

into target/device/x86/i386/linux26.mk

but i'm not sure those are the right places to do things.  maybe the uses 
of LINUX_KERNEL should be changed to LINUX26_KERNEL?  and i'm not sure the 
linux26.config is really used to config things.
