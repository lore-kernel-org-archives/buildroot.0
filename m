From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 22 Apr 2009 18:49:10 +0200
Subject: [Buildroot] PXA270 and gcc-4.3.3 for iwMMXt
In-Reply-To: <dfb660300904220932i108dd65ey3a899e132d7c8c79@mail.gmail.com>
References: <dfb660300904220908x17502c02xad3358a6c64cb3f9@mail.gmail.com>
	<20090422161456.GD19863@buzzloop.caiaq.de>
	<dfb660300904220929r41351171x258cee3484cd8f@mail.gmail.com>
	<20090422163112.GE19863@buzzloop.caiaq.de>
	<dfb660300904220932i108dd65ey3a899e132d7c8c79@mail.gmail.com>
Message-ID: <20090422164910.GF19863@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2009 at 09:32:21AM -0700, Laine Walker-Avina wrote:
> > Daniel
> >
> 
> This is the kernel .config.

Hmm. Another common pitfall is a floating point mismatch between your
kernel and your toolchain, but that one seems to be set correctly in
your case as well. I'm afraid I can't provide a quick solution for you
at this point, but there are still some more things to consider.

- make sure you clean your buildroot tree properly after you changed
  low level settings like the ones discussed. Maybe you're just stuck on
  an old version of anything and br2 failed to rebuild the right bits.

- set CONFIG_DEBUG_USER in your kernel config and pass user_debug=255
  on startup. That will output more details when user space binaries
  crash.

- Consider using gcc 4.3.2 for your tests. I've never used a newer
  version for ARMs, so I can't prove that this is working.

- Try compiling a very simple program which just echos some text and
  cross-compile it for your target. Use the kernel's init= option to
  call it and see if it works.

If you manage to solve your problems, post your findings here for
others, please :)

Daniel
