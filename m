From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 22:13:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgit2: security bump to
 version 0.28.4
In-Reply-To: <20191216115359.7762-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Mon, 16 Dec 2019 12:53:59 +0100")
References: <20191216115359.7762-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87h8202cuq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > Fixes the following CVE:
 > - CVE-2019-1351: Windows provides the ability to substitute
 >   drive letters with arbitrary letters, including multi-byte
 >   Unicode letters. To fix any potential issues arising from
 >   interpreting such paths as relative paths, we have extended
 >   detection of DOS drive prefixes to accomodate for such cases.

 > - CVE-2019-1352: by using NTFS-style alternative file streams for
 >   the ".git" directory, it is possible to overwrite parts of the
 >   repository. While this has been fixed in the past for Windows,
 >   the same vulnerability may also exist on other systems that
 >   write to NTFS filesystems. We now reject any paths starting
 >   with ".git:" on all systems.

 > - CVE-2019-1353: by using NTFS-style 8.3 short names, it was
 >   possible to write to the ".git" directory and thus overwrite
 >   parts of the repository, leading to possible remote code
 >   execution. While this problem was already fixed in the past for
 >   Windows, other systems accessing NTFS filesystems are
 >   vulnerable to this issue too. We now enable NTFS protecions by
 >   default on all systems to fix this attack vector.

 > - CVE-2019-1354: on Windows, backslashes are not a valid part of
 >   a filename but are instead interpreted as directory separators.
 >   As other platforms allowed to use such paths, it was possible
 >   to write such invalid entries into a Git repository and was
 >   thus an attack vector to write into the ".git" dierctory. We
 >   now reject any entries starting with ".git" on all systems.

 > libgit2 is not affected by these git CVE:

So in other words, this isn't really an issue as those are all
Windows-only issues?

But ok, it cannot hurt to bump the version.

Committed, thanks.

-- 
Bye, Peter Korsgaard
