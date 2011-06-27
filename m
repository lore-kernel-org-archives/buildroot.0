From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jun 2011 06:59:39 +0300
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <4E04C9EE.4050206@rossvideo.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
 <4E04C9EE.4050206@rossvideo.com>
Message-ID: <20110627035939.GB3046@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Raymond, Matias,

On Fri, Jun 24, 2011 at 01:31:26PM -0400, Matias Garcia wrote:
> You can put those in the BR2_TARGET_OPTIMIZATIONS setting under the
> Toolchain page e.g.
> 
> (-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double)
> Target Optimizations
> 
> I selected a generic powerpc target because I didn't need the -mtune
> when I was specifying -mcpu already. As far as I know, 8548 and 8540
> work out to the same code.
> 
> I switched to the external CodeSourcery build tools for two reasons:
> (1) it allowed us to compile our application with -O3 (which we
> need) while the standard GNU toolchain caused some errors, and (2)
> they're supported by the Freescale/Mentor/CodeSourcery relationship,
> and not all of the patches get applied to mainline (particularly for
> newer processors). I had to add an option to the external wrapper so
> that it would call the toolchain with '-te500v2' which is a shortcut
> for the optimizations you list below. In that case, you can build
> your own applications without calling any options explicitly.

I'm also using the CodeSourcery toolchain for the e500v2 target (P1011), and I 
figured out that I must pass -te500v2 to gcc at link time as well. Since there 
is no generic way to add LDFLAGS options in Buildroot, I've posted the patch 
at http://lists.busybox.net/pipermail/buildroot/2011-June/043668.html. Did you 
find a better solution?

baruch

> On 11-06-24 10:27 AM, raymond zhao wrote:
> >Hi,
> >I am using freescale's p1020 CPU. It is a e500v2 core. How could I
> >config the build root to tune the tool chain for the following
> >options:
> >
> >-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double
> >
> > From the menuconfig, I can only select CPU as 8540.

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
