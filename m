From: Daniel Mack <daniel@caiaq.de>
Date: Sun, 2 Dec 2007 23:31:10 +0100
Subject: [Buildroot] Undefined instruction on PXA270
In-Reply-To: <474556AE.8060209@studiofuga.com>
References: <20071121233524.GB11890@buzzloop.caiaq.de>
	<474556AE.8060209@studiofuga.com>
Message-ID: <20071202223110.GA22365@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 22, 2007 at 11:15:10AM +0100, ing. Federico Fuga wrote:
> > we've been trying to hunt a bug of our buildroot based rootfs here
> > without success. The platform is based on a PXA270 (Compulab's EM-X270)
> > and buildroot is a recent svn checkout.
> >
> > Out kernel 2.6.23 was successfully built with the toolchain set up by
> > buildroot and can mount root filesystems provided by the vendor of the
> > module. However, whenever trying to nfs-mount a rootfs built by BR2, we
> > end up having messages like this:
> >   
> I am working on the same platform and board, emx270 from compulab, and
> never found that problem. The only problem I had was with the
> monotonic_syscall option you told, but never happened again.

Do you have the DOPIC config option set in uClibc?
I debugged around for a while after the same thing happend again on a
completely different build machine with another type of embedded system.
All they have in common is that they're both based on a PXA270. It turned
out that busybox actually dies on instructions built with (PLT) ending
up with the messages I described. With the option unset, everything is
just fine.

However, this option is set by default so I really wonder why nobody
else runs into this issue than me?

Maybe anybody with more in-depth knowledge about what actually happens
with PIC-only in conjunction with (PLT) assembly could enlighten me, I'd
appreciate that :)

Thanks,
Daniel
