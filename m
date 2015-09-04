From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 13:48:09 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P3
In-Reply-To: <1441370392-9334-1-git-send-email-gustavo@zacarias.com.ar>
References: <1441370392-9334-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55E99309.6040804@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/04/2015 01:39 PM, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-5722 - denial-of-service vector which can be exploited remotely
> against a BIND server that is performing validation on DNSSEC-signed
> records.
> CVE-2015-5986 - denial-of-service vector which can be used against a
> BIND server that is performing recursion and (under limited conditions)
> an authoritative-only nameserver.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 6bc2d1b..4c9fc40 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,2 +1,2 @@
> -# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P2/bind-9.9.7-P2.tar.gz.sha256.asc
> -sha256	f5f433567e5f68d61460d86f691471259a49b6d10d7422acbd88b7fdb038b518	bind-9.9.7-P2.tar.gz
> +# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P3/bind-9.9.7-P3.tar.gz.sha256.asc
> +sha256	cb737dce18350890f350dd7d3bc836c62ea440103dfde184c09bc18cfad8a844	bind-9.9.7-P3.tar.gz
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 6201991..95051d1 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.9.7-P2
> +BIND_VERSION = 9.9.7-P3
>  BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
>  BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^BIND_VERSION package/bind/bind.mk
BIND_VERSION = 9.9.7-P3

$ file output/target/usr/sbin/named
output/target/usr/sbin/named: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1, dynamically linked (uses shared libs), for GNU/Linux
2.6.32, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70401, not stripped

Regards,

Vincent.
