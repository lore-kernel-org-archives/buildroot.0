From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 May 2012 09:52:05 +0200
Subject: [Buildroot] [PATCH 1/3] Convert gettext to autotargets
In-Reply-To: <87k407lu8m.fsf@macbook.be.48ers.dk>
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <87k407lu8m.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMMJi=GZpyk6Uzc2f=emzVGnRHOOuDo-Q6JQWWhvm9TAinw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/5/19 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
> Hi,
>
> ?Samuel> From: Maxime Ripard <maxime.ripard@free-electrons.com>
> ?Samuel> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ?Samuel> Acked-by: Samuel Martin <s.martin49@gmail.com>
> ?Samuel> ---
>
> ?Samuel> -$(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
> ?Samuel> - ? ? ?$(MAKE) -C $(GETTEXT_DIR)
> ?Samuel> - ? ? ?touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
> ?Samuel> +define GETTEXT_REMOVE_BINARIES
> ?Samuel> + ? ? ?rm -f $(TARGET_DIR)/usr/bin/gettext
> ?Samuel> + ? ? ?rm -f $(TARGET_DIR)/usr/bin/gettext.sh
> ?Samuel> + ? ? ?rm -f $(TARGET_DIR)/usr/bin/gettextize
> ?Samuel> +endef
>
> ?Samuel> ?ifeq ($(BR2_PACKAGE_LIBINTL),y)
> ?Samuel> + ? ? ?GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
> ?Samuel> ?endif
> ?Samuel> +
>
> This seems backwards. Wouldn't you want to keep the binaries if libintl
> is enabled?

Actually, do we really need to remove these binaries?
On an arm build, these 3 binaries take less than 80KB.

Cheers,

Sam
