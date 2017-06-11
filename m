From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:27:06 +0200
Subject: [Buildroot] [PATCH/next] package/minidlna: add optional avahi
 support
In-Reply-To: <20170522185031.13096-1-bernd.kuhls@t-online.de>
References: <20170522185031.13096-1-bernd.kuhls@t-online.de>
Message-ID: <20170611182706.27ea99f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 20:50:31 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_AVAHI),y)
> +MINIDLNA_CONF_OPTS += --enable-tivo
> +MINIDLNA_DEPENDENCIES += avahi
> +endif
> +

While indeed, Avahi is currently only used by the Tivo code, this is
not directly encoded in the project configure.ac. It is checking
separately for the Tivo option and the availability of Avahi, and the
Tivo support can apparently be built without Avahi support.

So, I would prefer:

 - A patch simply adding avahi as an optional dependency (i.e the same
   patch as yours, without the --enable-tivo line.

 - A patch that adds Config.in options to enable tivo, netgear, readynas
   support.

I believe this would be matching more closely with what minidlna's
configure script is doing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
