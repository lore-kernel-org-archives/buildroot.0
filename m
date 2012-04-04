From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Apr 2012 21:18:22 +0200
Subject: [Buildroot] udhcpc when link is up
In-Reply-To: <CALo-6+g53Ay8J7QNLhfys8Sc7C_U9hd_CQAWm2T1r0vt7KcMdw@mail.gmail.com>
 (Charles Krinke's message of "Wed, 4 Apr 2012 08:33:16 -0700")
References: <CALo-6+g53Ay8J7QNLhfys8Sc7C_U9hd_CQAWm2T1r0vt7KcMdw@mail.gmail.com>
Message-ID: <874nszuwzl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I have another noob question concerning dhcp this time.
 Charles> I observer with our MPC8323 system that if the system is booted with
 Charles> the network cable disconnected and after boot the cable is connected,
 Charles> I get the proper "Link is Up" message, but dhcp does not request a
 Charles> lease.

 Charles> If I run "udhcpc", the network is then setup properly, but I would
 Charles> like "Link is Up:" to trigger udhcpc. I do not see a script in
 Charles> /etc/udhcpc/default.script.

 Charles> Can someone point this "noob for the day" in an appropriate direction
 Charles> to understand how to cause "Link is Up" to properly obtain a lease,
 Charles> please?

Have a look at ifplugd (either the standalone version or the busybox
applet). It monitors the network interface and runs ifup on link.

-- 
Bye, Peter Korsgaard
