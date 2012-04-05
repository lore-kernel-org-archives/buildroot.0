From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 5 Apr 2012 13:23:10 -0700
Subject: [Buildroot] udhcpc when link is up
In-Reply-To: <874nszuwzl.fsf@macbook.be.48ers.dk>
References: <CALo-6+g53Ay8J7QNLhfys8Sc7C_U9hd_CQAWm2T1r0vt7KcMdw@mail.gmail.com>
 <874nszuwzl.fsf@macbook.be.48ers.dk>
Message-ID: <CALo-6+hDSUFR_awCnm6gHveYLPaQ_Y8HGCQTsJuoTdv8bVqzOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I guess my "noobness hat" must be worn a second day in that I look at
ifplugd and dont quite see the issue. Admiteddly the "noobness hat" is
worn because I spend most of my time in u-boot and the kernel, but
that is only an excuse.

From the target:
# ifplugd -h //runs, displays help, leads me to /etc/ifplugd/ifplugd.conf
# cat /etc/ifplugd/ifplugd.conf
 ARGS="-fI -u0 -d10"
 INTERFACES="eth0"

If eth0 is plugged in when the system is started with
/etc/network/interfaces specifying "dhcp", I see the "sending
discover" and get a ipAddress, netmask, gateway and DNS.

If eth0 is "not" plugged in when the system is started and I plug in
the cable after the system gets to a bash prompt, I can see the "Link
is up" message, but, no "sending discover" and hence the eth0
interface is not configured.

I can trigger dhcp with
# udhcpc
and everything works fine, but somehow, ifplugd (or something else) is
not able to key off the "Link is Up" and get me to the next stage.

So, I am asking for a bit more advice, up to and including
"http://ifplugdForDummies.biz" or "http://ReadThisManualDummy.uggh"

Charles Krinke

On Wed, Apr 4, 2012 at 12:18 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
> ?Charles> I have another noob question concerning dhcp this time.
> ?Charles> I observer with our MPC8323 system that if the system is booted with
> ?Charles> the network cable disconnected and after boot the cable is connected,
> ?Charles> I get the proper "Link is Up" message, but dhcp does not request a
> ?Charles> lease.
>
> ?Charles> If I run "udhcpc", the network is then setup properly, but I would
> ?Charles> like "Link is Up:" to trigger udhcpc. I do not see a script in
> ?Charles> /etc/udhcpc/default.script.
>
> ?Charles> Can someone point this "noob for the day" in an appropriate direction
> ?Charles> to understand how to cause "Link is Up" to properly obtain a lease,
> ?Charles> please?
>
> Have a look at ifplugd (either the standalone version or the busybox
> applet). It monitors the network interface and runs ifup on link.
>
> --
> Bye, Peter Korsgaard



-- 
Charles Krinke
