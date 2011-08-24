From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 24 Aug 2011 14:31:11 +0000 (UTC)
Subject: [Buildroot] external buildroot toolchain: LD_LIBRARY_PATH needed
References: <CAAXf6LV8wL4wAp1eETK7mtwqCFCgoJWFBScnhGzhERZMs2R+Ww@mail.gmail.com>
Message-ID: <j331vf$6s0$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-08-24, Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> If I build a buildroot toolchain on machine A, package the
> output/host/usr directory and use that as an external toolchain on
> machine B, I get errors that cc1 cannot find libmpfr.so.4. The
> location of that library is hardcoded in some compiler tools, and
> since we are on another machine, the original location does not
> exist.
>
> I can work around this by specifying
> LD_LIBRARY_PATH=<buildroot>/output/host/opt/ext-toolchain/lib in the
> environment, but this is an annoying and not so clean solution.
>
> How is this supposed to work?

Generally, when you run a gcc from somewhere othern than the location
for which it was originally compled you use the --sysroot option on
the compiler command line to tell it where it's now installed.

I don't know if the buildroot toolchain has that enabled or not.  I
had a lot of problems trying to use a buildroot-generated toolchain as
an external toolchain (this was a year or two back) and switched to
using crosstool-ng to build my toolchains.

-- 
Grant Edwards               grant.b.edwards        Yow! I wonder if there's
                                  at               anything GOOD on tonight?
                              gmail.com            
