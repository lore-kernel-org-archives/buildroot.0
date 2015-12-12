From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 12 Dec 2015 09:53:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-07
In-Reply-To: <20151208180201.GP4188@free.fr>
References: <20151208073019.9BDA510542E@stock.ovh.net>
 <20151208180201.GP4188@free.fr>
Message-ID: <1449910382.2234.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On Di, 2015-12-08 at 19:02 +0100, Yann E. MORIN wrote:
> Peter, Thomas, All,
> 
> > ???????????????arptables-0.0.4 | 4 
> 
> Patch available, but not sure I understand it fully:
> ????https://patchwork.ozlabs.org/patch/551152/
> 

Let me explain...

To avoid the linux/netinet header issues (linux/netfilter implicitly
includes linux/in), the patch declares the needed ?NF_* macros and the
struct xt_classify_target_info from the linux headers in a __KERNEL__
ifdef/else condition. It's done this way to be aligned with who it's
done already in the upstream sources.

Best regards
J?rg Krause
