From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 16 May 2017 14:07:19 +0000
Subject: [Buildroot] [PATCH] gcc: arc-2017.03-rc2: Fix "unrecognized
 supposed constant" error
In-Reply-To: <87vap29eja.fsf@dell.be.48ers.dk>
References: <20170515155657.22513-1-abrodkin@synopsys.com>
 <87vap29eja.fsf@dell.be.48ers.dk>
Message-ID: <1494943638.2500.72.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, 2017-05-15 at 20:10 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
> ?> This fixes the following problem:
> ?> arc-linux-gcc -c -Os -fPIC iso9660.i
> ?> iso9660.c: In function 'strip_trail':
> ?> iso9660.c:155:1: error: unrecognized supposed constant
> ?>??}
> ?>??^
> ?> (unspec:SI [
> ?>?????????(symbol_ref:SI ("*.LANCHOR1") [flags 0x182])
> ?>?????] ARC_UNSPEC_GOTOFFPC)
> ?> iso9660.c:155:1: internal compiler error: in arc_legitimate_constant_p, at config/arc/arc.c:6028
> 
> ?> Found by Buildroot autobuilder [1].
> 
> ?> The fix [2] is in arc-2017.03 development branch of ARC GCC and once it
> ?> becomes a part the next release of ARC tools this should be removed
> ?> from Buildroot.
> 
> ?> [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_c90_c909e8c397ab972b6aa4d370572cad4fae284d00_build-2Dend.
> log&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=eyEAZfBkQhTd80xpTFI0NPKpz57Aa8duF3Uu1L_JgXM&s=PiWGi8QYaMIbOlEL
> BukiJt2-WQi9IqfQlPFkxgNqbE8&e=?
> ?> [2]
> ?> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_gcc_commit_139fed9d29ab935b3bc5159
> c0bdf7b8b8a39442d&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=eyEAZfBkQhTd80xpTFI0NPKpz57Aa8duF3Uu1L_JgXM&s=OK
> r0FRgbINPdN6fRMnB18MICruG3PJVXVDpOjxISyVk&e=?
> 
> Committed, thanks.

Thanks for that.

> I just noticed that we still have a patch from arc-2016.09. Can you
> confirm that this isn't needed any more?

No this is not needed any longer - was just a reminder of incomplete
patch that bumped ARC tools version.

Care to remove this or you'd prefer a patch from my on that regard?

-Alexey
