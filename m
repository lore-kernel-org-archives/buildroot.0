From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Nov 2012 23:24:35 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target
 kernel directory. example
In-Reply-To: <D4127A04D6B846E881F6B42F61985647@JohanW7>
References: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
 <5091CB65.8070409@mind.be>
 <75B2C156488F433AB22D082571AE6D4E@JohanW7>
 <20121101101912.310579d7@skate>
 <D4127A04D6B846E881F6B42F61985647@JohanW7>
Message-ID: <20121101232435.06994360@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 1 Nov 2012 20:10:26 +0100, Sagaert Johan wrote:

> KERNELDIR=/home/buildroot12git/output/build/linux-76e10d158efb6d4516018846f60c2ab5501900bc

Turn this into:

KERNELDIR=$(shell ls -1 /home/buildroot12git/output/build/linux-[0-9a-f]*)

or, if you want something cleaner, add a <pkg>-show-builddir target for
all packages in pkg-generic.mk (we could probably get this patch
upstream), and do:

KERNELDIR=($shell make -C /home/buildroot12git/ linux-show-builddir)

And voil?.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
