From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 14:42:13 +0200
Subject: [Buildroot] [PATCH 01/10] infra/pkg-download: return just a
 list of URIs
In-Reply-To: <20190407142052.7287739d@windsurf>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <75ae0630f1759fb589a3a9ed20daa918c246e819.1554637858.git.yann.morin.1998@free.fr>
 <20190407142052.7287739d@windsurf>
Message-ID: <20190407124213.GM2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-07 14:20 +0200, Thomas Petazzoni spake thusly:
> On Sun,  7 Apr 2019 13:51:16 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > @@ -101,7 +101,7 @@ define DOWNLOAD
> >  		-N '$($(PKG)_RAWNAME)' \
> >  		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
> >  		$(if $($(PKG)_GIT_SUBMODULES),-r) \
> > -		$(DOWNLOAD_URIS) \
> > +		$(patsubst %,-u %,$(DOWNLOAD_URIS)) \
> 
> A patsubst here feels a bit awkward. What about a foreach instead, i.e:
> 
> 		$(foreach uri,$(DOWNLOAD_URIS),-u $(uri))
> 
>  ?

OK, I remember having the choice, and going with patsubst instead of
foreach. But I don't remember what made me make up my mind that way...

Maybe it was just because using a patsubst was shorter? ;-)

I'm OK with a foreach, of course (fixed locally in a moment, so will be
ready for a v2 if there is a need).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
