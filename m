From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 19:18:10 +0200
Subject: [Buildroot] [PATCH 04/12 v2] infra/pkg-download: make the
 DOWNLOAD macro fully parameterised
In-Reply-To: <bc74daf9-0a18-48aa-d60e-16f1371c7451@mind.be>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <d937e062549e9bce6658f98a5c06e663e4f5cdd2.1555273025.git.yann.morin.1998@free.fr>
 <bc74daf9-0a18-48aa-d60e-16f1371c7451@mind.be>
Message-ID: <20190415171810.GS2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-15 11:08 +0200, Arnout Vandecappelle spake thusly:
> On 14/04/2019 22:17, Yann E. MORIN wrote:
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index a83813e28d..f78ff2e665 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -149,7 +149,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
> >  			break ; \
> >  		fi ; \
> >  	done
> > -	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
> > +	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
> >  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
> >  	$(Q)mkdir -p $(@D)
> >  	@$(call step_end,download)
> 
>  Maybe this is the thing you forgot to amend, but: the DOWNLOAD macro is also
> used a couple of lines lower for the actual_source.

Good catch. And no, that was not the thing I missed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
