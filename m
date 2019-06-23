From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:10:53 +0200
Subject: [Buildroot] [PATCH] package/dbus: security bump to version
 1.12.16
In-Reply-To: <20190612214030.12995-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 12 Jun 2019 23:40:30 +0200")
References: <20190612214030.12995-1-peter@korsgaard.com>
Message-ID: <87sgs09fdu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2019-12749: Do not attempt to carry out DBUS_COOKIE_SHA1
 >   authentication for identities that differ from the user running the
 >   DBusServer.  Previously, a local attacker could manipulate symbolic links
 >   in their own home directory to bypass authentication and connect to a
 >   DBusServer with elevated privileges.  The standard system and session
 >   dbus-daemons in their default configuration were immune to this attack
 >   because they did not allow DBUS_COOKIE_SHA1, but third-party users of
 >   DBusServer such as Upstart could be vulnerable.  Thanks to Joe Vennix of
 >   Apple Information Security.

 >   For details, see the advisory:
 >   https://www.openwall.com/lists/oss-security/2019/06/11/2

 > Also contains a number of other smaller fixes, including fixes for memory
 > leaks.  For details, see NEWS:

 > https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
