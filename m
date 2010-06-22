From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 08:54:50 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20100622085450.2c4542a1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2010 18:25:24 -0500
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> strip: Unable to recognise the format of the input file `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'

Using the host strip on target binaries cannot work, as you guessed in
this thread.

It's because the Makefile.in shipped by the package doesn't obey to the
$(STRIP) variable. So, you have several options :

 * Use <pkg>_INSTALL_TARGET_OPT as suggested later in the thread to not
   use the install-strip target but the install target instead. This is
   ok, as all binaries are stripped by the main Buildroot Makefile at
   the end of the build process anyway.

 * Add <pkg>_AUTORECONF=YES to your .mk file, which should re-generate
   a Makefile.in that will likely do the right thing with $(STRIP)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
