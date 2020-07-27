From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 11:49:34 +0200
Subject: [Buildroot] [PATCH v3 1/7] configs/guest_*: some new defconfig
In-Reply-To: <20200621080000.180089-2-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jun 2020 09:59:54 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-2-francois.perrad@gadz.org>
Message-ID: <87o8o1uw29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  DEVELOPERS                     |  1 +
 >  configs/guest_arm_a7_defconfig | 16 ++++++++++++++++
 >  configs/guest_arm_a9_defconfig | 18 ++++++++++++++++++
 >  configs/guest_x86_64_defconfig | 15 +++++++++++++++

Like Christian, I am not really convinced these defconfigs add any real
value.

You have decided to use glibc / 4.15 headers / systemd, which seems
pretty random to me.

If anything, the should build with the oldest kernel headers version we
support, so you can use the final docker image on older distributions
without getting the dreaded:

FATAL: kernel too old

From glibc.

-- 
Bye, Peter Korsgaard
