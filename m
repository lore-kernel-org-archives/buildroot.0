From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sat, 04 May 2013 10:29:51 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <klhkoe$dak$1@ger.gmane.org>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org>
Message-ID: <km1kpr$t5l$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>    http://www.shikadi.net/files/buildroot/2013-04-28.br.cannot_run_init.config
>    http://www.shikadi.net/files/buildroot/2013-04-28.k.cannot_run_init.config
>
> I'll keep investigating, but let me know if you have any insight!

I think I've discovered the problem here.  buildroot produces ELF binaries, 
but I cannot compile a kernel with ELF support because BINFMT_ELF depends on 
MMU and my platform is arm7tdmi which does not have an MMU.

This means I need to tell buildroot to produce FLAT executables instead of ELF 
ones.  I have enabled elf2flt support in the buildroot config, but it still 
produces ELF binaries.

Is there an option I am missing to make buildroot generate FLAT executables 
instead?

Thanks,
Adam.
