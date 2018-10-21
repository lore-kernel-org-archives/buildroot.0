From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 09:55:48 +0200
Subject: [Buildroot] How can I compile a module into the kernel?
In-Reply-To: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
References: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
Message-ID: <20181021095548.41d5f0b9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Sat, 20 Oct 2018 19:27:05 -0400, Patrick Doyle wrote:
> For security reasons, I would like to disable loadable modules in my
> kernel.  But my wireless driver is only available as a module.
> 
> I could drop the module into the source tree, possibly with a minor
> tweak to the Makefile, and just include it that way, but then I would
> have to maintain a source tree separately from my vendor supplied
> source tree.  And I hate proliferating yet another public git
> repository clone of a clone of a clone of the Linux kernel.
> 
> Or I could drop the module into my source tree and convert it into a
> large patch which I would apply to the kernel as part of the build
> process.  But those sorts of patches get messy to maintain.
> 
> What I would really like to do is to tell buildroot and/or the kernel
> "Link this external module into the kernel at link time, not at
> runtime".

You simply can't do that: external modules can only be built as
modules. If you want a driver to be compiled inside the kernel image
itself, then it has to be built as part of the kernel build process. So
you need to import the source code of your driver into your kernel
source tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
