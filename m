From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Mon, 9 Oct 2006 07:05:27 +0200
Subject: [Buildroot] Networking apps not working
In-Reply-To: <8032e0b00610070753n74e4fa04yf0aae1d164741213@mail.gmail.com>
References: <8032e0b00609301044s489c6efboc8754ce5309a6a9@mail.gmail.com>
	<200610040935.33205.vapier@gentoo.org>
	<8032e0b00610070753n74e4fa04yf0aae1d164741213@mail.gmail.com>
Message-ID: <200610090705.27272.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a similar problem.
When i use dhclient to acuire and IP-address it says: "bla bla bla got reply 
from 192.168.255.x, your IP-address is 192.168.255.188", but when i check 
with ifconfig the ip is not set.
Also, i have to do "ifconfig eth0 up" before i can use dhclient.

/ Alex

On Saturday 07 October 2006 16:53, Ashok Shankar Das wrote:
> Hi.
>
> On 10/4/06, Mike Frysinger <vapier@gentoo.org> wrote:
> > keep replies on the list
> > -mike
>
> The problem I figured out is "route" incorectly sets the default gateway.
> To overcome What I did is
> * route del default
> *route add -net 0.0.0.0 gw 192.168.0.1 netmask 0.0.0.0
> and it solved the problem
>
> Well has anybody faced the same problem?
