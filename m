From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 4 Jul 2016 20:54:08 +0200
Subject: [Buildroot] [PATCH] m68k: binfmt flat configuration fixes
In-Reply-To: <20160703202510.6e4cd82d@free-electrons.com>
References: <20160703170819.GA15135@waldemar-brodkorb.de>
 <20160703202510.6e4cd82d@free-electrons.com>
Message-ID: <20160704185407.GC20199@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 3 Jul 2016 19:08:19 +0200, Waldemar Brodkorb wrote:
> 
> > diff --git a/arch/Config.in b/arch/Config.in
> > index 1fdd36a..92b094a 100644
> > --- a/arch/Config.in
> > +++ b/arch/Config.in
> > @@ -360,11 +360,13 @@ choice
> >  
> >  config BR2_BINFMT_FLAT_ONE
> >  	bool "One memory region"
> > +	depends on !BR2_m68k
> >  	help
> >  	  All segments are linked into one memory region.
> >  
> >  config BR2_BINFMT_FLAT_SEP_DATA
> >  	bool "Separate data and code region"
> > +	depends on BR2_m68k
> 
> Are you sure? I think sep-data is also available on Blackfin. From the
> gcc documentation:

You are right, sorry I somehow remembered the situation wrongly.
 
>      _Blackfin Options_
>           -mcpu=CPU[-SIREVISION]
>           -msim -momit-leaf-frame-pointer  -mno-omit-leaf-frame-pointer
>           -mspecld-anomaly  -mno-specld-anomaly  -mcsync-anomaly  -mno-csync-anomaly
>           -mlow-64k -mno-low64k  -mstack-check-l1  -mid-shared-library
>           -mno-id-shared-library  -mshared-library-id=N
>           -mleaf-id-shared-library  -mno-leaf-id-shared-library
>           -msep-data  -mno-sep-data  -mlong-calls  -mno-long-calls
>           -mfast-fp -minline-plt -mmulticore  -mcorea  -mcoreb  -msdram
>           -micplb
> 
> Also, what about ARM noMMU ?

No -msep-data :)

best regards
 Waldemar
