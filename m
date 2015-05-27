From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 27 May 2015 11:58:00 +0200
Subject: [Buildroot] Newbie help,
	AT91sam9x25 patch Installation Questions
In-Reply-To: <B03A893ADFE80748942D13AFAF28451924E6E93556@ITSVLEX06.it.maxim-ic.internal>
References: <1432452387471-101939.post@n4.nabble.com>
 <20150524130250.36ebd47d@free-electrons.com>
 <B03A893ADFE80748942D13AFAF28451924E703A8C9@ITSVLEX06.it.maxim-ic.internal>
 <20150525143810.GB3199@piout.net>
 <C7F5ED2AEEF9C0468B6F205055DC2A1D23DC4424DF@ITSVLEX06.it.maxim-ic.internal>
 <B03A893ADFE80748942D13AFAF28451924E6E93556@ITSVLEX06.it.maxim-ic.internal>
Message-ID: <20150527095800.GP3199@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 26/05/2015 at 23:58:17 -0700, Ted Salazar wrote :
> To all you patch experts...Just curious why the BuildRoot manual checksout a branch to patch instead a tag? The newest branch is 2013.xx but the newest stable tag is 2015.02, which is what I want. Also, don't I need to add a patch command at the end of those two commands as well? Something like $ patch < hello.patch ?
> 
> 21.3.1. Applying Patches from Patchwork
> The main use of Buildroot?s Patchwork website for a developer is for pulling in patches into their local git repository for testing purposes.
> 
> When browsing patches in the patchwork management interface, an mbox link is provided at the top of the page. Copy this link address and run the following commands:
> 
> $ git checkout -b <test-branch-name>
> $ wget -O - <mbox-url> | git am
> 
> I hope to get your life saving patches installed tomorrow.
> 

Use:

git clone git://git.buildroot.net/buildroot
git checkout 2015.02
wget -O - http://patchwork.ozlabs.org/patch/473928/mbox/ | git am
wget -O - http://patchwork.ozlabs.org/patch/473935/mbox/ | git am
make at91sam9x5ek_defconfig
make

Those are step by step instructions but like I already said, you should
probably read more documentation or get a training.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
