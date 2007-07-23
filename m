From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 23 Jul 2007 08:35:38 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
In-Reply-To: <20070723124044.664C930041@busybox.net>
References: <20070723124044.664C930041@busybox.net>
Message-ID: <37c712e0707230535r4ce29af9t3e39b53037b6fd8d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/23/07, ulf at uclibc.org <ulf@uclibc.org> wrote:
> Author: ulf
> Date: 2007-07-23 05:40:43 -0700 (Mon, 23 Jul 2007)
> New Revision: 19229
>
> Log:
> Cleanup of mplayer package
>
> [...]
>
>  $(MPLAYER_DIR)/$(MPLAYER_BINARY): $(MPLAYER_DIR)/.configured
>         $(MAKE) -C $(MPLAYER_DIR)
> -       @touch -c $@
> +       touch -c $@
>
>  $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
>         $(INSTALL) -m 0755 -D $(MPLAYER_DIR)/$(MPLAYER_BINARY) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
>         -$(STRIP) --strip-unneeded $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
> -       @touch -c $@
> +       touch -c $@

I don't see the logic for these last two touch commands.  Sure "-c"
says "do not create", but they seem unnecessary.

Allan
