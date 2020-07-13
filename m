From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 08:39:15 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/iwd: needs dbus (runtime)
In-Reply-To: <20200612232433.18442-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 13 Jun 2020 01:24:31 +0200")
References: <20200612232433.18442-1-ps.report@gmx.net>
Message-ID: <87eepfly0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes (on startup):
 >   $ usr/libexec/iwd
 >   Wireless daemon version 1.7
 >   Failed to initialize D-Bus

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

1.6 also contains the D-Bus logic in src/main.c:

        dbus = l_dbus_new_default(L_DBUS_SYSTEM_BUS);
        if (!dbus) {
                l_error("Failed to initialize D-Bus");
                goto fail_dbus;
        }

So committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
