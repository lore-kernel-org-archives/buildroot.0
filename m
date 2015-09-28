From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 28 Sep 2015 11:56:09 +0100
Subject: [Buildroot] [PATCH] mosquitto: bump version
In-Reply-To: <1443386958-24125-1-git-send-email-peter@korsgaard.com>
References: <1443386958-24125-1-git-send-email-peter@korsgaard.com>
Message-ID: <56091CC9.9040408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

I think is a good habit to write the version number in the subject, so
someone using "git log --oneline" would be able to see to which version
number are you bumping :P

On 09/27/2015 09:49 PM, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^MOSQUITTO_VERSION package/mosquitto/mosquitto.mk
MOSQUITTO_VERSION = 1.4.4

$ file output/target/usr/bin/mosquitto_pub
output/target/usr/bin/mosquitto_pub: ELF 32-bit MSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
>  package/mosquitto/mosquitto.hash | 2 +-
>  package/mosquitto/mosquitto.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
> index 2ca1d17..e2db213 100644
> --- a/package/mosquitto/mosquitto.hash
> +++ b/package/mosquitto/mosquitto.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	773d7436f729b5a6088035708c9277a9c6ba5651e127b63c8f29fe39e152479c  mosquitto-1.4.3.tar.gz
> +sha256  c643c7123708aadcd29287dda7b5ce7c910f75b02956a8fc4fe65ad2ea767a5f  mosquitto-1.4.4.tar.gz
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index d9703fb..73365f9 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOSQUITTO_VERSION = 1.4.3
> +MOSQUITTO_VERSION = 1.4.4
>  MOSQUITTO_SITE = http://mosquitto.org/files/source
>  MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
>  MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
> 
