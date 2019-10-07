From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Oct 2019 16:38:49 +0000
Subject: [Buildroot] [Bug 12256] package tar is outdated (1.29 is 3 years
 old)
In-Reply-To: <bug-12256-163@https.bugs.busybox.net/>
References: <bug-12256-163@https.bugs.busybox.net/>
Message-ID: <bug-12256-163-jHSj0oz3Ks@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12256

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
We can't upgrade the version of tar without being cautious.

The host tar is used to create the archives in the VCS download backends
(git, cvs, svn, hg...) and tar 1.30 and forward have changed the wau they
generate the archives.

So, all the archives we had generated before 1.30 was released are not
bit-for-bit reproducible (even though the extracted content would be),
so the hashes we have for those archives would not match.

Hence we need to keep host-tar to 1.29.

For the target variant, this is less important of course, but so far
no one submitted a patch. It's also that we do not have many packages
for which the host and target versions are different.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
