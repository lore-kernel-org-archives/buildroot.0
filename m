From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 May 2013 10:25:52 +0200
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <km1kpr$t5l$1@ger.gmane.org>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org> <km1kpr$t5l$1@ger.gmane.org>
Message-ID: <20130504102552.03b360ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Sat, 04 May 2013 10:29:51 +1000, Adam Nielsen wrote:

> I think I've discovered the problem here.  buildroot produces ELF binaries, 
> but I cannot compile a kernel with ELF support because BINFMT_ELF depends on 
> MMU and my platform is arm7tdmi which does not have an MMU.
> 
> This means I need to tell buildroot to produce FLAT executables instead of ELF 
> ones.  I have enabled elf2flt support in the buildroot config, but it still 
> produces ELF binaries.
> 
> Is there an option I am missing to make buildroot generate FLAT executables 
> instead?

I think the elf2flt stuff hasn't been used in a while, so it isn't very
surprising that it is broken. Your patches are definitely welcome to
fix it, and once it's fixed, I'll add a new toolchain configuration in
our autobuilders to test this configuration on a regular basis.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
