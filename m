From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 16:57:53 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/gdb: fixup version strings
In-Reply-To: <1315951050-19272-3-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Tue, 13 Sep 2011 23:57:30 +0200")
References: <1315951050-19272-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1315951050-19272-3-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87r52rpjta.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The gdb tarballs have been re-released after a GPL compliance
 Yann> issue was found:
 Yann>   http://sourceware.org/ml/gdb/2011-09/msg00030.html

 Yann> So all versions were re-packaged.

 Yann> In the process, an 'a' was appended to the version strings, and
 Yann> unlike the binutils people, the gdb folks are not inclined in
 Yann> providing legacy symlinks:
 Yann>   http://sourceware.org/ml/gdb/2011-09/msg00036.html


 Yann> So, this patch fixes the issue by renaming version strings. It is to be
 Yann> noted that, although the versions got bumped to include an 'a' at the end,
 Yann> the directory contained in the tarball is still named after the version
 Yann> string without the 'a'. For example:
 Yann>  - old version      : 6.6
 Yann>  - new version      : 6.6a
 Yann>  - tarball name     : gdb-6.6a.tar.bz2
 Yann>  - directory name   : gdb-6.6/

 Yann> In fact, it does not pose any problem for buildroot, as the extract process
 Yann> explicitly mkdirs the directory to extract into, *and* strips the first level
 Yann> of the tree extracted from the tarball.

Committed with minor changes to apply to head + I prefer to not change
the config symbols, only the tarball versions.

-- 
Bye, Peter Korsgaard
