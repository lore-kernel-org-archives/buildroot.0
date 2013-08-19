From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 00:25:56 +0200
Subject: [Buildroot] Removing/solving gettext dependencies in libuio
In-Reply-To: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
References: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
Message-ID: <20130820002556.4d735bb3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 30 Jul 2013 14:28:05 +0200, Thomas De Schampheleire wrote:

> A second alternative is to change libuio to recognize --disable-nls.
> However, I'm not sure how to do that.
> The configure.ac file contains:
> 
>   AM_GNU_GETTEXT([external])
>   AM_GNU_GETTEXT_VERSION([0.17])
> 
> This macro is provided by gettext itself, so without gettext this doesn't work.

This should only require host-gettext, which provides the .m4 file that
contains the m4 macro to autoreconf the package. Once you upstream the
patch, at the next release an updated 'configure' script will be part
of lsuio tarball, and we'll be able to remove the _AUTORECONF=YES and
therefore the dependency on host-gettext.

Am I missing something here?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
