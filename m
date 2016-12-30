From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 10:31:03 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-LuJFGyJW0n@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #12 from bilge at scriptfusion.com ---
I tend to agree that sed in post-build is better, because although the patch
works, it applies to both the host and the target when we only want it to apply
to the target. There isn't a problem with it being applied to the host until it
tries to build NPM modules, in which case it dies horribly!

Regarding Busybox and Coreutils, I tried to build both but each failed in their
own spectacular way. Right now the post-build script still seems easier.
However, I noticed Busybox permits a configuration so perhaps it is possible to
just build the `env` utility by itself?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
