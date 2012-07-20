From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jul 2012 10:57:25 +0200
Subject: [Buildroot] [PATCH] avahi: only install
	default.script/S05avahi-setup.sh if not present in fs skeleton
In-Reply-To: <20120720100219.0317a30e@skate> (Thomas Petazzoni's message of
 "Fri, 20 Jul 2012 10:02:19 +0200")
References: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
 <20120717234535.6ae0b109@skate>
 <CANxTyt4p2hR7StT27=SXN40KcYY4L-oBVfZ5V=dOYKLuY7GTfw@mail.gmail.com>
 <20120720100219.0317a30e@skate>
Message-ID: <87r4s6u7wq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Thu, 19 Jul 2012 21:53:45 -0400,
 Thomas> Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

 >> > If avahi is built before
 >> > Busybox, then you'll have the Avahi script. If Busybox is built before
 >> > Avahi, then you'll have the Busybox script. This doesn't look correct.
 >> 
 >> Would it be appropriate to add something like this to busybox.mk, so that
 >> Avahi always gets built first?
 >> 
 >> ifeq ($(BR2_PACKAGE_AVAHI),y)
 >> # Compile Avahi first, to ensure proper preference of conditional
 >> udhcpc/default.script installations
 >> BUSYBOX_DEPENDENCIES += avahi
 >> endif

 Thomas> Well, I think the whole idea of testing whether a configuration file has
 Thomas> already been copied or not to the target filesystem to avoid
 Thomas> overwriting files from the skeleton is not nice (I think using the
 Thomas> post-build script to overwrite configuration files is a much better
 Thomas> idea), but I know Peter wants this to work.

I don't really feel that strongly about it.

 Thomas> The parts around avahi-autoipd are obviously here for a reason,
 Thomas> but why does it need to test for ip= and nfsroot= in the kernel
 Thomas> command line in Avahi case and not in Busybox case?

 Thomas> One possibility would be to simply put the Avahi variant of the
 Thomas> script into the Busybox package. When Avahi is not installed,
 Thomas> the avahi-autoipd tests would simply ensure that the script
 Thomas> does not try to use Avahi.

That was my thought exactly. I had a quick look at it just before I got
ill, but then forgot about it.

-- 
Bye, Peter Korsgaard
