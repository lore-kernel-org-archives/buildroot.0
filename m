From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Oct 2009 19:41:07 +0200
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <20091024182538.69233120@surf>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
	<20091024182538.69233120@surf>
Message-ID: <1256406067.28475.37.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 24 octobre 2009 ? 18:25 +0200, Thomas Petazzoni a ?crit :
> Hi,
> 
> Le Thu, 22 Oct 2009 11:47:52 +0200,
> Anders Darander <anders.darander@gmail.com> a ?crit :
> 
> > I've attached a patch (formatted by git), which adds the possibility
> > to have buildroot install the already compiled gdbserver from an
> > external toolchain.
> > 
> > To  make sure that debuging works, it is preferred if both the host
> > crosscompiler gdb and gdbserver is built from the same gdb version. If
> > we take the gdbserver from the external toolchain, this is guaranteed.
> > 
> > I'm not sure that the implementation is the best, it migth be  a
> > little bit "hackish". Looking forward to some comments for
> > improvement.
> 
> This feature is of course very welcome, but I'd like to see the
> external toolchain support to be extended to toolchains not generated
> by Crosstool-NG (Codesourcery toolchains, for example, are still on my
> TODO-list).
> 
> Can we imagine a way of making this more generic ? Maybe we could
> detect the toolchain ?type? and act differently depending on this type ?
> 

What comes up to your mind by "type" ?
Here is a short list to start with :
	1) uclibc vs glibc
	2) contains tools strongly linked to the core toolchain :
		- gdbserver / gdb / gcc

What else ?


Regards,

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
