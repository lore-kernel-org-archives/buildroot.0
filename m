From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:47:00 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <1437932796-16216-1-git-send-email-bas@bmail.ru>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
Message-ID: <20150726214700.68302c4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jul 2015 20:46:36 +0300, kyak wrote:
> From: Mikhail Peselnik <bas@bmail.ru>
> 
> These flags need to be set so that the configure script would
> correctly use libICE from cross-toolchain rather than from host.
> Also, the xterm package is missing the freetype2 dependency, as
> noted by Romain Naour.

So it should be two patches.

Basically, if your patch does something that isn't summarized in the
commit title, then probably something wrong is going on.

So, one patch for x-includes/x-libraries, one patch for the missing
freetype2 dependency.

However, I believe Romain was maybe wrong: the freetype dependency
seems to be optional, according to configure.in. So it should probably
just be:

ifeq ($(BR2_PACKAGE_FREETYPE),y)
XTERM_DEPENDENCIES += freetype
XTERM_CONF_OPTS += --enable-freetype
else
XTERM_CONF_OPTS += --disable-freetype
endif

Romain, can you confirm?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
