From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:21:52 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support
	IPv6 lease file
In-Reply-To: <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CAGduivxGsOm8DRoBsqDAMHx3dkC381C5TvXq_peYiKd1yizyvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit, all

On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <
benoit.thebaudeau.dev@gmail.com> wrote:

> The IPv6 lease file has a different name.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
>
> ---
> Changes v2 -> v3: new patch.
> ---
>  package/dhcp/dhcp.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index c05e694..3aa1577 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -83,6 +83,8 @@ define DHCP_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>         echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
>                 $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> +       echo "f /var/lib/dhcp/dhcpd6.leases - - - - -" >> \
> +               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>  endef
>  endif
>
> Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

A question though, from the manual page of dhcpd, by default it starts as
an IPv6 server should we have, two services one with '-4' and one with '-6'
? And it's left to the user to specify it in the "$OPTIONS" ? Maybe this
should be mentioned somewhere ?

> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/9be81378/attachment.html>
