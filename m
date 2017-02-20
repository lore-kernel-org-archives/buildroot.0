From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 20 Feb 2017 15:59:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170220134111.1bc02a9f@free-electrons.com>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
Message-ID: <20170220145933.GQ12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> Thanks a lot for doing this analysis. A few comments below.
> 
> On Fri, 17 Feb 2017 22:12:42 +0100, Yann E. MORIN wrote:
> 
> > On 2017-02-17 08:28 +0100, Thomas Petazzoni spake thusly:
> > >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cd963404761070623489ee74df3e69f5052f40a1
> > >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/99e6e01f0d85fe8eb5d9b09fcc3971b577c9ba6b
> > >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e5b471dbb91ef2a15844a9ee6d1a83a38f7cc07d  
> > 
> >     error: 'printf' was not declared in this scope
> > 
> > Fabrice?
> 
> For this one and the jsoncpp-1.7.7 you reported below, what I find
> weird is that they happen *only* on or1k. or1k is using gcc 5.x, and
> lots of other architectures are using gcc 5.x.
> 
> So I would *really* like to understand why we get those alljoyn and
> jsoncpp failures specifically on or1k and not on other architectures.
> 
> > >         i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/bd4cca6e7706a68dd6c16a7bb409185c9f006a57
> > >         m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4118477ac02732b99b8bb3db8bef43290edbc5de  
> > 
> > Neither mbedtls nor poarslsl detected. Patches by J?rg on the list (in
> > this order):
> >     https://patchwork.ozlabs.org/patch/728005/
> >     https://patchwork.ozlabs.org/patch/728007/
> >     https://patchwork.ozlabs.org/patch/728004/
> >     https://patchwork.ozlabs.org/patch/728006/
> 
> I'll apply.
> 
> > >         or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/81047e13f4d7896abae1036e098303e6bf68a0e7  
> > 
> >     error: 'strtoll' is not a member of 'std'
> > 
> > C+11 stuff... Jonathan?
> 
> Same or1k question as above: why does it happen only on or1k, and not
> on other architectures?

I am not entirely sure, but can the reason for this be this patch we
apply on top of gcc 5.4.x
package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch?

I think all failures relate to some C++ header failures. Can anybody
try with this patch applied?

best regards
 Waldemar
