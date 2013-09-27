From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Sep 2013 10:05:13 +0200
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
Message-ID: <20130927100513.690cdd23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Thu, 26 Sep 2013 20:34:40 +0000, ANDY KENNEDY wrote:

> Oh, my bad.  I mean for when one uses an external toolchain.  For
> example:
> 
> I build a toolchain using Crosstool-NG.  I have a few libraries in
> there, but to fully use this as a cross compiler I need things like
> ncurses, pcap, lttng, etc.  In this case, I would either need to have
> some sort of SYSROOT configured. It is not always desirable to have
> those two items disjoined.  So, I dump my additional libraries into
> the toolchain.

I still don't understand. What you're explaining is exactly what
Buildroot is doing today. When you use an external toolchain, Buildroot
copies the toolchain sysroot (which contains just the C library) in
output/staging and then progressively "improves" this sysroot by adding
all the libraries that have been cross-compiled for your target.

If what you need is then the ability to deliver this toolchain to
application developers who will not be using Buildroot, but need a
toolchain with all the libraries, then the proper way to do this is, as
Peter suggested, to do BR2_HOST_DIR=/opt/some-location/, then do your
Buildroot build, tarball /opt/some-location/ and deliver that as the
toolchain to be used by your application developers.

Or maybe I misunderstanding the use case?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
