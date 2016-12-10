From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:59:12 +0100
Subject: [Buildroot] [PATCH v13 1/8] policycoreutils: new package
In-Reply-To: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20161210155912.2fb05507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 14:26:03 -0500, Bryce Ferguson wrote:
> From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> This package contains the core policy utilities that are required
> for basic operation of an SELinux system.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> Tested-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

I've applied your patch to master, with the following changes:

    [Thomas:
     - Move the Config.in comment at the top of the Config.in file rather
       than between the main option and its sub-options, as this breaks
       menuconfig indentation.
     - Fix the propagation of the libsemanage dependencies. libsemanage
       depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS and
       BR2_TOOLCHAIN_USES_GLIBC which were not accounted for. Since it
       depends on BR2_TOOLCHAIN_USES_GLIBC, then all the gettext related
       handling becomes useless and has been removed.
     - Rename the prompt of the restorecond sub-option to just
       "restorecond".
     - Use TARGET_CONFIGURE_OPTS and HOST_CONFIGURE_OPTS instead of
       passing LDFLAGS, CC, etc. manually.
     - Use make "foreach" function for loops instead of shell "for" loops.
     - Rework the explanation of why we're passing DESTDIR at build time.
     - Minor formatting tweaks here and there.]

I've also added Clayton as the contact in the DEVELOPERS file for this
package. If this is not correct, please send another patch to fix that
up. We really want your help to fix build issues that may arise from
this package.

Also, could you please have a look at what I answered to:

  [PATCH v13 4/8] util-linux: selinux, audit, and pam support

and look at the alternative proposals I made:

  https://patchwork.ozlabs.org/patch/703332/
  https://patchwork.ozlabs.org/patch/703333/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
