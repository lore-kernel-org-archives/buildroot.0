From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 May 2012 08:21:25 +0200
Subject: [Buildroot] [PATCH v3 02/22] gettext: warn that legal-info is
	not implemented
In-Reply-To: <1336421563-5986-2-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAAXf6LW4v94Z8U8wtfCkdRQZ85qEM4p2GQNvAsDgijSW_ZSvYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 7, 2012 at 10:12 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> ?package/gettext/gettext.mk | ? ?3 +++
> ?1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index f3605da..1d9d84d 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -113,6 +113,9 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
> ? ? ? ? ? ? ? ?autopoint envsubst gettext.sh gettextize msg* ?gettext)
> ? ? ? ?touch -c $@
>
> +gettext-legal-info:
> + ? ? ? @$(call legal-warning-pkg,gettext,cannot produce any legal info)
> +

I don't think this statement is not entirely correct. It's not that we
'cannot' produce the info. It's just that currently, we did not add
the necessary license definitions, right?
What about something like 'legal-info not yet implemented' or 'no
legal info saved yet' or ...?

Moreover, will this be added to each package for which no legal info
is provided? What about making this message the default by putting it
in pkg-gentargets.mk, if no suitable variables were defined?

> ?gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
>
> ?gettext-unpacked: $(GETTEXT_DIR)/.unpacked
> --
> 1.7.5.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
