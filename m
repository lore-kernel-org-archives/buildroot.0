From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Fri, 7 Feb 2020 10:11:53 +0100
Subject: [Buildroot] [PATCH 04/10] package/systemd: create "remote" user
 if the feature is enabled
In-Reply-To: <20200206093633.251413-5-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-5-nolange79@gmail.com>
Message-ID: <CAFvCimWJPqUMoe8pGHSsGH6RvAniu8Q9Ak8poVNWCoo4rmjZSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Le jeu. 6 f?vr. 2020 ? 10:37, Norbert Lange <nolange79@gmail.com> a ?crit :

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b46c4fd540..b3e83b5d3b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -181,6 +181,7 @@ endif
>
>  ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
>  SYSTEMD_CONF_OPTS += -Dremote=true
> +SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1
> * /var/log/journal/remote - - Journal Remote
>  else
>  SYSTEMD_CONF_OPTS += -Dremote=false
>  endif
> @@ -431,7 +432,7 @@ define SYSTEMD_USERS
>         - - systemd-journal -1 * - - - Journal
>         - - render -1 * - - - DRI rendering nodes
>         - - kvm -1 * - - - kvm nodes
> -       systemd-journal-remote -1 systemd-journal-remote -1 *
> /var/log/journal/remote - - Journal Remote
> +       $(SYSTEMD_REMOTE_USER)
>         $(SYSTEMD_COREDUMP_USER)
>         $(SYSTEMD_NETWORKD_USER)
>         $(SYSTEMD_RESOLVED_USER)
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/241524fe/attachment.html>
