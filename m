From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 20:01:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-08-16
In-Reply-To: <20130817063005.A69FB52C5D6@lolut.humanoidz.org>
References: <20130817063005.A69FB52C5D6@lolut.humanoidz.org>
Message-ID: <20130818200133.4046034b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 17 Aug 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/40f3be947e5d686bb4e016db1b3bf59503237e62/
>        arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ad9d92bef3655ca279bfd6184dca0457ee6c94a0/

Could you have a look at those two? In commit
29b071077f66de1d9a257e7c5c6983dcce1fc65d, you've added "depends on" to
make sure libbsd only gets built on architectures that provide a.out.h.
However, here, we are on ARM, and apparently, a.out.h is not available.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
