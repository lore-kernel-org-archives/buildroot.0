From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jan 2014 09:35:07 +0100
Subject: [Buildroot] [PATCH 36/36] xorg: Bump xserver_xorg-server
	version to 1.15.0
In-Reply-To: <BLU0-SMTP274ECCC6852389BF3D0A9DED9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:39:05 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP274ECCC6852389BF3D0A9DED9B50@phx.gbl>
Message-ID: <87r48kxk90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > - remove patches applied upstream
 > - add new dependency xproto_presentproto

Thanks, but it seems like xorg 1.15 needs a newer mesa version:

configure: error: Package requirements (glproto >= 1.4.17 gl >= 9.2.0) were not met:

Package dependency requirement 'gl >= 9.2.0' could not be satisfied.
Package 'gl' has version '7.10.3', required version is '>= 9.2.0'

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables GL_CFLAGS
and GL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: *** [/home/peko/source/buildroot/output/build/xserver_xorg-server-1.15.0/.stamp_configured] Error 1

So this is blocked until I've added Spensers' mesa bump series.

-- 
Bye, Peter Korsgaard
