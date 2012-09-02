From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Sep 2012 00:42:30 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on:
 libs/libglib-2.0.so: undefined reference to `qsort_r'
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120902004230.6DC8E994F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #10 from twobob <seetwobob@live.co.uk> 2012-09-02 00:42:29 UTC ---
(In reply to comment #9)
> In essence, this doesn't happen using the Buildroot installed Code Sourcery
> Toolchains.
> 
> For my use case I was attempting to utitlise a pre-installed chain.
> It was possibly too old a version.
> 
> Using the 2011 TC fixes this. So I will set it as a non issue and possibly add
> a note when I figure out the oldest CS TC that *will* build this without error.
> 
> (I run all this on a 3rd gen kindle, no really)
> Thanks for all your help.
> 
> If I find something *actually* useful to contribute I will.
> Regards.

Okay as promised.   

CCLD   libglib-2.0.la
  CCLD   gtester
./.libs/libglib-2.0.so: undefined reference to `qsort_r'

First exhibits in Toolchains older than 

rm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2

From here:

http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/

so perhaps a "min required version" might properly reflect that.

2008q3 onward all build as expected.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
