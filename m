From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 16:07:20 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAEYzJUHpYVBAgHnrj73aMwj8pw+p_bScMToM-BSZh3bm--q2gA@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
 <20130711134646.6ef211dd@skate>
 <201307111402.34152.yann.morin.1998@free.fr>
 <CAEYzJUHpYVBAgHnrj73aMwj8pw+p_bScMToM-BSZh3bm--q2gA@mail.gmail.com>
Message-ID: <20130713160720.34d850a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Fri, 12 Jul 2013 19:07:58 +0200, Bj?rn Forsman wrote:

> > I believe it is much better that Buildroot chokes on a select list of
> > variables, warn about a few others, and accept the rest.
> 
> If you think about it, the downloader is actually a bit different from
> the builder. At some point Buildroot will (like all other build
> systems) grow support for checking each downloaded file against
> checksums specified in the package build file. And once you have that,
> it doesn't really matter how dirty the environment in the *downloader*
> is, because it will be guaranteed to match the checksum, or fail. It
> is only in the *builder* that the environment must be clean.

I am not sure to understand why you separate the download side and the
build side here. Both are done with Buildroot makefiles, there is
nothing different in terms of environment variables between those
steps.

> Are there any reasons for allowing env vars, other than BR2_*, to slip
> through from host and into the Buildroot *builder* processes? I cannot
> think of any.

Yes, we allow passing HOSTCC, UCLIBC_CONFIG_FILE, BUSYBOX_CONFIG_FILE,
and a bunch of other environment variables (see the Buildroot manual).
Also, some environment variables like LD_LIBRARY_PATH or LD_PRELOAD
should just be usable by the user, if he has some funky setup that
requires those environment variables to hold special values.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
