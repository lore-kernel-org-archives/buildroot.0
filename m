From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 18:03:44 +0100
Subject: [Buildroot] target not ping-able
In-Reply-To: <slrnkbqvei.uot.narkewoody@zuhnb712.local.com>
References: <slrnkbqvei.uot.narkewoody@zuhnb712.local.com>
Message-ID: <50BF7E70.4070203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/12 05:37, Woody Wu wrote:
> Hi, list
>
> My generated target system (kernel and rootfs) is not ping-able.  From
> the target I can ping outside, but hosts, even on the same ethernet
> subnetwork cannot ping my target.
>
> The kernel is 3.4.19 and I enabled network options and an Ethernet
> driver.  Is there anything I missed?

  This is unlikely to be buildroot-related...

  I would do a wireshark on the host to get more insight.  You can also build
a tcpdump for the target to verify if it even receives anything.  Also try with
a direct cable between host and target and static IP addresses, to rule out any
influence of the switch.  And one final thing I can think of is that there is
some netfilter rule that disallows ping replies.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
