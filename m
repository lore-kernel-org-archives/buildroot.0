From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Oct 2010 13:13:01 +0200
Subject: [Buildroot] [PATCH 1/3] libgtk2: bump to version 2.20.1 and
 mark Gtk/DirectFB as broken
In-Reply-To: <871v8bz9x4.fsf@macbook.be.48ers.dk>
References: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
	<ca402fe6cbeeefeb15711d9e7f2390fab54c17b8.1285711883.git.thomas.petazzoni@free-electrons.com>
	<1285716520.27944.304.camel@coalu.atr>
	<20100929082914.3185053a@surf> <871v8bz9x4.fsf@macbook.be.48ers.dk>
Message-ID: <20101003131301.6a434c30@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Sep 2010 14:35:19 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> Argh, I checked http://www.gtk.org/download-linux.html
>  Thomas> yesterday, and it still advertise Gtk 2.20 and Glib 2.24.
> 
>  Thomas> I will bump those versions, yes, and mark the DirectFB
>  Thomas> support as working again.
> 
> Ok, I'll put your pull request on hold for now then. Please resend
> once ready.

Unfortunately, things are not that simple.

In order to reduce the number of dependencies needed to build
host-libgtk2 (in which a few tools are needed to build the target
libgtk2), we apply a patch to libgtk2 configure.in file. Applying a
patch to the configure.in obviously means that host-libgtk2 needs to be
auto-reconfigured.

However, libgtk2 2.22 now requires libtool 2.2, and we only have
libtool 1.5. So unless we upgrade libtool to 2.2, it is not possible to
autoreconfigure libgtk2 and therefore not possible to apply a patch to
its configure.in file.

We *really* need to take a decision on the libtool stuff. I've sent a
summary of the two proposals and would like to see some more reactions
to it in order to move forward on this topic.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
