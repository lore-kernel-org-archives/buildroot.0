From: Steffen Schulz <pepe_ml@gmx.net>
Date: Fri, 6 Mar 2009 11:25:41 +0100
Subject: [Buildroot] iptables without IPV6
In-Reply-To: <c88e466f0903050920o60b62f7ft3f221960eb865ab@mail.gmail.com>
References: <c88e466f0903050920o60b62f7ft3f221960eb865ab@mail.gmail.com>
Message-ID: <20090306102541.GA23751@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090305 at 18:30, Michel Benoit wrote:
> Hej,
> 
> Has anyone been able to build iptables 1.4.1 when BR2_INET_IPV6 is not set?
> I'm performing a clean build of buildroot-2009.02 for an AT91SAM9260 target.
> 
> It worked fine with an older version of buildroot and iptables (1.3.8).

Attached patch adds a patch to current iptables package that adds the
switch. It simply prevents compilation of the ip6tables binaries.

Its automatically used when BR_INET_IPV6 is not set.

/steffen
-- 
       _----------------
 (o< ?-_    Less CO2    |  _o)                         +49/1781384223
 //\    | for more ice! |  /\\  .o) .o)       gpg --recv-key A04D7875
 V_/_    ---------------  _\_V _(\)_(\)   mailto: pepe@cbg.dyndns.org
-------------- next part --------------
A non-text attachment was scrubbed...
Name: iptables.patch
Type: text/x-diff
Size: 3468 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090306/7eb50985/attachment-0001.bin>
