From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 09 Mar 2016 09:27:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
	declared in local.mk/external.mk
In-Reply-To: <56DF5DFB.1050309@mind.be>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <20160308221049.GB14289@free.fr> <56DF5DFB.1050309@mind.be>
Message-ID: <3019698.gqGZGCWVhD@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Arnout, All,

On Wednesday 09 March 2016 00:19:23 Arnout Vandecappelle wrote:
> On 03/08/16 23:10, Yann E. MORIN wrote:
[...]
> > What we could do, however, would be:
> >    - in external.mk:
> >          BR2_HAS_EXTRA_HELP = YES  # Whatever non empty
> >    
> >    - in the main Makefile:
> >          help:
> >              blabla our current help
> >              $(if $(BR2_HAS_EXTRA_HELP),echo "  - local-help  to get
> >              local help blabla)> 
> > which would be IMHO much much nicer and much much simpler...
> 
>   I don't see the advantage of that, to be honest... The point is to
> append it to the main help. You expect just a few lines of extra help
> text.
I agree with Arnout. 

I add that EXTRA_HELP is generic enough to implement Yann's idea if 
necessary. Instead of supporting BR2_HAS_EXTRA_HELP, just add in 
external.mk:

    EXTRA_HELP = "- local-help  to get local help blabla"
    local-help:
    	@echo "..."




-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
