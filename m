From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 11:16:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: update samba4-cache.txt
 for fcntl flags check
In-Reply-To: <20210404084933.859933-1-bernd.kuhls@t-online.de>
References: <20210404084933.859933-1-bernd.kuhls@t-online.de>
Message-ID: <20210404091644.GE2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-04-04 10:49 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/76a/76a411b78d764561457decd47b268f65059ba1b0/
> 
> Checking whether fcntl supports setting/geting hints : not found
> ..
> Cross answers file /home/giuliobenetti/autobuild/run/instance-2/output-1/build/samba4-4.14.2/cache.txt is incomplete
> 
> Samba4 has added a check for fcntl F_{G,S}ET_RW_HINT /
> F_{G,S}ET_FILE_RW_HINT handling since:
> https://gitlab.com/samba-team/devel/samba/-/commit/5084a69de14f24e9d804998580eefcba773fdd5a
> 
> Which is supported by the Linux kernel since 4.13 in commit
> c75b1d9421f80f41 (fs: add fcntl() interface for setting/getting
>  write life time hints), so add it to the cache file.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/samba4/samba4.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 203d0d1371..99c8af9ab2 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -103,6 +103,7 @@ SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_CTDB_TESTS
>  
>  define SAMBA4_CONFIGURE_CMDS
>  	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
> +	echo 'Checking whether fcntl supports setting/geting hints: $(if $(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13),OK,NO)' >>$(@D)/cache.txt;
>  	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
>  	(cd $(@D); \
>  		$(SAMBA4_PYTHON) \
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
