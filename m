From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 1 Sep 2015 08:46:40 +0200
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.1p1
In-Reply-To: <1440528839-20096-1-git-send-email-gustavo@zacarias.com.ar>
References: <1440528839-20096-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAGm1_ku7aBHOPyKGpvXFKzPPc-kgjYTd9MqZ1dB0yAR7r7aOrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Aug 25, 2015 at 8:53 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Fixes:
> CVE-2015-6563 - Fixed a privilege separation weakness related to PAM
> support.
> CVE-2015-6564 - Fixed a use-after-free bug related to PAM support that
> was reachable by attackers who could compromise the pre-authentication
> process for remote code exectuion.
> CVE-2015-6565 - incorrectly set TTYs to be world-writable.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssh/openssh.hash | 5 +++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 76d0be8..84f0667 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# Also from http://www.openssh.com/txt/release-6.9 (sha256 is base64 encoded)
> -sha256 6e074df538f357d440be6cf93dc581a21f22d39e236f217fcd8eacbb6c896cfe        openssh-6.9p1.tar.gz
> +# Also from http://www.openssh.com/txt/release-7.1 (sha256 is base64 encoded)
> +# Decode with -> echo <encoded stuff>|base64 -d|hexdump -v -e '/1 "%02x"'
> +sha256 fc0a6d2d1d063d5c66dffd952493d0cda256cad204f681de0f84ef85b2ad8428        openssh-7.1p1.tar.gz
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 5a7162f..b95914b 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPENSSH_VERSION = 6.9p1
> +OPENSSH_VERSION = 7.1p1
>  OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>  OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
>  OPENSSH_LICENSE_FILES = LICENCE

Are you using special sshd_config? After updating to 7.1p1 I couldn't
login with the default config. ssh said "Permission denied". After
downgrading to 6.9p1 I could login as usual.

Yegor
