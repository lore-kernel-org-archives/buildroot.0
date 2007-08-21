From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 21 Aug 2007 12:26:00 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070821102843.A2E07A4622@busybox.net>
References: <20070821102843.A2E07A4622@busybox.net>
Message-ID: <0708211218490.1707@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to comment on this, if you don't mind.

On Tue, 21 Aug 2007, aldot at uclibc.org wrote:

> Log:
> - put libstdc++.so into the correct place (usr/lib) and make sure
>   that the dir exists
>
>
> Modified:
>    trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
>    trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
>
>
> Changeset:
> Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
> Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
> ===================================================================
> --- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 10:26:55 UTC (rev 19601)
> +++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 10:28:43 UTC (rev 19602)
> @@ -333,6 +333,7 @@
>  	#
>  	# Ok... that's enough of that.
>  	#
> +	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
        ^
        please remove the dash, because

[man mkdir]
       -p, --parents
              no error if existing, make parent directories as needed

But if it still fails for any reason, then we want to know and have
make stop there.  What do you think?


Cheers,

-- 
Cristian
