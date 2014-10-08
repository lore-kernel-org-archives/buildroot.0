From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 10:09:54 +0200
Subject: [Buildroot] [Patch v2 1/1] Fix selection of bootloaders from
 $(BR2_EXTERNAL)
In-Reply-To: <20141007222933.GC27580@free.fr>
References: <1412686892-29394-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20141007154851.4a94c0f7@free-electrons.com>
 <20141007212938.GA2949@itchy> <20141007222933.GC27580@free.fr>
Message-ID: <20141008100954.7bff0f9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Eric,

On Wed, 8 Oct 2014 00:29:33 +0200, Yann E. MORIN wrote:

> > To me, the $(BR2_EXTERNAL)/package directory should contain Makefiles for
> > programs to be deployed in the rootfs of the target or host tools to build
> > them. But a bootloader is not to be deployed on the rootfs, but to be built
> > next to it. So it is more sensible to put the Makefile for a new/proprietary
> > bootloader in $(BR2_EXTERNAL)/boot.
> 
> I have to agree with Eric here: I think allowing (not enforcing) the
> same layout in br2-external as in Buildroot is a good thing.

Well, ok. So let's go with the patch, but maybe with an update to the
manual?

> > For $(BR2_EXTERNAL)/toolchain, a user may want to use a proprietary toolchain
> > that is not available as a tarball and thus not installable via the
> > traditional means.
> 
> But does that even work at all?
> 
> Toolchains are not packages; br2-external was not designed to get new
> toolchain definitions. That it works, if it does at all, is just merely
> happenstance.
> 
> I wonder if/how we should/could get this to work.

Clearly, that cannot work: how would one re-use the external toolchain
logic to copy the sysroot, the target libraries and so on. Plus, the
existing external toolchain mechanism already allows to use the tarball
of a toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
