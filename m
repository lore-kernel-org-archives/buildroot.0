From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Apr 2012 23:10:36 +0200
Subject: [Buildroot] udhcpc when link is up
In-Reply-To: <CALo-6+hDSUFR_awCnm6gHveYLPaQ_Y8HGCQTsJuoTdv8bVqzOw@mail.gmail.com>
 (Charles Krinke's message of "Thu, 5 Apr 2012 13:23:10 -0700")
References: <CALo-6+g53Ay8J7QNLhfys8Sc7C_U9hd_CQAWm2T1r0vt7KcMdw@mail.gmail.com>
 <874nszuwzl.fsf@macbook.be.48ers.dk>
 <CALo-6+hDSUFR_awCnm6gHveYLPaQ_Y8HGCQTsJuoTdv8bVqzOw@mail.gmail.com>
Message-ID: <87y5q9rik3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I guess my "noobness hat" must be worn a second day in that I look at
 Charles> ifplugd and dont quite see the issue. Admiteddly the "noobness hat" is
 Charles> worn because I spend most of my time in u-boot and the kernel, but
 Charles> that is only an excuse.

Have you read http://0pointer.de/lennart/projects/ifplugd/ ?

There isn't much to it. You have to remove the 'auto eth0' line from
/etc/network/interfaces so /etc/init.d/S40network doesn't try to run
udhcpc at bootup. With ifplugd running it will execute
/etc/ifplugd/ifplugd.action <iface> <up|down> whenever it detects a link
change. By default this script will simply call ifup <iface> / ifdown
<iface>.

-- 
Bye, Peter Korsgaard
