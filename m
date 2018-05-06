From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 08:34:52 +0200
Subject: [Buildroot] defconfig build issues
In-Reply-To: <20180505215257.6745fc2f@windsurf> (Thomas Petazzoni's message of
 "Sat, 5 May 2018 21:52:57 +0200")
References: <20180505215257.6745fc2f@windsurf>
Message-ID: <87zi1dthpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > s6lx9_microboard_defconfig
 > ==========================

 > make[1]: *** No rule to make target 'simpleImage.'.  Stop.

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/66561794

 > No idea about this one. I don't think it was failing before, and I
 > don't think this defconfig has been changed recently. Do we have a
 > regression in the Linux kernel build logic ?

Yes, looks like it. The make target it tries to call is
'simpleImage. lx9_mmu', E.G. a space has been added before the list of
dtbs. I've sent a patch fixing it.

 > raspberrypi3_qt5we_defconfig
 > ============================

 > Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
 > If you're running a Debian/Ubuntu distribution, install the g++-multilib package.
 > For other distributions, refer to their documentation.

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/66561791

 > This defconfig includes WebKit, which wants a C++ multilib compiler on
 > the host, which isn't present in our Docker image used for the gitlab
 > CI builds. Should we add this to our Docker image ? Should we exclude
 > this defconfig from the gitlab CI testing ?

I would say yes, we want the defconfigs to be tested.

-- 
Bye, Peter Korsgaard
