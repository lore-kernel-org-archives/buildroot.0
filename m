From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 00:10:40 +0100
Subject: [Buildroot] [PATCH 4/5 v2] pkg-download: verify the hashes from
 the download wrapper
In-Reply-To: <70023398f1201f12b64802bdc16fd0711dc97050.1417949583.git.yann.morin.1998@free.fr>
References: <cover.1417949583.git.yann.morin.1998@free.fr>
 <70023398f1201f12b64802bdc16fd0711dc97050.1417949583.git.yann.morin.1998@free.fr>
Message-ID: <20141207231040.GM10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-12-07 12:02 +0100, Yann E. MORIN spake thusly:
> Instead of repeating the check in our download rules, delegate the check
> of the hashes to the download wrapper.
[--SNIP--]
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 9192950..b3ddfe3 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
[--SNIP--]
> @@ -174,9 +167,9 @@ endef
>  define DOWNLOAD_SCP
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
>  		-o $(DL_DIR)/$(2) \
> +		-H $(PKGDIR)/$($(PKG)_NAME).hash \
>  		-- \
>  		'$(call stripurischeme,$(call qstrip,$(1)))' && \

Damn, left-over bug... :-( Uncommitted file. Forgot git add... :-(

Marking this series as "Changes requested", because we suddenly
uncovered another hash-related bug (especially without that series),
which happens for host packages for which the tarball is broken: hashes
are not checked for host packages...

I'll investigate that problem before I respin the series...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
