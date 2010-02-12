From: Nicholas Walton <nwalton@aplopteng.com>
Date: Fri, 12 Feb 2010 09:39:05 -0800
Subject: [Buildroot] Q: Name resolving ?
In-Reply-To: <b680c1c11002120938p7eb9f04exc74c76de85fb42a@mail.gmail.com>
References: <1531E53627F1F749B4FE809BF2A4EB67016D522D@WETMEX10.loepfe.com> 
	<b680c1c11002120938p7eb9f04exc74c76de85fb42a@mail.gmail.com>
Message-ID: <b680c1c11002120939nbdfd9efm1887fc12d6860f6a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 12, 2010 at 4:14 AM, Vellemans, Noel
<Noel.Vellemans@visionbms.com> wrote:
> Hi all,
>
> Don't know if this is the right place to drop this question, but maybe
> someone can help or give me a hint.
>
> I've build a buildroot system (for an at91 based board) with busybox and
> DHCP client? (udhcpc), which is all working.
>
> Here comes the question:
>
> I would like to that the AT91BOARD1 registers his HOSTNAME (which is
> AT91BOARD1) with our 'windows' network.
> Someone that can give me a hint how to get this working ?
>
> ( name resolving on the at91-board is working,but the at91-board? does not
> register itself to the 'win32'-nameserver(s) )
>
> Do I need a package to get this working or is this a option somewhere (that
> is not enabled) ?
>
> Regards Noel.

Make sure your network's DHCP server is also acting as a DNS server
(not all of them do), and in /etc/network/interfaces, you have
something like:

auto eth0
iface eth0 inet dhcp
? ? hostname AT91BOARD1
