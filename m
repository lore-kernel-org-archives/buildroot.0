From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 08:39:00 +0200
Subject: [Buildroot] [git commit] glibc: split hash files for licenses,
 fixes ARC
In-Reply-To: <20181010132409.D359F8257F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 10 Oct 2018 15:24:03 +0200")
References: <20181010132409.D359F8257F@busybox.osuosl.org>
Message-ID: <87murlrnqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b14ad0bd697038e4cf48ecf48830fb3369f1f25e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Configuration that build a glibc toolchain on ARC currently fail to
 > run "make legal-info", because the hash for the LICENSES file is
 > different between the ARC glibc version, and glibc 2.28.

 > To fix this, this commit moves the hashes for the glibc license files
 > to per-version hash files.

 > Fixes:

 >   http://autobuild.buildroot.net/results/5a98a801dccaaeb4b5cbc26d9a017726d0953157/

Thanks for fixing this!

I actually also created a patch for it last week, but it apparently
never made it to the list because of the mail issues I had:

commit 8df01cc7fcf527853c6cc598d56bf42d192695bf
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Oct 5 12:36:57 2018 +0200

    glibc: fix LICENSE hash for arc variant

    Fixes:
    http://autobuild.buildroot.net/results/0d4/0d40c4e33830dc9949169aacf039e06bc166a201/
    http://autobuild.buildroot.net/results/28a/28abbbdc7984a5d9cd27490950d65a752873a0d0/
    ..

    Commit 37492e8b2d8 (glibc: fix hash for LICENSE) updated the hash for the
    LICENSE file to match the 2.28 release, but this breaks legal info for the
    arc variant which contains the old content of the LICENSE file.

    Fix it by adding .hash files for each version separately, similary to how we
    E.G. do it for qt5.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

But no problem, the important thing is that it is fixed now ;)

-- 
Bye, Peter Korsgaard
