From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 17:15:43 +0100
Subject: [Buildroot] [PATCH v4] efl: do not force dependency on libudev
 by making eeze a config option.
In-Reply-To: <20170206161028.11380-1-romain.naour@gmail.com>
References: <20170206161028.11380-1-romain.naour@gmail.com>
Message-ID: <20170206171543.1c417917@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 17:10:28 +0100, Romain Naour wrote:
> From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> 
> Although highly recommended to be enabled, EFL's eeze can be disabled
> and thus no dependency on libudev or dynamic device management.
> 
> Since 'BR2_PACKAGE_HAS_UDEV' has two ways to be satisfied (eudev or
> systemd) we can't automatically select it, instead show a comment and
> use 'depends on'.
> 
> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> [Romain:
>   - Propagate the eeze dependency to enlightenment and efl Wayland
>   - Remove udev provider from eeze comment in efl's Config.in
>   - Add comments when eeze is not available]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v4: Propagate eeze dependency to BR2_PACKAGE_EFL_WAYLAND
>     Add some comments about udev management (eeze)
> v3: Add missing udev in Enlightenment comment text (Baruch Siach)
> v2: Propagate the eeze dependency to enlightenment
>     Remove udev provider from eeze comment in efl's Config.in since
>     we don't explicitely name all possible providers in comment.
> ---
>  package/efl/Config.in           | 38 +++++++++++++++++++++++++++++++-------
>  package/efl/efl.mk              |  9 ++++++++-
>  package/enlightenment/Config.in |  7 +++++--
>  3 files changed, 44 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
