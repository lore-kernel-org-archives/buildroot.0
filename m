From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 22:53:03 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <87iqtagbry.fsf@macbook.be.48ers.dk>
References: <20080905010349.6D501F800B@busybox.net>
	<87iqtagbry.fsf@macbook.be.48ers.dk>
Message-ID: <20080905125303.GA31755@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 05, 2008 at 11:52:33AM +0200, Peter Korsgaard wrote:
>  hamish> Changeset:
>  hamish> Modified: trunk/buildroot/package/freetype/Config.in
>  hamish> ===================================================================
>  hamish> --- trunk/buildroot/package/freetype/Config.in	2008-09-04 16:16:47 UTC (rev 23324)
>  hamish> +++ trunk/buildroot/package/freetype/Config.in	2008-09-05 01:03:45 UTC (rev 23325)
>  hamish> @@ -16,12 +16,12 @@
>  hamish>  	config BR2_FREETYPE_VERSION_2_2_1
>  hamish>  		bool "Freetype 2.2.1"
>  
>  hamish> -	config BR2_FREETYPE_VERSION_2_3_5
>  hamish> -		bool "Freetype 2.3.5"
>  hamish> +	config BR2_FREETYPE_VERSION_2_3_7
>  hamish> +		bool "Freetype 2.3.7"
> 
> Please use 2_3_x like we do it for busybox and haserl so kconfig will
> do the right thing when you update your buildroot snapshot.

Hi Peter,

That sounds good but I'm not really sure what you mean?


choice
	prompt "BusyBox Version"
	depends on BR2_PACKAGE_BUSYBOX
	default BR2_BUSYBOX_VERSION_1_12_X
	help
	  Select the version of BusyBox you wish to use.

	config BR2_BUSYBOX_VERSION_1_2_2_1
		bool "BusyBox 1.2.2.1"
		depends on BR2_DEPRECATED

	[...]
endchoice

config BR2_BUSYBOX_VERSION
	string
	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
	default "1.7.5"		if BR2_BUSYBOX_VERSION_1_7_X
	default "1.8.3"		if BR2_BUSYBOX_VERSION_1_8_X
	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
	default "1.11.2"	if BR2_BUSYBOX_VERSION_1_11_X
	default "1.12.0"	if BR2_BUSYBOX_VERSION_1_12_X


How's it different?

Thanks and regards
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
