From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:51:44 +0100
Subject: [Buildroot] [PATCH] package/git: security bump to version 2.24.1
In-Reply-To: <20191211111836.25423-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 11 Dec 2019 12:18:36 +0100")
References: <20191211111836.25423-1-peter@korsgaard.com>
Message-ID: <87r20wxevz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > * CVE-2019-1348:
 >    The --export-marks option of git fast-import is exposed also via
 >    the in-stream command feature export-marks=... and it allows
 >    overwriting arbitrary paths.

 >  * CVE-2019-1349:
 >    When submodules are cloned recursively, under certain circumstances
 >    Git could be fooled into using the same Git directory twice. We now
 >    require the directory to be empty.

 >  * CVE-2019-1350:
 >    Incorrect quoting of command-line arguments allowed remote code
 >    execution during a recursive clone in conjunction with SSH URLs.

 >  * CVE-2019-1351:
 >    While the only permitted drive letters for physical drives on
 >    Windows are letters of the US-English alphabet, this restriction
 >    does not apply to virtual drives assigned via subst <letter>:
 >    <path>. Git mistook such paths for relative paths, allowing writing
 >    outside of the worktree while cloning.

 >  * CVE-2019-1352:
 >    Git was unaware of NTFS Alternate Data Streams, allowing files
 >    inside the .git/ directory to be overwritten during a clone.

 >  * CVE-2019-1353:
 >    When running Git in the Windows Subsystem for Linux (also known as
 >    "WSL") while accessing a working directory on a regular Windows
 >    drive, none of the NTFS protections were active.

 >  * CVE-2019-1354:
 >    Filenames on Linux/Unix can contain backslashes. On Windows,
 >    backslashes are directory separators. Git did not use to refuse to
 >    write out tracked files with such filenames.

 >  * CVE-2019-1387:
 >    Recursive clones are currently affected by a vulnerability that is
 >    caused by too-lax validation of submodule names, allowing very
 >    targeted attacks via remote code execution in recursive clones.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For 2019.11.x I have instead bumped to 2.22.2, and for 2019.02.x I have
instead bumped to 2.16.6, which both fix the same issues.

-- 
Bye, Peter Korsgaard
