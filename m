From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 23 Oct 2008 15:30:45 +0200
Subject: [Buildroot] Busybox build fails with external toolchain
In-Reply-To: <87y70fd4ig.fsf@macbook.be.48ers.dk>
References: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
	<87y70fd4ig.fsf@macbook.be.48ers.dk>
Message-ID: <20081023133045.GA956@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 23, 2008 at 11:50:31AM +0200, Peter Korsgaard wrote:
>>>>>> "Michel" == Michel Benoit <michel.benoit@sepab.se> writes:
>
> Michel> Hi,
> Michel> I'm trying to use buildroot to build a rootfs with an external
> Michel> toolchain based on uclibc.
> Michel> I'm using buildroot svn revision 23768
> Michel> The toolchain is based on gcc 4.1.2.
>
>The external toolchain stuff is known to be kinda flaky - But maybe
>your problem is the ~ - Could you try with an absolute path to the
>external toolchain?

'~' != $HOME unless
Index: scripts/trylink
===================================================================
--- scripts/trylink	(revision 23755)
+++ scripts/trylink	(working copy)
@@ -41,9 +41,8 @@ try() {
     printf "%s\n" "$*" >>$EXE.out
     printf "%s\n" "==========" >>$EXE.out
     $debug && echo "Trying: $*"
-    "$@" >>$EXE.out 2>&1
-    exitcode=$?
-    return $exitcode
+    $@ >>$EXE.out 2>&1
+    return $?
 }
 
 check_cc() {
