From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:57:53 +0200
Subject: [Buildroot] [PATCH] package/python-pymodbus: drop asyncio files
 for python 2.x to fix pycompile issue
In-Reply-To: <20201011090930.24271-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 11 Oct 2020 11:09:30 +0200")
References: <20201011090930.24271-1-peter@korsgaard.com>
Message-ID: <87h7qzstwu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Pymodbus has optional support for asyncio.  Pycompile unfortunately errors
 > out on these files when running under Python 2.x:

 > ../scripts/pycompile.py ..
 > error:   File "/usr/lib/python2.7/site-packages/pymodbus/client/asynchronous/asyncio/__init__.py", line 257
 >     yield from self._connect()
 >              ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable files from TARGET_DIR if building
 > for python 2.x.

 > Fixes:
 > http://autobuild.buildroot.net/results/cc4/cc48927cbe9ae6c2d8b12d65467ec40df82febf6/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
