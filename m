From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Wed, 16 May 2012 06:32:14 -0400
Subject: [Buildroot] Buildroot and linux-pam?
Message-ID: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It looks like linux-pam was never included in Buildroot, and there are
few packages* where use of pam was explicitly disabled.

I managed to compile it with Buildroot though [1] with a number of
hacks and workarounds. I tested it (at least pam_exec) with Qingy as a
login program.

If I provide a better quality patch, will linux-pam be accepted? If
yes, will there be any objections to (conditionally) enabling pam at
least in systemd?

I am interested in both for my buildroot-based project which needs an
authrntication facility. If for some reason linux-pam cannot be
accepted, I'll keep this stuff as part of my project outside the
buildroot tree.

Please let me know your opinion, or any suggestions how to improve the
Makefile (apart from obvious cleanups).

Thanks.

----------------------------
* $ egrep -lr '(without|disable)-pam' package/
package/netatalk/netatalk.mk
package/systemd/systemd.mk
package/sudo/sudo.mk

[1] http://pastebin.com/jUWfXCMY (this code has not been cleaned up)

-- 
Dmitry Golubovsky

Anywhere on the Web
