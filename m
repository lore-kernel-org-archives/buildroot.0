From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 15:53:45 +0200
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>
Message-ID: <90f24dxqbs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 24 Jun 2016 21:22:55 +0300 schrieb Dagg Stompler:

> +define LIBAMCODEC_INSTALL_STAGING_CMDS

Hi,

you define LIBAMCODEC_INSTALL_STAGING_CMDS but forgot to add

LIBAMCODEC_INSTALL_STAGING = YES

leading to

checking for amcodec/codec_error.h... no
configure: error: Could not find some required headers. Please see the README for your platform.

during Kodi configure.
After adding the missing line Kodi configure passes.

Regards, Bernd
