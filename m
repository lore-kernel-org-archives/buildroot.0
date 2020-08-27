From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu, 27 Aug 2020 10:10:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
In-Reply-To: <20200826232701.1fc77e76@windsurf.home>
References: <1597833691-18154-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20200826232701.1fc77e76@windsurf.home>
Message-ID: <CAHpTZwn_sbMEA2ZZ=P9SECKJNWYt_dCjUV=xebMHyG+1SoVWBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 26, 2020 at 11:27 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Wed, 19 Aug 2020 12:41:31 +0200
> Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:
>
> > PTraf-ng is a console-based network monitoring program for Linux that
> > displays information about IP traffic. It returns such information as:
> >
> > - Current TCP connections
> > - UDP, ICMP, OSPF, and other types of IP packets
> > - Packet and byte counts on TCP connections
> > - IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
> > - TCP/UDP counts by ports
> > - Packet counts by packet sizes
> > - Packet and byte counts by IP address
> > - Interface activity
> > - Flag statuses on TCP packets
> > - LAN station statistics
>
> This change is causing one build failure:
>
>   http://autobuild.buildroot.net/?reason=iptraf-ng-1.2.1
>
>
Actually, there was a missing : depends on
"BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14"
as PACKET_USER and PACKET_KERNEL were introduced in kernel 3.14 :
https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h
.

I will send the fix.

Hope this answers the question.

Could you have a look ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best regards.

Jugurtha.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200827/eb4e216d/attachment.html>
