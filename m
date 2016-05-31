From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 13:59:36 +0200
Subject: [Buildroot] [PATCH] mesa3d: use -mno-compact-eh for Code
 Sourcery MIPS
In-Reply-To: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160531135936.4f2c0691@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 11:15:55 +0100, Vicente Olivert Riera wrote:

> +# mesa3d doesn't like the new compressed exception handling of the Code
> +# Sourcery MIPS toolchain and it fails to compile. Using -mno-compact-eh
> +# fixes the problem.
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
> +MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
> +MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
> +endif

Isn't an upstreamable fix to mesa3d configure script a better solution?
See package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch in
Buildroot.

Do you know when code can be built with this "Compact EH" feature and
when code cannot? I.e how many packages are going to be potentially
affected by this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
