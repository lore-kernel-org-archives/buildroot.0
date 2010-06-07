From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 20:26:53 +0000 (UTC)
Subject: [Buildroot] [Bug 1927] Bump file to 5.03 and migrate to autotargets
In-Reply-To: <bug-1927-163@https.bugs.busybox.net/>
References: <bug-1927-163@https.bugs.busybox.net/>
Message-ID: <20100607202653.5BF378D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1927

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, but it doesn't work here:

make[3]: Entering directory
`/home/peko/source/buildroot/output/build/file-5.03/magic'
file -C -m ../magic/Magdir
../magic/Magdir/animation, 32: Warning: string extension `B' invalid
../magic/Magdir/animation, 33: Warning: Current entry already has a MIME type
`application/x-quicktime-player', new type `    image/jp2'
../magic/Magdir/animation, 44: Warning: string extension `B' invalid
../magic/Magdir/animation, 55: Warning: string extension `B' invalid
../magic/Magdir/animation, 57: Warning: string extension `B' invalid
../magic/Magdir/animation, 59: Warning: string extension `B' invalid
../magic/Magdir/animation, 60: Warning: string extension `B' invalid
../magic/Magdir/animation, 61: Warning: string extension `B' invalid
../magic/Magdir/inform, 8: Warning: string extension `B' invalid
../magic/Magdir/msdos, 9: Warning: string extension `B' invalid
../magic/Magdir/msdos, 11: Warning: string extension `B' invalid
../magic/Magdir/msdos, 13: Warning: string extension `B' invalid
../magic/Magdir/msdos, 15: Warning: string extension `B' invalid
../magic/Magdir/perl, 36: Warning: string extension `B' invalid
../magic/Magdir/perl, 37: Warning: string extension `B' invalid
../magic/Magdir/perl, 38: Warning: string extension `B' invalid
../magic/Magdir/perl, 39: Warning: string extension `B' invalid
../magic/Magdir/perl, 40: Warning: string extension `B' invalid
../magic/Magdir/perl, 41: Warning: string extension `B' invalid
../magic/Magdir/sgml, 22: Warning: string extension `B' invalid
../magic/Magdir/sgml, 23: Warning: Current entry already has a MIME type
`application/xml-sitemap', new type `    text/html'
file: could not find any magic files!
make[3]: *** [magic.mgc] Error 1

It send up using file from my host, which apparently doesn't work - It seems
like we need to build file for the host as well first? Looking at
magic/Makefile.am I already see some cross compile support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
