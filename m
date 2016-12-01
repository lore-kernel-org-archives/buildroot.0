From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Dec 2016 18:02:12 +0000
Subject: [Buildroot] [Bug 9416] Running on 2016.11-rc1 second make fails
 "makedevs: line 23: Couldnt create node
 /buildroot-2016.11-rc1/output/target/dev/console: File exists"
In-Reply-To: <bug-9416-163@https.bugs.busybox.net/>
References: <bug-9416-163@https.bugs.busybox.net/>
Message-ID: <bug-9416-163-Zjjq5VeIVg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9416

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Is this with a clean tree? We have reworked the makedevs handling between rc1
and rc3 (and final 2016.11), so moving between rc1 and rc3 without doing a make
clean in between is bound to give problems.

Can you verify with a clean build on latest (E.G. 2016.11) if it still happens
for you? Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
