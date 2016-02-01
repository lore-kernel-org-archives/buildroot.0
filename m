From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 15:35:44 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: move the sysroot
 toolchain support check to helper function
In-Reply-To: <1454334017-12326-2-git-send-email-romain.naour@gmail.com>
References: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
 <1454334017-12326-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201153544.581abb55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon,  1 Feb 2016 14:40:17 +0100, Romain Naour wrote:
> The sysroot toolchain support check is duplicated at tree location in the

tree location -> three locations

> external toolchain infra. So move it inside the check_unusable_toolchain helper
> that is called when the sysroot is copied to staging directory.

The check_unusable_toolchain helper is called in
TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS, not when the sysroot is copied to
staging.

I think you should state that we can safely remove the checks in
TOOLCHAIN_EXTERNAL_INSTALL_* because the check is already done in
TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS, so we now it is not needed to do it
again later.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
