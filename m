From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 21:36:01 +0200
Subject: [Buildroot] buildroot for pine64
In-Reply-To: <20160411170208.7880b2be@pcviktorin.fit.vutbr.cz> (Jan Viktorin's
 message of "Mon, 11 Apr 2016 17:02:08 +0200")
References: <20160411170208.7880b2be@pcviktorin.fit.vutbr.cz>
Message-ID: <87k2jptp0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Viktorin <viktorin@rehivetech.com> writes:

 > Hello,
 > I've just received my new Pine64 board and tried to integrate it into
 > the Buildroot. Howver, there is a catch. The system boots in 32-bit
 > mode so it requires to build the U-Boot by a 32-bit toolchain.

Yeah, the a64 boot sequence seems to be quite creative ;)

 > How to accomplish this with Buildroot? I am afraid, this is not
 > possible at the moment with a single BR defconfig file. Are
 > there more such boards? Is it a known issue?

There's unfortunately not really any good way of handling this :/
Perhaps the best is to simply not build u-boot in the pine64 defconfig
(and perhaps add a pine64_uboot_defconfig if it isn't easily available
from somewhere else).

-- 
Bye, Peter Korsgaard
