From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 21:16:11 +0100
Subject: [Buildroot] [PATCH v2] package/gettext-tiny: fix install
 failure if path contains "m4/" string
In-Reply-To: <20200118220611.38913-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 18 Jan 2020 23:06:11 +0100")
References: <20200117202949.GL22540@scaer>
 <20200118220611.38913-1-giulio.benetti@benettiengineering.com>
Message-ID: <87ftema778.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > When building with path containing "m4/" occurence(i.e. make
 > O=output-m4) gettext-tiny install recipe copies files to wrong place and
 > later some package using autotools fail to autoreconf(i.e. minicom).
 > This is due to buggy gettext-tiny Makefile install recipe where they
 > substitute every "m4/" in INSTALL destination path, including the "m4/"
 > part of our build folder. Add patch to fix this by using $(patsubst ...)
 > instead of $(subst m4/,,$@) to substitute only last "m4/" occurence in
 > path.

 > Fixes:
 > https://bugs.busybox.net/show_bug.cgi?id=12481

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > Pending upstream:
 > https://github.com/sabotage-linux/gettext-tiny/pull/49

 > V1-> V2:
 > * used $(patsubst ...) instead of sed as suggested by Heiko and xhebox

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
