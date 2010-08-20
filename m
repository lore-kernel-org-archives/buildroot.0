From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Aug 2010 19:12:57 +0200
Subject: [Buildroot] How to get gdb in the image
In-Reply-To: <29492552.post@talk.nabble.com>
References: <29492552.post@talk.nabble.com>
Message-ID: <20100820191257.61821f87@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Aug 2010 07:48:13 -0700 (PDT)
JNY <jny0@hotmail.com> wrote:

> I need gdb on my target, so selected the gdb options available to me
> in buildroot (Toolchain->Build gdb degugger for the target,
> Toolchain->Build gdb server for the target, Toolchain->Build gdb for
> the host, Toolchain->GDB Debugger Version 6.8).  I then re-made, and
> installed the output image, but still gdb is not recognised on the
> target after installation.

You need to enable:

  Toolchain -> Build gdb server for the target
  Toolchain -> Build gdb for the host

Then, remove everything (make clean), and rebuild everything (make).

Basically, any change in the Toolchain submenu requires a complete
rebuild.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
