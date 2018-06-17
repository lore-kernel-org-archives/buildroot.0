From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:04:15 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <20180601180157.759-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 1 Jun 2018 20:01:57 +0200")
References: <20180601180157.759-1-yann.morin.1998@free.fr>
Message-ID: <874li1sbdc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit f13477b (linux: config.in: add comment for Arm Cortex-M) added a
 > comment so that the user that the linux kernel may miscompile with
 > binutils 2.29+, when the target is an armv7m CPU.

 > However, the real trigger is a compilation in thumb2 mode, which happens
 > to be the only option for armv7m CPUs.

 > We can't know whether the kernel will be built in arm or thumb2 mode,
 > though, because we do not have that information: it is only available in
 > the Linux' .config file, which we don;t have access to at the time we
 > run our menuconfig.

 > So, relax the conditions under which the comment is made, so that it
 > appears as soon as binutils are >= 2.29 (i.e. not 2.28, which is the
 > oldest we support) for ARM CPUs.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Cc: Laurent GONZALEZ <br22@gezedo.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - only applicable to ARM CPUs.  (Peter)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
