From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 09 Apr 2019 10:51:09 +1000
Subject: [Buildroot] [PATCH v4] busybox: Update udhcpc.script for
 stateful DHCPv6
In-Reply-To: <20190407160622.626d95b1@windsurf>
References: <20180726013919.31268-1-sam@mendozajonas.com>
 <20190407160622.626d95b1@windsurf>
Message-ID: <c0940024be14acaaae57009820499034de63c07c.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-04-07 at 16:06 +0200, Thomas Petazzoni wrote:
> Hello Samuel,
> 
> On Thu, 26 Jul 2018 11:39:19 +1000
> Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
> 
> > udhcpc6 will call the default script with the address set in the "ipv6"
> > variable. Set "ip" to this address if present.
> > 
> > udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
> > and other configuration information. A major difference between DHCPv4
> > and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
> > determined by normal IPv6 autoconfiguration.
> > Included is a change from Rob, which if handling a DHCPv6 address waits
> > a moment for the IPv6 route to be configured; as above this doesn't come
> > from DHCPv6 but rather the IPv6 Router Advertisement (RA) which happens
> > independently from udhcpc6. The intent here is to try and ensure that
> > the interface is route-able upon the script's completion as it would be
> > if called from udhcpc.
> > 
> > (wait for IPv6 route)
> > From: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > v4: Expand description of stateful DHCPv6 in commit message
> > v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
> > v2: Avoid bashisms
> 
> On February 26, 2019, you received some comments on this patch (yes it
> took a lot of time for someone to review the patch, but it finally
> happened). Could you take into account those comments and post an
> updated version ?
> 
> Thanks a lot!
> 
> Thomas

Hi Thomas,

So I did! This got lost in my inbox as well, I'll follow this up shortly.

Thanks,
Sam
