From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Jul 2009 12:05:42 -0300
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <1247495564.20117.4.camel@sven>
References: <1247473258.4007.7.camel@sven>
	<1247476399.4007.13.camel@sven>	<87ljms981c.fsf@macbook.be.48ers.dk>
	<1247495564.20117.4.camel@sven>
Message-ID: <4A5B4D46.6010807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven Neumann wrote:

> I don't have a strong opinion on that. The DBus control interface adds
> about 24kB to the the wpa_supplicant binary size. People might have DBus
> enabled for some other reason and don't need this feature in
> wpa_supplicant. But then, perhaps it's just not worth the extra
> option...
> 
> 
> Sven

Being the one "guilty" of wpa_supplicant updates i don't have a strong
opinion on this either.
On one side wpa_supplicant has it's own way of controlling itself via
wpa_cli and thus somewhat negates the need for dbus bindings.
On the other side you may not want to fork to call wpa_cli and/or learn
the wpa_supplicant/cli controlling protocol (or other good reasons), and
if you already have dbus enabled those extra 24k probably won't hurt
that much in the global scheme of things - after all people who want to
save that last KB will probably steer away from dbus.
Regards.
