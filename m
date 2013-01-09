From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jan 2013 18:34:38 +0100
Subject: [Buildroot] [PATCH] packages/dvbsnoop: new package dvbsnoop
In-Reply-To: <1357751014-5123-2-git-send-email-c.schoenert@gmail.com>
References: <1357751014-5123-1-git-send-email-c.schoenert@gmail.com>
 <1357751014-5123-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <201301091834.38893.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carsten, All,

On Wednesday 09 January 2013 Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@t-online.de>
> 
> dvbsnoop is a DVB/MPEG stream analyzer. It's designed to debug, dump or
> view the digital stream info available via

Hmm. Interesting! :-)

> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index 273d9bc..07b4f1a 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -2,6 +2,7 @@ menu "Audio and video applications"
>  source "package/multimedia/alsa-utils/Config.in"
>  source "package/multimedia/aumix/Config.in"
>  source "package/multimedia/bellagio/Config.in"
> +source "package/multimedia/dvbsnoop/Config.in"

There's already dvb-apps that deals with DVB stuff, and it is not in the
multimedia/ sub-dir, and is also in the "Hardware handling" sub-menu.

I think dvb-apps and dvbsnoop should be in the same sub-menu, and
"hardware handling" seems (to me) a better place than "Multimedia".

[--SNIP--]
> diff --git a/package/multimedia/dvbsnoop/dvbsnoop.mk b/package/multimedia/dvbsnoop/dvbsnoop.mk
> new file mode 100644
> index 0000000..a3ff468
> --- /dev/null
> +++ b/package/multimedia/dvbsnoop/dvbsnoop.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# dvbsnoop
> +#
> +#############################################################
> +
> +DVBSNOOP_VERSION        = 1.4.50
> +DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
> +DVBSNOOP_SITE_METHOD    = gz

'gz' is not a valid _SITE_METHOD.
Since you're downloading a tarball, then you should not set _SITE_METHOD.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
