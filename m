From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:48:20 +0100
Subject: [Buildroot] [PATCH 1/4] package/xenomai: Smokey's not a skin
In-Reply-To: <f23ad7759ce2abdebafcf0464cf15145e163285b.1576176280.git.jan.kiszka@siemens.com>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
 <f23ad7759ce2abdebafcf0464cf15145e163285b.1576176280.git.jan.kiszka@siemens.com>
Message-ID: <20191212214820.1c84b011@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Dec 2019 19:44:37 +0100
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> That's a testsuite tool.
> 
> Rename XENOMAI_REMOVE_SKIN_LIST at this chance as it's cleaning
> libraries.

I am confused, aren't psos, rtai, uitron, vxworks and al. called
"skins" in the Xenomai speak ?

Ideally, this variable rename should be done in a separate patch, since
it's independent from the smokey option removal.

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  package/xenomai/Config.in  |  5 -----
>  package/xenomai/xenomai.mk | 23 ++++++++++-------------
>  2 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index 83ba8ca162..0cb0b343de 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -170,11 +170,6 @@ config BR2_PACKAGE_XENOMAI_RTAI_SKIN
>  	help
>  	  This option allows to install the RTAI Xenomai skin
>  
> -config BR2_PACKAGE_XENOMAI_SMOKEY_SKIN
> -	bool "Smokey skin"
> -	help
> -	  This option allows to install the Smokey Xenomai skin

We normally want to have Config.in.legacy handling when removing
options, but in this case, the options was in fact not really doing
anything useful, so I believe it's OK to just drop it like you did.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
