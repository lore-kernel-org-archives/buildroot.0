From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:30:17 +0100
Subject: [Buildroot] [PATCH] new package: libwnck
In-Reply-To: <1361469999-9963-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361469999-9963-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212230.17978.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> libwnck
  ^^^
Useless line.

> A window navigation construction kit
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[--SNIP--]
> diff --git a/package/libwnck/Config.in b/package/libwnck/Config.in
> new file mode 100644
> index 0000000..42ca4fc
> --- /dev/null
> +++ b/package/libwnck/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBWNCK
> +	bool "libwnck"
> +	select	BR2_PACKAGE_LIBGTK2

You have to inherit the dependencies for libgtk2:
    depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB # libgtk2
    depends on BR2_USE_WCHAR # glib2
    depends on BR2_INSTALL_LIBSTDCPP # pango

But I'd prefer it it were a 'depends on BR2_PACKAGE_LIBGTK2' rather than
a 'select'.

And add a comment anyway to state why libwnck is not available.

> +	select	BR2_PACKAGE_STARTUP_NOTIFICATION

Ditto, you need to forward startyup-notification's dependencies.

Regards,
Yann E. MORIN, getting a bit tired of only doing reviews, tonight... ;-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
