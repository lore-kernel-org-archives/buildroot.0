From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 09:47:56 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom
 target directory
In-Reply-To: <LEWX59$4533F784E6DAC4CB1531E0AED3C460A7@aruba.it>
References: <LEWX59$4533F784E6DAC4CB1531E0AED3C460A7@aruba.it>
Message-ID: <20110114094756.4f6d1747@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jan 2011 14:51:09 +0100
"Luca Ceresoli" <list@lucaceresoli.net> wrote:

> I think Thomas is right: a unique setting should be used to override
> the font install dir.
> 
> It might look like this in menuconfig:
> 
>       *** X libraries and helper libraries ***
>   ()  Force all fonts to be installed here {*}
>   [*] DejaVu (Free fonts)  --->
>   [ ] Liberation (Free fonts) 
>       *** X Window managers ***
> 
> {*} if this is empty, each font .mk will install in the default directory,
> as liberation does in current head;
> otherwise all fonts will be copied in the directory specified.
> 
> How about this?

That could be one solution. The other solution would be to hide this
from the user, i.e an unvisible configuration option to select the
installation location of the fonts (i.e ? fonts in subdirs ? or ? all
fonts in /usr/share/fonts ?). ? fonts in subdirs ? would be the
default, and ? all fonts in /usr/share/fonts/ ? would be selected by
Nano-X/Microwindows. This way, the user wouldn't have to worry about
the installation location of fonts.

But for the moment, we don't have any microwin package. It got removed
in september 2010, due to upstream inactivity. But it seems that the
project is active again, and a new release has been made. So obviously,
we could re-add such a package if someone submits it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
