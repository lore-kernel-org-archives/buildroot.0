From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 23:37:53 +0100
Subject: [Buildroot] [PATCH] log4cxx: fix build issue with gcc6+ on
	architectures with signed char
In-Reply-To: <20170130222620.12533-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Jan 2017 23:26:20 +0100")
References: <20170130222620.12533-1-peter@korsgaard.com>
Message-ID: <87fujyrh32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/029/02946a75f478b1304896e7a0794bb6aa527e45c0/
 > http://autobuild.buildroot.net/results/14b/14b9cab834540a01c9c838ea579dc73e383f754a/
 > http://autobuild.buildroot.net/results/de8/de8f2b132084a10fbe8efb38c7b31adca4562852/

 > The source code contains a number of character constants > 127, which causes
 > build errors with gcc6+ on architectures where char is signed:

 > locationinfo.cpp:163:21: error: narrowing conversion of '237' from 'int' to 'char' inside { } [-Wnarrowing]

 > Fix it by adding an upstream patch adding explicit static_cast around these.
 > Also add a local patch to fix the test suite as this is not fixed upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
