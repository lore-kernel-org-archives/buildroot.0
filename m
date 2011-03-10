From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 12:26:59 +0100
Subject: [Buildroot] 2011.02 pkg-config problems?
In-Reply-To: <8762rr8bs8.fsf@macbook.be.48ers.dk>
References: <WC20110307121409.5600B6@terrafix.co.uk>
	<8762rr8bs8.fsf@macbook.be.48ers.dk>
Message-ID: <20110310122659.7d9abef7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Mar 2011 12:17:43 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Thanks for reporting this. The problem is that pkg-config doesn't have
> any explicit support for cross compilation, so we have to guess if a
> given variable refers to a target path or a host path. For this
> specific problem you could work around it by passing an explicit
> --with-fontrootdir=/usr/share/fonts/X11 to the configure step of the
> xfonts packages, but I have fixed pkg-config in git to only prepend
> the sysroot location when the includedir + libdir variables are
> requested, and not all variables like we did for 2011.02:
> 
> http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabe

Maybe we need to release 2011.02.1 with this fix ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
