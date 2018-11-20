From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 08:18:17 +0100
Subject: [Buildroot] [PATCH v3 3/3] make: configure host-make with host-
 prefix
In-Reply-To: <20181119162515.20360-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Nov 2018 17:25:15 +0100")
References: <20181119162515.20360-1-peter@korsgaard.com>
 <20181119162515.20360-3-peter@korsgaard.com>
Message-ID: <87lg5op686.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/e29/e293aadc692d2ed337881ef2172ddf66a60bc05c/

 > And many more.

 > Install as 'host-make' rather than just 'make', as that otherwise confuses a
 > number of packages when they invoke recursive / sub-make.  The internal job
 > control logic of GNU make is version dependant, so mixing versions may lead
 > to issues like:

 > make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21'
 > (cd src && make -w --jobserver-fds=5,6 -j)
 > make: unrecognized option '--jobserver-fds=5,6'

 > With this rename, only packages explicitly opting in for our host-make
 > (using the BR2_MAKE / BR2_MAKE_HOST_DEPENDENCY logic) will use it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > v3: use --program-prefix instead of renaming post-install as suggested by Yann.
 > v2: No changes

Committed, thanks.

-- 
Bye, Peter Korsgaard
