From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Aug 2014 11:13:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: Fix missing dependency of
 libogg for plugin opus
In-Reply-To: <1409041685-9603-1-git-send-email-jkrause@posteo.de>
References: <1409041685-9603-1-git-send-email-jkrause@posteo.de>
Message-ID: <20140826111358.122ccde0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 26 Aug 2014 10:28:05 +0200, J?rg Krause wrote:
> The opus decoder plugin depends on libopus and libogg.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index b8a56b7..108b2b1 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -145,6 +145,7 @@ config BR2_PACKAGE_MPD_MUSEPACK
>  config BR2_PACKAGE_MPD_OPUS
>  	bool "opus"
>  	select BR2_PACKAGE_OPUS
> +	select BR2_PACKAGE_LIBOGG
>  	help
>  	  Enable opus input support.
>  	  Select this if you want to play back OPUS encoded files.

And where do you ensure libogg gets built before mpd ?

And the commit log should have a reference to the autobuilder failure
being fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
