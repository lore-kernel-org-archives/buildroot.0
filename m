From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 13 Oct 2017 12:10:51 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] syslinux: Use the host compiler to build
 extlinux
In-Reply-To: <1749064856.11956839.1506976599871.JavaMail.zimbra@datacom.ind.br>
References: <20170930231309.17677-1-casantos@datacom.ind.br>
 <20170930233520.20143-1-casantos@datacom.ind.br>
 <20171002211547.4942e28d@windsurf.home>
 <1749064856.11956839.1506976599871.JavaMail.zimbra@datacom.ind.br>
Message-ID: <396328543.13503256.1507907451899.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: "Beno?t Allard" <benoit.allard@greenbone.net>, buildroot at buildroot.org
> Sent: Monday, October 2, 2017 5:36:39 PM
> Subject: Re: [Buildroot] [PATCH v2] syslinux: Use the host compiler to build extlinux

>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: buildroot at buildroot.org, "Beno?t Allard" <benoit.allard@greenbone.net>
>> Sent: Monday, October 2, 2017 4:15:47 PM
>> Subject: Re: [Buildroot] [PATCH v2] syslinux: Use the host compiler to build
>> extlinux
> 
>> Hello,
>> 
>> On Sat, 30 Sep 2017 20:35:20 -0300, Carlos Santos wrote:
>>> Like the utilities, it is meant to run on the host machine, hence must
>>> be built using the host toolchain.
>>> 
>>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> 
>> It is not entirely clear if everybody agrees that "extlinux" is a host
>> or a target program.
>> 
>> Beno?t Allard, who used to work on the syslinux package in Buildroot
>> wrote in http://www.syslinux.org/archives/2017-April/025755.html:
>> 
>> """
>> 1. utilities required during the build (prepcore)
>> 2. utilities meant to be run in the target operating-system (isohybrid,
>>  memdisk, the extlinux installer, ...)
>> 3. utilities used to boot the operating system
>> """
>> 
>> So he was considering the extlinux installer as a program for the
>> target.
>> 
>> A few years earlier, another person on the Buildroot mailing list, also
>> wanted to have the extlinux installer on the target:
>> http://buildroot-busybox.2317881.n4.nabble.com/syslinux-on-target-td81294.html.
>> 
>> So, I'm not sure. Perhaps we need a host-syslinux package to install
>> those utilities ?
>> 
>> Or perhaps I'm being too complicated here, we should just merge your
>> patch, and adjusts when/if someone complains ?
> 
> Well, there is a chicken-egg problem here because extlinux is a boot
> loader so you must have it installed on the target partition in order to
> be able to boot.
> 
> On embedded systems this made on the host machine, manipulating the
> disk image (which was exactly the problem I had when I needed to use
> extlinux).

Quick follow-up.

Commit 8e0d4118982ae5a29e462f0a476d82772459cf5c moved the helper programs
to the host and 8e0d4118982ae5a29e462f0a476d82772459cf5c removed the host
variant of the package, so looks like the original goal was to make
extlinux a host utility, since it is installed at $(HOST_DIR)/sbin/.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
