From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Fri, 10 Dec 2010 20:37:57 -0800 (PST)
Subject: [Buildroot] [PATCH 14/55] documentation: Update to explain how
	board support works
In-Reply-To: <da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
Message-ID: <143229.86585.qm@web58201.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Subject: [Buildroot] [PATCH 14/55] documentation: Update to explain how board 
>support works
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   docs/buildroot.html |  117  
>++++++++++++++++-----------------------------------
>  1 files changed, 36  insertions(+), 81 deletions(-)
> 
> diff --git a/docs/buildroot.html  b/docs/buildroot.html
> index f471962..1353469 100644
> ---  a/docs/buildroot.html
> +++ b/docs/buildroot.html

<<snip>>


> +    <p>Once you have a  known working configuration, run <code>make
> +     savedefconfig</code>. This will generate a
> +    minimal  <code>defconfig</code> file at the root of the Buildroot
> +     source tree. Move this file into the  <code>configs/</code>
> +    directory, and rename it  <code>MYBOARD_defconfig</code>.</p>
> +

Hi Thomas,

I am trying to prepare a board support package. I have run this step and stuff 
disappeared from the .config, for instance:

BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"

Is this normal? It takes so long to completely rebuild, but they don't seem to 
matter. If you say savedefconfig is enough, ok with me.

Regards, Steve



      
