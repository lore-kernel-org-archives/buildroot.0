From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 17 Nov 2012 21:14:00 -0500
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <CANxTyt6cjey_R_w+ZupOqUF_oaN09eF5jUDt=TWu6fUSNT8SWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 17, 2012 at 7:15 PM, Stefan Fr?berg <
stefan.froberg@petroprogram.com> wrote:
>
> +ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p"
> $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
> +BUSYBOX_DEPENDENCIES += linux-pam
> +endif
>

Why bother with the sed?  Could you not do "ifeq
($(BR2_PACKAGE_LINUX_PAM),y)"?

Just a thought ...
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/279dff61/attachment.html>
