From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2015 16:01:34 +0000 (UTC)
Subject: [Buildroot] [Bug 7956] glibc 2.20 and 2.21 fail to build for
 sh64-buildroot-linux-gnu
In-Reply-To: <bug-7956-163@https.bugs.busybox.net/>
References: <bug-7956-163@https.bugs.busybox.net/>
Message-ID: <20150409160134.9C63781979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7956

--- Comment #2 from Uwe Hermann <uwe@hermann-uwe.de> 2015-04-09 16:01:34 UTC ---
Well, I don't need it personally (at the moment), but we're trying to
cross-compile our software (sigrok, open-source test&measurement project, see
www.sigrok.org) for as many platforms as possible in order to catch any
portability issues. We're using buildroot-built toolchains and sysroots for
that since it's quite convenient.

See e.g.
http://sigrok.org/jenkins/job/libserialport/
http://sigrok.org/jenkins/job/libsigrok/

I don't know if we currently have users for sh64 or not, but that should not be
relevant for this issue really.

I guess the question is whether mainline glibc supports sh64 at all or not. The
text "configure: error: The sh64 is not supported." suggests the latter. But I
didn't check whether that's actually true or an incorrect error is emitted
(and/or whether sh64 support is planned to be added to glibc).

Note: I haven't tried the eglibc option for sh64 in buildroot, maybe that one
does have support (?)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
