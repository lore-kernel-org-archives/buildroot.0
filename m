From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 20 Aug 2010 16:14:08 +0100
Subject: [Buildroot] How to get gdb in the image
In-Reply-To: <29492552.post@talk.nabble.com>
References: <29492552.post@talk.nabble.com>
Message-ID: <0901DF5E22854D36A787D3FA5AAADCB2@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of JNY
> Sent: 20 August 2010 15:48
> 
> Hi,
> 
> I need gdb on my target, so selected the gdb options available to me in
> buildroot (Toolchain->Build gdb degugger for the target, Toolchain->Build
> gdb server for the target, Toolchain->Build gdb for the host, Toolchain-
> >GDB
> Debugger Version 6.8).  I then re-made, and installed the output image,
> but
> still gdb is not recognised on the target after installation.

If you want to perform remote debug then you will need gdbserver on the
target and gdb on the host.  There is no need to build gdb for the target.

If you want to perform debug on the target then you will need gdb for the
target.  There is no need to build gdbserver for the target nor gdb for the
host, I assume, although I never do this as having dev tools on the target
seems a bit over the top to me.

This may just be an example of buildroot not rebuilding properly.  See
http://buildroot.uclibc.org/downloads/buildroot.html#rebuilding_packages for
more information on how to coax buildroot to rebuild a package.

> 
> Any ideas would be received with thanks (and admiration - don't know if
> flattery will help, but I figure it's worth a shot ;-))
> 
> Regards,
> JNY
> --
> View this message in context: http://old.nabble.com/How-to-get-gdb-in-the-
> image-tp29492552p29492552.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
