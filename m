From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 23:38:37 +0200
Subject: [Buildroot] [PATCH] trinity: not available on musl
In-Reply-To: <1476721016-21596-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Mon, 17 Oct 2016 21:46:56 +0530")
References: <1476721016-21596-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <87bmyhfici.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > After fixing following build failures with musl:
 > * error: unknown type name __uint32_t and __uint64_t
 > * error: unknown type name pid_t and uid_t
 > * error: fatal error: bits/sockaddr.h: No such file or directory

 > it fails with

 >   fds/files.c: In function 'file_tree_callback':
 >   fds/files.c:172:10: error: 'FTW_CONTINUE' undeclared (first use in this function)
 >      return FTW_CONTINUE;
 >             ^
 >   fds/files.c:172:10: note: each undeclared identifier is reported only once for each function it appears in
 >   fds/files.c:178:10: error: 'FTW_SKIP_SUBTREE' undeclared (first use in this function)
 >      return FTW_SKIP_SUBTREE;
 >             ^
 >   fds/files.c:185:10: error: 'FTW_STOP' undeclared (first use in this function)
 >      return FTW_STOP;
 >             ^
 >   fds/files.c: In function 'open_fds_from_path':
 >   fds/files.c:197:26: error: 'FTW_ACTIONRETVAL' undeclared (first use in this function)
 >     int flags = FTW_DEPTH | FTW_ACTIONRETVAL | FTW_MOUNT;

 > As per ftw man-page, flag FTW_ACTIONRETVAL is specific to glibc. It is
 > not available on musl. Since package uses it unconditionally, we mark
 > it not available on musl.

 > Fixes:
 >   http://autobuild.buildroot.net/results/cb4/cb4a665746652679487dee2c2e4bca881be3724b/

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
