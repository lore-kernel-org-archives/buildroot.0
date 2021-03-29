From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 21:53:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 8.5p1
In-Reply-To: <20210322190034.1151555-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Mar 2021 20:00:34 +0100")
References: <20210322190034.1151555-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1jxeny4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 >  * ssh-agent(1): fixed a double-free memory corruption that was
 >    introduced in OpenSSH 8.2 . We treat all such memory faults as
 >    potentially exploitable. This bug could be reached by an attacker
 >    with access to the agent socket.

 >    On modern operating systems where the OS can provide information
 >    about the user identity connected to a socket, OpenSSH ssh-agent
 >    and sshd limit agent socket access only to the originating user
 >    and root. Additional mitigation may be afforded by the system's
 >    malloc(3)/free(3) implementation, if it detects double-free
 >    conditions.

 >    The most likely scenario for exploitation is a user forwarding an
 >    agent either to an account shared with a malicious user or to a
 >    host with an attacker holding root access.

 >  * Portable sshd(8): Prevent excessively long username going to PAM.
 >    This is a mitigation for a buffer overflow in Solaris' PAM username
 >    handling (CVE-2020-14871), and is only enabled for Sun-derived PAM
 >    implementations.  This is not a problem in sshd itself, it only
 >    prevents sshd from being used as a vector to attack Solaris' PAM.
 >    It does not prevent the bug in PAM from being exploited via some
 >    other PAM application. GHPR#212

 > Also license has been updated to add some openbsd-compat licenses:
 > https://github.com/openssh/openssh-portable/commit/922cfac5ed5ead9f796f7d39f012dd653dc5c173

 > https://www.openssh.com/txt/release-8.5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
