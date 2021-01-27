From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2021 21:42:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.5p2
In-Reply-To: <20210127142628.40494-1-christian@paral.in> (Christian Stewart's
 message of "Wed, 27 Jan 2021 06:26:28 -0800")
References: <20210127142628.40494-1-christian@paral.in>
Message-ID: <87pn1q5cxj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Major changes between sudo 1.9.5p2 and 1.9.5p1
 >  * Buildroot: dropped a patch that was included in the release.

 >  * Fixed sudo's setprogname(3) emulation on systems that don't
 >    provide it.

 >  * Fixed a problem with the sudoers log server client where a partial
 >    write to the server could result the sudo process consuming large
 >    amounts of CPU time due to a cycle in the buffer queue. Bug #954.

 >  * Added a missing dependency on libsudo_util in libsudo_eventlog.
 >    Fixes a link error when building sudo statically.

 >  * The user's KRB5CCNAME environment variable is now preserved when
 >    performing PAM authentication.  This fixes GSSAPI authentication
 >    when the user has a non-default ccache.

 >  * When invoked as sudoedit, the same set of command line options
 >    are now accepted as for "sudo -e".  The -H and -P options are
 >    now rejected for sudoedit and "sudo -e" which matches the sudo
 >    1.7 behavior.  This is part of the fix for CVE-2021-3156.

 >  * Fixed a potential buffer overflow when unescaping backslashes
 >    in the command's arguments.  Normally, sudo escapes special
 >    characters when running a command via a shell (sudo -s or sudo
 >    -i).  However, it was also possible to run sudoedit with the -s
 >    or -i flags in which case no escaping had actually been done,
 >    making a buffer overflow possible.  This fixes CVE-2021-3156.

 > https://www.sudo.ws/stable.html#1.9.5p2

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
