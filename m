From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 17 Jun 2008 14:23:19 +1000
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080616122246.C821B3C987@busybox.net>
References: <20080616122246.C821B3C987@busybox.net>
Message-ID: <20080617042319.GA17083@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 16, 2008 at 05:22:46AM -0700, jacmet at uclibc.org wrote:
>  config BR2_TOOLCHAIN_EXTERNAL_PATH
>  	string "External toolchain path"
> -	default ""
> +	default "/path/to/staging_dir/usr"
>  	help
>  	  Path to where the external toolchain is installed.

I've set this to "$(BR2_STAGING_DIR)/usr" here, which might be a good
default?

>  config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	string "External toolchain prefix"
> -	default ""
> +	default "$(ARCH)-linux"
>  	help
>  	  This the the external toolchain prefix. For example:
>  	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.

Probably not a useful default, given that all the examples have -gnu etc
after them? Mine is armeb-linux-uclibcgnu here; again you can probably
construct something like "$(ARCH)-$(BR2_GNU_TARGET_SUFFIX)".


thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
