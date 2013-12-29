From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:53:13 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: update Linaro
 AArch64 toolchains
In-Reply-To: <CAAXf6LX9ZMaBppPWkRG1me5h5EZ9umV-8MGKWVyN+EbAW4_hjg@mail.gmail.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LX9ZMaBppPWkRG1me5h5EZ9umV-8MGKWVyN+EbAW4_hjg@mail.gmail.com>
Message-ID: <20131229185313.43b17aaa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 29 Dec 2013 18:40:50 +0100, Thomas De Schampheleire wrote:

> On Fri, Dec 27, 2013 at 12:32 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Add Linaro AArch64 2013.10 and Linaro AArch64 2013.11, and remove
> > Linaro AArch64 2013.07 and Linaro AArch64 2013.08.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> A while back we discussed the desirability of having so many
> subsequent versions of the same toolchain type (in this case Linaro).
> IIRC (but I did not cross-check with the actual discussion yet) the
> conclusion was that it'd be good to use the gcc version as milestone,
> and keep e.g. a 4.4, 4.6, 4.8 gcc based Linaro toolchain, but not keep
> multiple 4.8-based versions.
> 
> Until now this has not yet been implemented. We could do this in a
> one-shot approach, or gradually as new toolchains are added. If we opt
> for the second option, your current patchset could be revised to align
> with the new strategy.
> 
> What do you think about that?

I continue to think that it doesn't work, as I already expressed
originally. Using the gcc version as a way of keeping different
generations of toolchain is, in my opinion, broken: in the present
update of the ARM Linaro toolchain, we continue to have only gcc 4.8
based toolchains, but the newer ones are based on eglibc 2.18, while the
previous ones are based on eglibc 2.17. This is a fairly significant
difference, but if we use only the gcc version as the way of
distinguishing generations of toolchain, then we would get rid of gcc
4.8/eglibc 2.17 toolchains today.

Why would we keep a very old gcc 4.7.x toolchain, but immediately get
rid of a more recent gcc 4.8 toolchain that is based on eglibc 2.17 ?

As we never managed to come up with a reasonable model to handle this,
I believe we should in the mean time continue to update the toolchains
as we used to do in the past.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
