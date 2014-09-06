From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:13:10 +0200
Subject: [Buildroot] [PATCH 1/2] ruby: don't try to use gmp on the host
In-Reply-To: <1410011967-16277-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 15:59:26 +0200")
References: <1410011967-16277-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnqso6cp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When building host-ruby, if gmp seems to be available (for example
 > when host-gmp is built as a dependency of building the toolchain),
 > Ruby tries to use it. Unfortunately, it fails to use it because there
 > is no static version of host-gmp that is built and installed.

 > Since we anyway don't care much about gmp support in host-ruby, simply
 > disable it.

 > This issue was introduced since the bump to Ruby 2.1.0, and this
 > commit fixes:

 >   http://autobuild.buildroot.org/results/e19/e197f20bd5ec4aae6d8692d67df4f539a9df33e2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
