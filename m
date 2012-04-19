From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Apr 2012 22:35:18 +0200
Subject: [Buildroot] [PATCH 2/3] Fix systemd failure with media devices
In-Reply-To: <81922605e072cb2c80e6b3bbad5ae5f8ab810e31.1334748542.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 18 Apr 2012 13:29:22 +0200")
References: <cover.1334748542.git.maxime.ripard@free-electrons.com>
 <cover.1334748542.git.maxime.ripard@free-electrons.com>
 <81922605e072cb2c80e6b3bbad5ae5f8ab810e31.1334748542.git.maxime.ripard@free-electrons.com>
Message-ID: <874nsfjw8p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  package/systemd/systemd.mk |    5 +++++
 Maxime>  1 files changed, 5 insertions(+), 0 deletions(-)

 Maxime> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
 Maxime> index 717bdcc..83800c5 100644
 Maxime> --- a/package/systemd/systemd.mk
 Maxime> +++ b/package/systemd/systemd.mk
 Maxime> @@ -64,8 +64,13 @@ define SYSTEMD_INSTALL_TTY_HOOK
 Maxime>  	ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 Maxime>  endef
 
 Maxime> +define SYSTEMD_INSTALL_MISC
 Maxime> +	mkdir -p $(TARGET_DIR)/media
 Maxime> +endef

Why not just add that directory to the default skeleton instead like we
recently did for /run?

-- 
Bye, Peter Korsgaard
