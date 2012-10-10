From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 12:34:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <20121010122914.0685ae62@skate> (Thomas Petazzoni's message of
 "Wed, 10 Oct 2012 12:29:14 +0200")
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <878vbeabds.fsf@macbook.be.48ers.dk> <20121010122914.0685ae62@skate>
Message-ID: <874nm2aa44.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> We could either:
 >> - 1: Change download URL to http://
 >> - 2: Hardcode --no-check-certificate wget argument
 >> - 3: Do nothing, as sources.buildroot.net now has a copy
 >> 
 >> I would prefer option 1. Anybody disagrees?

 Thomas> We do all of our downloads using http://, so I think it makes
 Thomas> sense to do it as well for this package.

Most of them, but not all:

git grep https:// package/**/*.mk
package/axel/axel.mk:AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
package/freerdp/freerdp.mk:FREERDP_SITE = https://github.com/downloads/FreeRDP/F
package/inadyn/inadyn.mk:INADYN_SITE = https://github.com/downloads/troglobit/in
package/libevent/libevent.mk:LIBEVENT_SITE = https://github.com/downloads/libeve
package/libnspr/libnspr.mk:LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.or
package/libnss/libnss.mk:LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/s
package/logrotate/logrotate.mk:LOGROTATE_SITE = https://fedorahosted.org/release
package/multimedia/pulseaudio/pulseaudio.mk:# https://bugs.freedesktop.org/show_
package/pcsc-lite/pcsc-lite.mk:PCSC_LITE_SITE = https://alioth.debian.org/frs/do
package/python-nfc/python-nfc.mk:PYTHON_NFC_SITE = https://launchpad.net/nfcpy
package/python-pygame/python-pygame.mk:PYTHON_PYGAME_SITE = https://bitbucket.or
package/sconeserver/sconeserver.mk:     https://sconeserver.svn.sourceforge.net/
package/vim/vim.mk:VIM_SITE = https://vim.googlecode.com/hg
package/vsftpd/vsftpd.mk:VSFTPD_SITE = https://security.appspot.com/downloads

But yeah, I'll change the alioth downloads to http.

-- 
Bye, Peter Korsgaard
