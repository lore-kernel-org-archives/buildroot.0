From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 17:14:02 +0200
Subject: [Buildroot] [PATCH 7/8] configs: add defconfig for Atmel
 sama5d3 Xplained
In-Reply-To: <CAMQcK5+XSqStQkJTBQUwzsWvCjQk=Uq8Z5g0yP_p1TXqsQCoLg@mail.gmail.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1430398311-10804-8-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5+XSqStQkJTBQUwzsWvCjQk=Uq8Z5g0yP_p1TXqsQCoLg@mail.gmail.com>
Message-ID: <20150430151402.GG12076@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/04/2015 at 09:46:44 -0500, Ryan Barnett wrote :
> Alexandre,
> 
> On Thu, Apr 30, 2015 at 7:51 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  configs/atmel_sama5d3_xplained_defconfig | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 configs/atmel_sama5d3_xplained_defconfig
> >
> > diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
> > new file mode 100644
> > index 000000000000..ba3c9cd664bd
> > --- /dev/null
> > +++ b/configs/atmel_sama5d3_xplained_defconfig
> > @@ -0,0 +1,22 @@
> > +BR2_arm=y
> > +BR2_cortex_a5=y
> > +BR2_ARM_EABIHF=y
> > +BR2_ARM_FPU_VFPV4D16=y
> > +BR2_ARM_INSTRUCTIONS_THUMB2=y
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-3.18-at91"
> 
> 'linux-3.18-at91' appears to be a branch which means that it could be
> updated and break this config?
> 
> I believe in order to ensure that a build is reproducible for everyone
> that this should be a tag or commit SHA. This would also apply to all
> your other new NAND configurations for the Atmel boards.
> 

That is the expected behaviour. This branch must not break. I'm not
saying it won't break but if it ever breaks, it will definitively be
fixed.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
