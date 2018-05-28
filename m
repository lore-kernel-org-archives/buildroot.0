From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 20:23:25 +0200
Subject: [Buildroot] [PATCH v2] poppler: link with libatomic when needed
In-Reply-To: <20180528181953.GA23287@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 28 May 2018 20:19:53 +0200")
References: <20180528181953.GA23287@waldemar-brodkorb.de>
Message-ID: <871sdvwsf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Following errors might occur on architectures required to use gcc libatomics:
 > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

 > This is often the case for sparcv8 32 bit toolchains.

 > See 55a9d6d55888b04ec6c476399e5b98a2412995f5 and 03f6e005e6a9617767b24a9026da9477848020cc.

 > Fixes:
 >   http://autobuild.buildroot.net/results/64a96663a48ab644bc03c9a3ec2d6a644119dee6
 >   http://autobuild.buildroot.net/results/82e85e12478fc1972b70ad728ed7c1554920c9e3

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  v1 -> v2:
 >    - more verbose commit message
 >    - move code to generic section
 >    - use LDFLAGS instead of CXXFLAGS, LIBS are ignored.

Committed, thanks.

-- 
Bye, Peter Korsgaard
