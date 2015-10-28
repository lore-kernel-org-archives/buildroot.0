From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 28 Oct 2015 21:21:14 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
	interfaces to appear
In-Reply-To: <20151028174653.GA3650@free.fr>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr>
Message-ID: <2419445.kGEUX5UIA3@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wednesday 28 October 2015 18:46:53 Yann E. MORIN wrote:
> J?r?me, All,
> 
> On 2015-10-28 16:59 +0100, J?r?me Pouiller spake thusly:
[...]
> Please drop the empty lines.
There were empty lines in original patch ;-).

> Also, I would have preferred patches 2 & 3 to be folded into a single
> patch. 
ok.

> I don't really understand how it all works:
> 
>   - does the busybox ifup-down and full-fledged ifup-down support
>     wait-delay?
Yes, both.

>   - I looked at man 5 interfaces, and there is no mention of
> wait-delay,

I have found documentation related to if-*.d scripts in section called 
"IFACE OPTIONS" of interfaces(5) of my debian.


>   - I don't see how 'wait-delay' translates to 'wait_iface'

From interfaces(5):

  "Additionally, all options given in an interface definition stanza are 
exported to the environment in upper case  with  "IF_"  prepended  and  
with hyphens converted to underscores and non-alphanumeric characters 
discarded."


>   - I guess 'wait-delay' is made an environment variable IF_WAIT_DELAY
> before the script is run, but I'd have preferred explanations rather
> than having to guess.
> 
> Care to shed some light, please?

Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
