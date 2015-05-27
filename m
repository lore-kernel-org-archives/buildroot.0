From: Ted Salazar <Ted.Salazar@maximintegrated.com>
Date: Tue, 26 May 2015 23:58:17 -0700
Subject: [Buildroot] Newbie help,
 AT91sam9x25 patch Installation Questions
In-Reply-To: <C7F5ED2AEEF9C0468B6F205055DC2A1D23DC4424DF@ITSVLEX06.it.maxim-ic.internal>
References: <1432452387471-101939.post@n4.nabble.com>
 <20150524130250.36ebd47d@free-electrons.com>
 <B03A893ADFE80748942D13AFAF28451924E703A8C9@ITSVLEX06.it.maxim-ic.internal>
 <20150525143810.GB3199@piout.net>,
 <C7F5ED2AEEF9C0468B6F205055DC2A1D23DC4424DF@ITSVLEX06.it.maxim-ic.internal>
Message-ID: <B03A893ADFE80748942D13AFAF28451924E6E93556@ITSVLEX06.it.maxim-ic.internal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To all you patch experts...Just curious why the BuildRoot manual checksout a branch to patch instead a tag? The newest branch is 2013.xx but the newest stable tag is 2015.02, which is what I want. Also, don't I need to add a patch command at the end of those two commands as well? Something like $ patch < hello.patch ?

21.3.1. Applying Patches from Patchwork
The main use of Buildroot?s Patchwork website for a developer is for pulling in patches into their local git repository for testing purposes.

When browsing patches in the patchwork management interface, an mbox link is provided@the top of the page. Copy this link address and run the following commands:

$ git checkout -b <test-branch-name>
$ wget -O - <mbox-url> | git am

I hope to get your life saving patches installed tomorrow.

Thank you,
Ted
________________________________________
From: Ted Salazar
Sent: Monday, May 25, 2015 2:18 PM
To: Alexandre Belloni
Cc: buildroot at busybox.net
Subject: RE: [Buildroot] Help for another newbie, AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi

Hi Alexandre,

Thanks again for your response. I think mainline BuildRoot is the way to go.

Just two quick questions on the commands to apply your patch...from BuildRoot documentation.

$ git checkout -b <test-branch-name>
$ wget -O - <mbox-url> | git am

Q1: Does <test-branch-name> = http://git.buildroot.net/buildroot/tag/?id=2015.02 ?
Q2: Does <mbox-url> = http://patchwork.ozlabs.org/patch/473928/mbox/ ?

Thanks
Ted

21.3.1. Applying Patches from Patchwork
The main use of Buildroot?s Patchwork website for a developer is for pulling in patches into their local git repository for testing purposes.

When browsing patches in the patchwork management interface, an mbox link is provided at the top of the page. Copy this link address and run the following commands:

$ git checkout -b <test-branch-name>
$ wget -O - <mbox-url> | git am



-----Original Message-----
From: Alexandre Belloni [mailto:alexandre.belloni at free-electrons.com]
Sent: Monday, May 25, 2015 7:38 AM
To: Ted Salazar
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Help for another newbie, AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi

Hi,

On 24/05/2015 at 19:06:36 -0700, Ted Salazar wrote :
>
> [TS: Yes I was aware of Alexandre's patches but several things were not clear enough to me to be able to use it. Sorry this is basic to you but not to me.
>
> 1.       Who  runs the at91.com/Linux4Sam website? I thought this was an Atmel run website? If so and you only support mainline BuildRoot then why does Alexandre's sam9x5ek patches contain Linux4sam URLs (ie URL=https://github.com/linux4sam/linux-at91.git and URL="git://github.com/linux4sam/u-boot-at91.git" ) shown here http://patchwork.ozlabs.org/patch/473928/
>

Atmel is. I'm using their version of the kernel, u-boot and at91bootstrap because they are maintaining stble versions of each.

> 3.       Does Alexandre's patch create all of the required at91sam9x5 defconfig files needed in order to build the AT91Bootstrap, uboot, Kernel and .ubifs filesystem too?
>

Yes.

> 4.       OK, if Alexandre's patch does not work on Atmel's forked BuildRoot then I will try using mainline BuildRoot. In fact, I'll probably try both BuildRoot versions no matter what. I'll read the manual at http://buildroot.uclibc.org/downloads/manual/manual.html
>

It will also work on buildroot-at91 but this doesn't make any sense to try that. As it is older and is actually outdated.


--
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
