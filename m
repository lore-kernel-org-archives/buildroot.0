From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Oct 2012 12:46:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <874nm2aa44.fsf@macbook.be.48ers.dk>
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <878vbeabds.fsf@macbook.be.48ers.dk>
 <20121010122914.0685ae62@skate>
 <874nm2aa44.fsf@macbook.be.48ers.dk>
Message-ID: <20121010124644.55d52fff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 10 Oct 2012 12:34:51 +0200, Peter Korsgaard wrote:
> Most of them, but not all:
> 
> git grep https:// package/**/*.mk
> package/axel/axel.mk:AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
> package/freerdp/freerdp.mk:FREERDP_SITE = https://github.com/downloads/FreeRDP/F
> package/inadyn/inadyn.mk:INADYN_SITE = https://github.com/downloads/troglobit/in
> package/libevent/libevent.mk:LIBEVENT_SITE = https://github.com/downloads/libeve
> package/libnspr/libnspr.mk:LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.or
> package/libnss/libnss.mk:LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/s
> package/logrotate/logrotate.mk:LOGROTATE_SITE = https://fedorahosted.org/release
> package/multimedia/pulseaudio/pulseaudio.mk:# https://bugs.freedesktop.org/show_
> package/pcsc-lite/pcsc-lite.mk:PCSC_LITE_SITE = https://alioth.debian.org/frs/do
> package/python-nfc/python-nfc.mk:PYTHON_NFC_SITE = https://launchpad.net/nfcpy
> package/python-pygame/python-pygame.mk:PYTHON_PYGAME_SITE = https://bitbucket.or
> package/sconeserver/sconeserver.mk:     https://sconeserver.svn.sourceforge.net/
> package/vim/vim.mk:VIM_SITE = https://vim.googlecode.com/hg
> package/vsftpd/vsftpd.mk:VSFTPD_SITE = https://security.appspot.com/downloads
> 
> But yeah, I'll change the alioth downloads to http.

Ok. I am not a security expert, but I am not sure that downloading
those things from https:// gives any win over a http:// download. What
would be more interesting is to be able to verify the cryptographic
signature of those tarballs (or the signature of a hash of those
tarballs), to actually be able to verify that those tarballs have
really been emitted by whoever is supposed to emit those tarballs. But
that's another story, and there are probably many projects that don't
provide cryptographic signatures to verify the authenticity of
the tarballs.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
