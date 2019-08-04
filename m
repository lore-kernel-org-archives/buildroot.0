From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Sun, 4 Aug 2019 07:51:40 +0000
Subject: [Buildroot] [PATCH] busybox: Enable domain search list support
 in udhcpc
In-Reply-To: <87h86yb5ij.fsf@dell.be.48ers.dk>
References: <20190408110010.2596-1-abrodkin@synopsys.com>
 <20190803154900.GA26072@scaer> <87h86yb5ij.fsf@dell.be.48ers.dk>
Message-ID: <CY4PR1201MB01207080F07FF93359EDD45AA1DB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> -----Original Message-----
> From: Peter Korsgaard <jacmet@gmail.com> On Behalf Of Peter Korsgaard
> Sent: Saturday, August 3, 2019 7:04 PM
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>; buildroot at busybox.net; Ignacy Gawedzki
> <ignacy.gawedzki@green-communications.fr>; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [PATCH] busybox: Enable domain search list support in udhcpc
> 
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Alexey, All,
>  > On 2019-04-08 14:00 +0300, Alexey Brodkin spake thusly:
>  >> This is useful in networks with internal resources as it allows
>  >> to use much shorter names.
>  >>
>  >> E.g. instead of "server.internal.company.com" it's possible
>  >> to use just "server" if DHCP server is configured with:
>  ----------------------------> 8-----------------------
>  >> option domain-search "internal.company.com";
>  ----------------------------> 8-----------------------
>  >>
>  >> This improvement consists of 2 parts:
>  >>
>  >> 1. Enable handling of RFC3397 so DHCP client is ready for processing
>  >> corresponding data from DHCP server.
>  >>
>  >> 2. Some DHCP servers always send out search list if it is set in server's
>  >> configuration and some servers only provide search list if client
>  >> asks for that (sending list of options it expectes to get).
>  >>
>  >> And exactly for those stubborn DHCP servers we need to add "-O search"
>  >> to udhcp's command line via CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS.
>  >>
>  >> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>  >> Cc: Ignacy Gawedzki <ignacy.gawedzki@green-communications.fr>
>  >> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
>  > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Committed, thanks.
> 
> Notice: For a single domain, I believe you can just set
> 
> option domain-name "internal.company.com"

Sure that's perfectly possible.
But in some networks (for example) like we have in the company
they do use search domains and w/o it boards connected to the network
get incomplete configuration and cannot access internal resources.

-Alexey
