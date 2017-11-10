From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Nov 2017 15:42:40 +0000
Subject: [Buildroot] [PATCH] binutils: Allow upstream 2.29 to be chosen
 for ARC
In-Reply-To: <e30aedee-15f1-a8eb-c959-4c9269ce1929@mind.be>
References: <20171109215901.17381-1-abrodkin@synopsys.com>
 <e30aedee-15f1-a8eb-c959-4c9269ce1929@mind.be>
Message-ID: <1510328560.1303.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, 2017-11-10 at 16:40 +0100, Arnout Vandecappelle wrote:
> ?Small nit...
> 
> On 09-11-17 22:59, Alexey Brodkin wrote:
> [snip]
> > 
> > diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> > index d2bf5b9..8654239 100644
> > --- a/package/binutils/binutils.mk
> > +++ b/package/binutils/binutils.mk
> > @@ -15,7 +15,7 @@ BINUTILS_VERSION = 2.28.1
> > ?endif
> > ?endif # BINUTILS_VERSION
> > ?
> > -ifeq ($(BR2_arc),y)
> > +ifneq ($(BR2_BINUTILS_VERSION_ARC),)
> 
> ?Use positive logic:
> 
> ifeq ($(BR2_BINUTILS_VERSION_ARC),y)

For some reason I used to do it the other way around :)
But indeed may follow your suggestion.

-Alexey
