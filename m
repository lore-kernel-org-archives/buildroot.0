From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 13:24:46 +0100
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.24
In-Reply-To: <1444330826-31555-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444330826-31555-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5617B20E.3070805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/08/2015 08:00 PM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^STUNNEL_VERSION package/stunnel/stunnel.mk
STUNNEL_VERSION_MAJOR = 5
STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).24
[13:22:12] vriera at vriera-linux ~/git-clones/buildroot-1 $ file
output/target/usr/bin/stunnel
output/target/usr/bin/stunnel: ELF 32-bit MSB shared object, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.

> ---
>  package/stunnel/stunnel.hash | 4 ++--
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index 1ac8350..7edf51a 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,2 +1,2 @@
> -# From https://www.stunnel.org/pipermail/stunnel-announce/2015-September/000108.html
> -sha256	0fc4a702afd2e857bae8ad1f39c51546eb282c3d0ff4f4d55d62aece7328ddea	stunnel-5.23.tar.gz
> +# From http://www.stunnel.org/pipermail/stunnel-users/2015-October/005238.html
> +sha256	ab2e5a1034d422951ddad21b572eb7fa8efb4c4ce04bc86536c6845f3d02b07e	stunnel-5.24.tar.gz
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index c44518f..32ed0db 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  STUNNEL_VERSION_MAJOR = 5
> -STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).23
> +STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).24
>  STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
>  STUNNEL_DEPENDENCIES = openssl
>  STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
> 
