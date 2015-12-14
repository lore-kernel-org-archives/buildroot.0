From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Dec 2015 12:02:21 +0000
Subject: [Buildroot] [PATCH v2] sbc: new package
In-Reply-To: <1450092584-17940-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1450092584-17940-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <566EAFCD.1010005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 14/12/15 11:29, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---

I was expecting some sort of changelog here, as the manual says:

"21.5.2. Patch revision changelog

When improvements are requested, the new revision of each commit should
include a changelog of the modifications between each submission."

>  package/Config.in     |  1 +
>  package/sbc/Config.in |  8 ++++++++
>  package/sbc/sbc.hash  |  2 ++
>  package/sbc/sbc.mk    | 15 +++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/sbc/Config.in
>  create mode 100644 package/sbc/sbc.hash
>  create mode 100644 package/sbc/sbc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1ab5133..1c7c64b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -739,6 +739,7 @@ menu "Audio/Sound"
>  	source "package/opus/Config.in"
>  	source "package/opusfile/Config.in"
>  	source "package/portaudio/Config.in"
> +	source "package/sbc/Config.in"
>  	source "package/speex/Config.in"
>  	source "package/taglib/Config.in"
>  	source "package/tinyalsa/Config.in"
> diff --git a/package/sbc/Config.in b/package/sbc/Config.in
> new file mode 100644
> index 0000000..f1dbc0e
> --- /dev/null
> +++ b/package/sbc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SBC
> +	bool "sbc"
> +	select BR2_PACKAGE_LIBSNDFILE
> +	help
> +	  An audio codec to connect bluetooth high quality audio
> +	  devices like headphones or loudspeakers.

The "devices" word fits in the first line.

Apart from that, everything looks OK to me, so...

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libsbc.so.1.2.1
output/target/usr/lib/libsbc.so.1.2.1: ELF 32-bit LSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, stripped

Regards,

Vincent.
