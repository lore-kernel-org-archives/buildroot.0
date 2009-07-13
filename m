From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jul 2009 20:26:30 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <4A5B4D46.6010807@zacarias.com.ar> (Gustavo Zacarias's message of
	"Mon\, 13 Jul 2009 12\:05\:42 -0300")
References: <1247473258.4007.7.camel@sven> <1247476399.4007.13.camel@sven>
	<87ljms981c.fsf@macbook.be.48ers.dk> <1247495564.20117.4.camel@sven>
	<4A5B4D46.6010807@zacarias.com.ar>
Message-ID: <87k52c1lt5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Being the one "guilty" of wpa_supplicant updates i don't
 Gustavo> have a strong opinion on this either.  On one side
 Gustavo> wpa_supplicant has it's own way of controlling itself via
 Gustavo> wpa_cli and thus somewhat negates the need for dbus
 Gustavo> bindings.  On the other side you may not want to fork to
 Gustavo> call wpa_cli and/or learn the wpa_supplicant/cli controlling
 Gustavo> protocol (or other good reasons), and if you already have
 Gustavo> dbus enabled those extra 24k probably won't hurt that much
 Gustavo> in the global scheme of things - after all people who want
 Gustavo> to save that last KB will probably steer away from dbus.

Indeed. For big dependencies like dbus (or openssl), then I would
prefer BR to just do the right thing (tm) instead of adding very
detailed configuration options for things that only increase the size
with a few %.

In the case of dbus, the minimal configuration (including
dependencies) is around ~1MB, so I don't think it's worthwhile
discussing about 24kb overhead.

-- 
Bye, Peter Korsgaard
