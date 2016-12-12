From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Dec 2016 13:11:18 -0600
Subject: [Buildroot] [PATCH v13 1/8] policycoreutils: new package
In-Reply-To: <20161210155912.2fb05507@free-electrons.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20161210155912.2fb05507@free-electrons.com>
Message-ID: <CANQCQpYjc_dwWpA53Xg=y6qkKLiMpLDfyt-CdJ8EhrV_tuUEMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Dec 10, 2016 at 8:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Tue, 25 Oct 2016 14:26:03 -0500, Bryce Ferguson wrote:
> > From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> >
> > This package contains the core policy utilities that are required
> > for basic operation of an SELinux system.
> >
> > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> > Tested-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> > Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
>
> I've applied your patch to master, with the following changes:
>
>     [Thomas:
>      - Move the Config.in comment at the top of the Config.in file rather
>        than between the main option and its sub-options, as this breaks
>        menuconfig indentation.
>      - Fix the propagation of the libsemanage dependencies. libsemanage
>        depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS and
>        BR2_TOOLCHAIN_USES_GLIBC which were not accounted for. Since it
>        depends on BR2_TOOLCHAIN_USES_GLIBC, then all the gettext related
>        handling becomes useless and has been removed.
>      - Rename the prompt of the restorecond sub-option to just
>        "restorecond".
>      - Use TARGET_CONFIGURE_OPTS and HOST_CONFIGURE_OPTS instead of
>        passing LDFLAGS, CC, etc. manually.
>      - Use make "foreach" function for loops instead of shell "for" loops.
>      - Rework the explanation of why we're passing DESTDIR at build time.
>      - Minor formatting tweaks here and there.]
>
> I've also added Clayton as the contact in the DEVELOPERS file for this
> package. If this is not correct, please send another patch to fix that
> up. We really want your help to fix build issues that may arise from
> this package.

Clayton is still a good contact and if not we'll update.

Definitely will be watching the autobuilder.  I'm currently looking at
a issue with "-D_FILE_OFFSET_BITS==64"

>
>
> Also, could you please have a look at what I answered to:
>
>   [PATCH v13 4/8] util-linux: selinux, audit, and pam support
>
> and look at the alternative proposals I made:
>
>   https://patchwork.ozlabs.org/patch/703332/
>   https://patchwork.ozlabs.org/patch/703333/

I'll let Bryce follow up on these.

Thanks!

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
