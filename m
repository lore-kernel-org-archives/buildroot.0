From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 03 Feb 2016 20:10:55 +0000
Subject: [Buildroot] [Bug 8646] check-host-rpath script returns false
 positives when rpath contains symlink
In-Reply-To: <bug-8646-163@https.bugs.busybox.net/>
References: <bug-8646-163@https.bugs.busybox.net/>
Message-ID: <bug-8646-163-VBAn3x7lkx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8646

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> ---
(In reply to Aaron Bamberger from comment #0)

> The path that buildroot is checked out under on our build server contains a 
> symlink (it's checked out under /home, which is actually a symlink to
> /share/home).  After looking at the RUNPATH of the libraries that are 
> triggering the error, it appears that something in the build system is 
> canonicalizing the RUNPATH (it contains /share/home), while the hostdir that 
> the script is checking against has not been canonicalized (it just contains 
> /home).  Therefore, even though the paths are logically the same, the string 
> comparison of the paths in the script returns false.

Indeed, this is a known issue for which a patch fixing it globally in
Buildroot,
is pending in patchwork [1].

[1] http://patchwork.ozlabs.org/patch/576593/

Regards,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
