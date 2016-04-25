From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 21:24:34 +0200
Subject: [Buildroot] [PATCH v1 4/4] ring-daemon: new package
In-Reply-To: <1541125393.275698.1461608322652.JavaMail.zimbra@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-5-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160423001924.38960007@free-electrons.com>
 <1541125393.275698.1461608322652.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20160425212434.10734123@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't do top-posting, it's inappropriate on open-source mailing
lists. Thanks!

On Mon, 25 Apr 2016 14:18:42 -0400 (EDT), Patrick Keroulas wrote:

> Concerning the D-Bus daemon, Ring relies on a session bus but D-Bus
> initscript starts a daemon for system bus only. I can change D-Bus
> initscript instead of starting it from our Ring initscript. In this
> case, in which package should I add the patch? ring-daemon or dbus? 

I *think* it should be handled in the DBus package itself, though I am
not entirely sure. As I understand it, a "session bus" is typically
associated to one particular user when this user logs into the system,
right? How does that work for ring? Does it use a session bus running
as the "ring" user? Aren't session buses normally used for "real" users?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
