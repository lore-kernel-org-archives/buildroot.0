From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:03:50 +0100
Subject: [Buildroot] [PATCH] clamav: break configure breakage after zlib
	1.2.10 version bump
In-Reply-To: <20170104152734.29384-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Jan 2017 16:27:34 +0100")
References: <20170104152734.29384-1-peter@korsgaard.com>
Message-ID: <87a8b63j89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/b6b/b6ba2dfb42ee41ed0b8304aa8c78645245f3b341/
 > http://autobuild.buildroot.net/results/eef/eef9a2dda2c172cd600dc74c1e5e60476d92280d/
 > http://autobuild.buildroot.net/results/827/82798118795aa6334b4dd6eac06777682131da7f/

 > The clamav configure script by default checks for old zlib versions with
 > known vulnerabilities and errors out if found:

 > configure: error: The installed zlib version may contain a security bug.
 > Please upgrade to 1.2.2 or later: http://www.zlib.net.  You can omit this
 > check with --disable-zlib-vcheck but DO NOT REPORT any stability issues
 > then!

 > The check is unfortunately not very robust as it simply checks for a version
 > string matching '1.2.1' (which 1.2.10 does):

 > vuln=`grep "ZLIB_VERSION \"1.2.1" $ZLIB_HOME/include/zlib.h`

 > As a workaround, pass --disable-zlib-vcheck to skip this check.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed after fixing subject, thanks.

-- 
Bye, Peter Korsgaard
