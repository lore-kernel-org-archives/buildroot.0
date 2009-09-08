From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Sep 2009 09:49:08 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <87zl953mql.fsf@macbook.be.48ers.dk>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
	<1252393123.11390.5.camel@bender>
	<87hbvd52z7.fsf@macbook.be.48ers.dk>
	<1252394155.13520.2.camel@bender>
	<87d461528h.fsf@macbook.be.48ers.dk> <20090908093141.7fd72031@surf>
	<87zl953mql.fsf@macbook.be.48ers.dk>
Message-ID: <20090908094908.68d724b1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 08 Sep 2009 09:43:30 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I was thinking that we maybe could (ab)use the KCONFIG_ALLCONFIG
> support stuff for it. From linux/Documentation/kbuild/kconfig.txt:
> 
> The allyesconfig/allmodconfig/allnoconfig/randconfig variants can
> also use the environment variable KCONFIG_ALLCONFIG as a flag or a
> filename that contains config symbols that the user requires to be
> set to a specific value.
> 
> But I haven't looked at it in detail yet.

Ah, okay, didn't know about that. But what if the user uses "make
menuconfig" instead ?

> Yes, that's the step I think we could automate when the toolchain
> comes from buildroot.

If the external toolchain doesn't come from Buildroot, we can also
imagine having a little script that generates such a snippet. But not
sure if that would make it easier to understand than the current
process.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
