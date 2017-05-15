From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:07:50 +0200
Subject: [Buildroot] [PATCH] package/gpsd: do not interact with systemd
	on install
In-Reply-To: <20170513082736.22734-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 13 May 2017 10:27:36 +0200")
References: <20170513082736.22734-1-yann.morin.1998@free.fr>
Message-ID: <87fug6iaqx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When building on a systemd-based host for a systemd-based target, gpsd's
 > buildsystem will try to tell systemd to reload the its configuration and
 > recreate the entire dependency tree of services.

 > Of course, this can not work when run as a user:
 >>>> gpsd 3.16 Installing to target
 >     ==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
 >     Authentication is required to reload the systemd state.
 >     Authenticating as: root
 >     Password:

 > In fact, this does not even mean anything in cross-compilation.

 > Fortunately, upstream has already fixed their sin, so we backport it
 > (tweaked to apply onto 3.16).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > ---
 > Note: this was never observed in any of the autobuilders, even those
 > running on a systemd-based distro, because in this case stdin is
 > redirected and systemctl simply fails, but the construct is just to
 > ignore the failure, so the build proceeds; the issue only occurs when
 > there is an actual terminal to provide user input... :-/

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
