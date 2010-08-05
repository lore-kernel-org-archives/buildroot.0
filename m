From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 6 Aug 2010 00:08:48 +1000
Subject: [Buildroot] [PATCH]: Added splashy package.
In-Reply-To: <AANLkTikgFYWJXjwNAsJ-zEbghTHHb-iOm0FXfwMVmx_a@mail.gmail.com>
References: <AANLkTikCiu-MEJcq7O-4zCY6ADvPuAaX3AuhBuE-6ucA@mail.gmail.com> 
	<AANLkTinHcA5iZ3c-ytGU=vpPkQy3NKH-22m_vfPJZYP5@mail.gmail.com> 
	<AANLkTikgFYWJXjwNAsJ-zEbghTHHb-iOm0FXfwMVmx_a@mail.gmail.com>
Message-ID: <AANLkTikg=u5QWEKin7tQy31T9_uiTGKFs-XRFAPBLihN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 6, 2010 at 12:01 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
>>>
> splashy has dependency on libmagic.

I see.

> +++ b/package/splashy/splashy.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# splashy
> +#
> +#############################################################
> +
> +SPLASHY_VERSION:=0.3.13
> +SPLASHY_SITE = https://alioth.debian.org/frs/download.php/2691/
> +SPLASHY_SOURCE = splashy-$(SPLASHY_VERSION).tar.gz
> +SPLASHY_LIBTOOL_PATCH = NO
> +SPLASHY_INSTALL_STAGING = YES
> +SPLASHY_DEPENDENCIES = directfb libglib2 file libpng
> +
> +define LIBMAGIC_INSTALL_STAGING_CMDS

Should this be SPLASHY_INSTALL_STAGING_CMDS?

I try to add also libmagic package but then
> I find out that file package contain libmagic and also header magic.h

I'm no expert, but your SPLASHY_DEPENDENCIES = directfb libglib2 file
libpng line should handle this.  What happens if you just have this
line, and no special installing in the "file" package?

Mitch.
