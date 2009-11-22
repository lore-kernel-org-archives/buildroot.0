From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Nov 2009 21:44:06 +0100
Subject: [Buildroot] How do I configure the kernel?
In-Reply-To: <he7s4s$330$1@ger.gmane.org> (Grant Edwards's message of "Sat\,
	21 Nov 2009 05\:00\:12 +0000 \(UTC\)")
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com>
	<he7s4s$330$1@ger.gmane.org>
Message-ID: <87tywmffxl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> On 2009-11-20, Nicholas Walton <nwalton@aplopteng.com> wrote:
 >> On Fri, Nov 20, 2009 at 2:23 PM, Grant Edwards
 >> <grant.b.edwards@gmail.com> wrote:
 >>> How do you configure the kernel when using buildroot?
 >> 
 >> make linux26-menuconfig

 Grant> Doh!  I trield make kernel-menuconfig and several other
 Grant> variations.  For future reference, is there somewhere that's
 Grant> documented?

Yes, in docs/README:

Depending on your configuration, there are some targets you can use to
use menuconfig of certain packages. This includes:
$ make HOSTCC=gcc-4.3 linux26-menuconfig
$ make HOSTCC=gcc-4.3 uclibc-menuconfig
$ make HOSTCC=gcc-4.3 busybox-menuconfig

We should probably also document it in docs/buildroot.html, I'll fix
that now.

 Grant> The next question was going to be where do I put a kernel
 Grant> .config file if I already have one I want to use.  I can
 Grant> probably do a "find" to search for files named .config and
 Grant> figure out which is the right one. Then I assume I do "make
 Grant> linux26-oldconfig"?

Use the LINUX26_KCONFIG environment variable, similar to
BUSYBOX_CONFIG_FILE / UCLIBC_CONFIG_FILE. I'll also update the doc about
that one.

-- 
Bye, Peter Korsgaard
