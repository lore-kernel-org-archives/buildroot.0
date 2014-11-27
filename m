From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Fri, 28 Nov 2014 00:20:46 +0530
Subject: [Buildroot] ping and nslookup doesn't work on device
In-Reply-To: <20141127194237.1611ee6b@free-electrons.com>
References: <CAJO1S93csWgVZsGX_Qj5HOCgnphzS1R2A_Oaj-RVbmRohkNH7A@mail.gmail.com>
 <20141126220110.15e1b74e@free-electrons.com>
 <CAJO1S93o=EXpZEAp71FeQXsKFwTshPdBfa1E4e-fopakib1ZLA@mail.gmail.com>
 <20141127194237.1611ee6b@free-electrons.com>
Message-ID: <CAJO1S93W0On2KPRDe+e0Q0Zq5q0amCEwEnP15o16xsn3v=zEJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas, I have solved the issue by adding iproute2 package to my
buildroot. This gives "tc" and "ip" binary. We have used avahi package
which was using "ip" binary from iproute2 package.

Thanks,
Kantanu
On 28-Nov-2014 12:13 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Kantanu Kumar Mohapatra,
>
> On Thu, 27 Nov 2014 12:59:12 +0530, Kantanu Kumar Mohapatra wrote:
>
> > This is resolv.conf in my device.
> >
> > # cat /etc/resolv.conf
> > ; DNS configuration
> > search private_domain
> > nameserver 223.1.4.3
> > nameserver 8.8.8.8
> > #
> > # ping 223.1.4.3
> > PING 223.1.4.3 (223.1.4.3): 56 data bytes
> > ping: sendto: Network is unreachable
> > #
> > # ping 8.8.8.8
> > PING 8.8.8.8 (8.8.8.8): 56 data bytes
> > ping: sendto: Network is unreachable
>
> Well, if you can't reach the DNS servers, then there is no way for DNS
> resolution to work. Your network configuration seems to be incorrect.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141128/332fed4c/attachment.html>
