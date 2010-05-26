From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 May 2010 20:33:08 +0200
Subject: [Buildroot] [git commit master] webkit: remove user visible
	rendering target selection
In-Reply-To: <20100526152252.484cd6a7@surf> (Thomas Petazzoni's message of
	"Wed, 26 May 2010 15:22:52 +0200")
References: <20100526122002.1355C1EB@busybox.osuosl.org>
	<20100526152252.484cd6a7@surf>
Message-ID: <878w76o6mz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 26 May 2010 14:14:39 +0200
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> +ifeq ($(BR2_PACKAGE_XORG7),y)
 >> +	WEBKIT_CONF_OPT += --with-target=x11
 >> +	WEBKIT_DEPENDENCIES += xserver_xorg-server
 >> endif

 Thomas> Technically speaking, I don't think any X11 client applications
 Thomas> requires the server. Instead, it probably requires xlib_libX11 and
 Thomas> maybe some other additional libraries.

True, but currently we have this client == server relationship in BR for
the X11 stuff.

 Thomas> But, I admit that this isn't handled properly in all packages, and as
 Thomas> soon as one wants a X11 application, one probably also want the X
 Thomas> server as well, in most situations.

Normally yes, but this is something we could (should?) cleanup long term
imho.

-- 
Bye, Peter Korsgaard
