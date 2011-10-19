From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 19 Oct 2011 23:27:51 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due
	to bad file permissions. Adding chmod solves it. (openSUSE)
In-Reply-To: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
References: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
Message-ID: <201110192327.51294.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 19 October 2011 22:55:45 Damian Kaczmarek wrote:

Summary line is too long, keep it under 80 chars. Something like:
  lsof: fix permissions of extracted files

Then you can add a longer description in the commit message:

  Add a "chmod" to fix permissions on the lsof sources, because
  most files are not writable after extraction, so the patching
  fails.

> Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>

After you fix the above, you can add:
Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  package/lsof/lsof.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index ff76f92..bfdfee3 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -35,6 +35,7 @@ endif
>  # The .tar.bz2 contains another .tar, which contains the source code.
>  define LSOF_EXTRACT_TAR
>  	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
> +	chmod +w -R $(@D)
>  	rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
>  endef
>  
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
