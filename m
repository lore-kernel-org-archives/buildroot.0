From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 11:38:20 +0200
Subject: [Buildroot] [PATCH 1/1] sysvinit: update the inittab to support
	"single" from the kernel
In-Reply-To: <67E90783-9B37-464B-8F1A-42EA80AE0A1B@exablox.com> (Charles
 Hardin's message of "Wed, 11 May 2016 09:24:39 -0700")
References: <1462471997-98580-1-git-send-email-ckhardin@exablox.com>
 <67E90783-9B37-464B-8F1A-42EA80AE0A1B@exablox.com>
Message-ID: <8737p56twz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Hardin <ckhardin@exablox.com> writes:

Hi,

 > Following up on this patch - any feedback or problems with this going in?
 > It is pretty useful to have ?single? passed to the kernel bootargs to work when
 > trying to repair a system during development.

Sorry for the slow reponse - Committed to next, thanks.

 >> On May 5, 2016, at 11:13 AM, Charles Hardin <ckhardin@exablox.com> wrote:
 >> 
 >> When the kernel passes single in the command line, this translates
 >> into an init -s option that is suppose to drop into a shell after
 >> the sysinit and before the runlevel.
 >> 
 >> So, in busybox this is hardcoded - but, in sysvinit using the
 >> sysinit action for the rcS means that it will always be executed
 >> even when trying to get into single user mode for repair.
 >> 
 >> This change should run rcS in all of the expected runlevels
 >> 1-5 and should achieve the desired result compared to the busybox
 >> and still allow a single user shell to get started as expected
 >> before running rcS.
 >> 
 >> Signed-off-by: Charles Hardin <ckhardin@exablox.com>
 >> ---
 >> package/sysvinit/inittab | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
 >> index 27eb4a6..fad91ea 100644
 >> --- a/package/sysvinit/inittab
 >> +++ b/package/sysvinit/inittab
 >> @@ -10,7 +10,7 @@ si2::sysinit:/bin/mkdir -p /dev/pts
 >> si3::sysinit:/bin/mkdir -p /dev/shm
 >> si4::sysinit:/bin/mount -a
 >> si5::sysinit:/bin/hostname -F /etc/hostname
 >> -si6::sysinit:/etc/init.d/rcS
 >> +rcS:12345:wait:/etc/init.d/rcS
 >> 
 >> # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 >> 
 >> -- 
 >> 2.7.4 (Apple Git-66)
 >> 

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
