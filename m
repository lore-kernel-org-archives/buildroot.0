From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 23:25:05 +0100
Subject: [Buildroot] [PATCH 2/2] or1k: add defconfig for Qemu system
	emulation
In-Reply-To: <20170125063646.GA29825@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 25 Jan 2017 07:36:46 +0100")
References: <20170125063646.GA29825@waldemar-brodkorb.de>
Message-ID: <87tw8meq0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > You can bootup a OpenRISC system, networking is not working.
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Tested-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > v1 -> v2: 
 >   * add SoB to numerated kernel patches, suggested by Romain
 >   * split defconfig and arch support patches, suggested by Thomas P.

 > diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
 > new file mode 100644
 > index 0000000..111afc2
 > --- /dev/null
 > +++ b/configs/qemu_or1k_defconfig
 > @@ -0,0 +1,22 @@
 > +# Architecture
 > +BR2_or1k=y
 > +
 > +# System
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"

The kernel already automatically boots with console=ttyS0, so explicitly
setting it to ttyS0 isn't needed.

Committed with that removed, thanks.

-- 
Bye, Peter Korsgaard
