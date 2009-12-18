From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Dec 2009 09:12:17 +0100
Subject: [Buildroot] [Bug 757] U-Boot: mkimage cannot be installed using
	external toolchain
In-Reply-To: <20091218085307.4fd6de27@surf> (Thomas Petazzoni's message of
	"Fri, 18 Dec 2009 08:53:07 +0100")
References: <bug-757-163@https.bugs.busybox.net/>
	<20091209102836.8A5177776F@busybox.osuosl.org>
	<2c9a759f0912172332wb40a41fm4b79427ff40ce11d@mail.gmail.com>
	<20091218085307.4fd6de27@surf>
Message-ID: <87zl5g3dlq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Recap: The problem is that $(STAGING_DIR)/usr/bin, does not exist when
 >> u-boot tries to install the mkimage binary. Thus, the installation
 >> will fail. This occurs when using an external toolchain.

 Thomas> I think the patch is ok to solve the immediate problem. But since
 Thomas> mkimage is a host tool, I would rather prefer changing the u-boot
 Thomas> Makefile.in to install mkimage to $(HOST_DIR)/usr/bin.

True. I'll fix that now.

-- 
Bye, Peter Korsgaard
