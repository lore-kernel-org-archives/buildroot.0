From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 10:02:59 +0100
Subject: [Buildroot] [PATCH] openswan: security bump to version 2.6.45
In-Reply-To: <1441221347-11991-1-git-send-email-gustavo@zacarias.com.ar>
References: <1441221347-11991-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55E95E43.1080102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,
On 09/02/2015 08:15 PM, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-3240 - IKE DoS when using NSS.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openswan/openswan.hash | 2 +-
>  package/openswan/openswan.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
> index 4853b3f..ef4e18b 100644
> --- a/package/openswan/openswan.hash
> +++ b/package/openswan/openswan.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	ac7ef1d78766801f23c458cc7c3b080ca6e20c5144a1979598c319bc3bc7c88b	openswan-2.6.43.tar.gz
> +sha256	b657b4a3828fc6e9830aabeabec047a71993daeb9dd2607f321e355bc5a53e1e	openswan-2.6.45.tar.gz
> diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
> index b7689c1..7fa945f 100644
> --- a/package/openswan/openswan.mk
> +++ b/package/openswan/openswan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSWAN_VERSION = 2.6.43
> +OPENSWAN_VERSION = 2.6.45
>  OPENSWAN_SITE = http://download.openswan.org/openswan
>  OPENSWAN_LICENSE = GPLv2+, BSD-3c
>  OPENSWAN_LICENSE_FILES = COPYING LICENSE
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^OPENSWAN_VERSION package/openswan/openswan.mk
OPENSWAN_VERSION = 2.6.45

$ file output/target/usr/libexec/ipsec/pluto
output/target/usr/libexec/ipsec/pluto: ELF 32-bit MSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
