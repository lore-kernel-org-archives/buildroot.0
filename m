From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:04:09 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <1480885126-517-2-git-send-email-romain.naour@gmail.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204220409.45688c5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 21:58:45 +0100, Romain Naour wrote:
> Some waf packages may want to pass additional variables to waf script
> in each build step. Add the possibility to do so by defining the
> following variables:
>   <pkg>_MAKE_OPTS for the build step
>   <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
>   <pkg>_INSTALL_TARGET_OPTS for the install to target directory
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Isn't it a bug of the upstream package that we need to pass --no-tests
at every step?

Other than that, this change lacks the corresponding update to the
Buildroot manual.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
