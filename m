From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 1 Sep 2009 17:07:17 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <87skf6pvi6.fsf@macbook.be.48ers.dk>
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
	<87skf6pvi6.fsf@macbook.be.48ers.dk>
Message-ID: <20090901150717.GC17682@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 01, 2009 at 04:52:49PM +0200, Peter Korsgaard wrote:
> Date: Tue, 01 Sep 2009 16:52:49 +0200
> From: Peter Korsgaard <jacmet@uclibc.org>
> To: Daniel Mack <daniel@caiaq.de>
> Cc: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH] libarchive package added
> Message-ID: <87skf6pvi6.fsf@macbook.be.48ers.dk>
> User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.3 (gnu/linux)
> 
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
> Hi,
> 
>  Daniel> +config BR2_LIBARCHIVE_INSTALL_TO_TARGET
>  Daniel> +	bool "install libarchive to target"
>  Daniel> +	depends on BR2_PACKAGE_LIBARCHIVE
>  Daniel> +	default y
>  Daniel> +	help
>  Daniel> +	  Say Y here to make BR2 copy the libarchive files to the target
>  Daniel> +	  destination folder.
> 
> When would you not want to do this?

We need that library for a binary which is linked statically. Installing
it is not necessary in our case.

But as the default is 'y', this should not be a disadvantage for anyone.
We could, of course, also delete it manually at a later point.

Daniel
