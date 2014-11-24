From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Nov 2014 20:56:52 +0100
Subject: [Buildroot] buildroot does not copy the C++ headers to sysroot
In-Reply-To: <349401945.53923382.1416848572340.JavaMail.root@telenet.be> (bart
 thoelen's message of "Mon, 24 Nov 2014 18:02:52 +0100 (CET)")
References: <1600692898.53530555.1416834863233.JavaMail.root@telenet.be>
 <87oarwu2y3.fsf@dell.be.48ers.dk>
 <1376091194.53675670.1416840204279.JavaMail.root@telenet.be>
 <87k32ktzi7.fsf@dell.be.48ers.dk>
 <349401945.53923382.1416848572340.JavaMail.root@telenet.be>
Message-ID: <87bnnwtlrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bart" == bart thoelen <bart.thoelen@telenet.be> writes:

 > Hi,
 > I found the problem.  It was using the -I(includedir) in the Makefile.am of the projects.
 > This was causing the Makefile to get the headers from /usr/include.

 > The hint "look at config.log" did wonders to me ;).  Thanks.  

Great, good to hear.

 >>>> nmcmdserver_CPPFLAGS = -I$(includedir) -Wall -O3 -Werror -DNMSERVER_BUILD=$(SVN_REVISION)

 > I did this to let the Make automatically look for headers in the
 > install directory (looked convenient to use libraries that way).

 > Now it puzzles me why this works in our custom make-file/batch-file build system.

Perhaps you don't pass a custom --prefix or --includedir? Target
packages in Buildroot are built with --prefix=/usr (and includedir
defaults to $prefix/include), E.G. the path that it will use on the
target, not a path on your build host. This is done as the prefix (and
derived variables like includedir) is used at runtime for some packages
(to find plugins, executables and so on).

 > Anyway, Case closed.

 > many thanks.

You're welcome.

-- 
Bye, Peter Korsgaard 
