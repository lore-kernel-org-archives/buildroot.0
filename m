From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 11:58:35 +0100
Subject: [Buildroot] [PATCH] bind: bump to version 9.9.8
In-Reply-To: <1444335393-6199-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444335393-6199-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56179DDB.7070308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/08/2015 09:16 PM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^BIND_VERSION package/bind/bind.mk
BIND_VERSION = 9.9.8

$ file output/target/usr/sbin/named
output/target/usr/sbin/named: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 4c9fc40..7f52c55 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,2 +1,2 @@
> -# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P3/bind-9.9.7-P3.tar.gz.sha256.asc
> -sha256	cb737dce18350890f350dd7d3bc836c62ea440103dfde184c09bc18cfad8a844	bind-9.9.7-P3.tar.gz
> +# Verified from ftp://ftp.isc.org/isc/bind9/9.9.8/bind-9.9.8.tar.gz.sha256.asc
> +sha256	643997cdb0dd232a4c9f7c0f1436841fbf325c6b7269e6490bf5f380eda344e3	bind-9.9.8.tar.gz
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 95051d1..e93b356 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.9.7-P3
> +BIND_VERSION = 9.9.8
>  BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
>  BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
> 
