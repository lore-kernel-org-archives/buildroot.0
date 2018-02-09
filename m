From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 8 Feb 2018 20:35:36 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webengine: fix build issue with alsa
In-Reply-To: <20180209012236.5118-1-gael.portay@savoirfairelinux.com>
References: <20180209012236.5118-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180209013535.iazotrv3kjwzb4np@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 08, 2018 at 08:22:36PM -0500, Ga?l PORTAY wrote:
> +config BR2_PACKAGE_QT5WEBENGINE_ALSA
> +	bool "alsa"
> +	depends on BR2_PACKAGE_ALSA_LIB

Well, I should probably select BR2_PACKAGE_ALSA_LIB instead of depending
on it :/

> +	select BR2_PACKAGE_ALSA_LIB_MIXER
> +	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
> +	select BR2_PACKAGE_ALSA_LIB_HWDEP
> +	select BR2_PACKAGE_ALSA_LIB_SEQ
> +	help
> +	  Enable ALSA support.
> +
