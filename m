From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:32:00 +0100
Subject: [Buildroot] [PATCHv2] package/ncurses: add upstream (security)
 patches up to 20200118
In-Reply-To: <20200205133111.24540-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 5 Feb 2020 14:31:10 +0100")
References: <20200205133111.24540-1-patrickdepinguin@gmail.com>
Message-ID: <87h7yvoq0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Peter Korsgaard <peter@korsgaard.com>
 > Fixes the following security issues:

 > - CVE-2018-10754: In ncurses before 6.1.20180414, there is a NULL Pointer
 >   Dereference in the _nc_parse_entry function of tinfo/parse_entry.c.  It
 >   could lead to a remote denial of service if the terminfo library code is
 >   used to process untrusted terminfo data in which a use-name is invalid
 >   syntax (REJECTED).

 > - CVE-2018-19211: In ncurses 6.1, there is a NULL pointer dereference at
 >   function _nc_parse_entry in parse_entry.c that will lead to a denial of
 >   service attack.  The product proceeds to the dereference code path even
 >   after a "dubious character `*' in name or alias field" detection.

 > - CVE-2018-19217: In ncurses, possibly a 6.x version, there is a NULL
 >   pointer dereference at the function _nc_name_match that will lead to a
 >   denial of service attack.  NOTE: the original report stated version 6.1,
 >   but the issue did not reproduce for that version according to the
 >   maintainer or a reliable third-party.

 > - CVE-2019-17594: There is a heap-based buffer over-read in the
 >   _nc_find_entry function in tinfo/comp_hash.c in the terminfo library in
 >   ncurses before 6.1-20191012.

 > - CVE-2019-17595: There is a heap-based buffer over-read in the fmt_entry
 >   function in tinfo/comp_hash.c in the terminfo library in ncurses before
 >   6.1-20191012.

 > Ncurses upstream uses a fairly special way of releasing (security) bugfixes.
 > Approximately once a week an incremental .patch.gz is released, and once in
 > a while these incremental patches are bundled up to a bigger patch relative
 > to the current release in .patch.sh.bz2 format (a bzip2 compressed patch
 > with a small shell script prepended, luckily apply-patches can handle that),
 > and the relative patch files deleted.

 > For details of this process, see the upstream FAQ:
 > https://invisible-island.net/ncurses/ncurses.faq.html#applying_patches

 > Apply the latest .patch.sh.bz2 and incremental patches up to 20200118 to fix
 > a number of (security) issues.  Notice that these patch files are NOT
 > available on the GNU mirrors.

 > While we are at it, adjust the white space in the .hash file to match
 > sha256sum output for consistency.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [fix whitespace inconsistency after 'sha256' keyword]
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
