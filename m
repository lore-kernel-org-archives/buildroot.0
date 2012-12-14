From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Dec 2012 14:01:11 +0100
Subject: [Buildroot] [PATCH 03/20] package/usbredir: new package
In-Reply-To: <87mwxgiylq.fsf@dell.be.48ers.dk>
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <b6f27b8d9306f0a01bd003e2c9bdc1f5c5e87128.1355435224.git.yann.morin.1998@free.fr>
 <87mwxgiylq.fsf@dell.be.48ers.dk>
Message-ID: <201212141401.11951.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 14 December 2012 13:53:37 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
>  Yann> new file mode 100644
>  Yann> index 0000000..8d8ac5a
>  Yann> --- /dev/null
>  Yann> +++ b/package/usbredir/Config.in
>  Yann> @@ -0,0 +1,28 @@
>  Yann> +comment "usbredir requires libusb"
>  Yann> +	depends on !BR2_PACKAGE_LIBUSB
>  Yann> +
> 
> We normally use select for libraries. Any reason to not use it here?

libusb depends on threads, and I do not want to play the game of
inheriting the dependencies of my own dependencies, and reproduce
the libffi mess.

libusb has a dependency I can not select, so I just depend on it.

>  Yann> +USBREDIR_DEPENDENCIES    += host-pkgconf
> 
> Any particular reason to not merge this line with the one above?

Probably no good reason, indeed.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
