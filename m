From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:43:03 +0100
Subject: [Buildroot] [PATCH] htop: work-around old uClibc issue when
	static linking
In-Reply-To: <1488143524-11408-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 26 Feb 2017 22:12:04 +0100")
References: <1488143524-11408-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lgssljbs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > htop wants to use backtrace() support from the C
 > library. Unfortunately, with old uClibc versions such as the one we
 > use for the ARC architecture, the backtrace() implementation is in
 > libubacktrace. In addition, this implementation needs dladdr()
 > support, which is in libdl, not available when static linking.

 > Since this problem no longer exists in more recent versions of uClibc,
 > we simply special case the ARC+static linking case, and make the
 > configure script believe that <execinfo.h> is not available.

 > Fixes:

 >   http://autobuild.buildroot.net/results/cdea351fad7a0f61ddec3e6a141da8da0523a902/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
