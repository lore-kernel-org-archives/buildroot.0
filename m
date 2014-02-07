From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 16:29:34 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
Message-ID: <20140207162934.01acfe5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Feb 2014 15:48:35 +0100, Fabio Porcedda wrote:

> The build can be reproduced even when building packages in parallel,
> we just need to record the order of the steps and replay that order if
> needed.

And in practice, how do you achieve this? When building in parallel,
how do you record the fact that the test for libfoo in package A
configure script was run before or after the installation of libfoo in
the global sysroot? It's not only about recording the order of the
build of the package: it's knowing whether each specific test of a
configure script was run before or after the corresponding library was
installed in the global sysroot.

> The sysroot copy is needed only to be sure that even if some package
> has an unspecified optional dependency it generates every time the
> same binary.

Which is *the* very important thing. So saying it's needed "only to be
sure" is quite minimizing the very important consequence of parallel
build with a global sysroot, IMO.

> I think that at least when doing development it will be useful to
> build packages in parallel.
> Maybe it will be best to avoid building packages in parallel just for releases.

I don't agree.

I do a lot of support on #buildroot, and I would *hate* to have people
coming up with bug reports that are not reproducible because they
depend on the specific scheduling of the build. I really don't want new
comers to use this feature and then come back with bug reports that are
basically unfixable because they cannot be reproduced.

I think we should really not minimize the support problem that
parallelization without per-package sysroot is going to cause.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
