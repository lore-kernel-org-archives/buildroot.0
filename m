From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 7 Jan 2016 21:30:00 +0100
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
In-Reply-To: <568EB85E.3090501@zacarias.com.ar>
References: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
 <568EB85E.3090501@zacarias.com.ar>
Message-ID: <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 06/01/16 11:26, rdkehn at yahoo.com wrote:
[...]
> It appears that dhcp-4.3.3 supports the -I and -df options used by
> ifupdown-0.8.2. Cross-compiling dhcp-4.3.3 will be more complicated
> since there is now a bind tar-ball embedded into the dhcp source. Is
> anyone else attempting to add dhcp-4.3.3 to Buildroot?

I had started to look into this a few months ago, and setting
--with-libbind=PATH to use the bind provided by Buildroot seemed to be
a better option (in order to avoid possibly installing two instances
of bind on the target, either standalone or inside the dhcp binaries
if statically linked, and both bind versions were compatible at that
time), though I have not yet tested it.

Best regards,
Beno?t
