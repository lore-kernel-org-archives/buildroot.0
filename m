From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 08:44:37 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Tue, Aug 6, 2013 at 10:46 PM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-utils.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 15db096..8572cb1 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -64,7 +64,8 @@ INFLATE.xz   = $(XZCAT)
>  INFLATE.tar  = cat
>
>  # MESSAGE Macro -- display a message in bold type
> -MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
> +MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" && \
> +              echo -e "\033]2;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
>  TERM_BOLD  := $(shell tput smso)
>  TERM_RESET := $(shell tput rmso)

Although I like the idea, it does not work for me. I'm running Linux
Mint, with a Konsole terminal. The above does nothing at all. I also
tried manually:

echo -ne "\033]0;something\007"

but it doesn't change a thing.
It does work in gnome-terminal. I haven't tested in other situations.

Could you have a look at Konsole?

I know that Gentoo has this feature for its portage package
installation/compilation tool. When you run 'emerge', the titles are
constantly updated with the package that is being handled, also in
Konsole. You may be able to find out what the 'right way' is based on
their sources.

Thanks,
Thomas
