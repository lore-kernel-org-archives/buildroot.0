From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 23:53:10 +0100
Subject: [Buildroot] [PATCH 06/13 v2] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <5671FA46.2050903@mind.be>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <72f53f4f69afe29c7621731bae6eb536864501c5.1450031251.git.yann.morin.1998@free.fr>
 <5671FA46.2050903@mind.be>
Message-ID: <20151218225310.GC10982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-17 00:56 +0100, Arnout Vandecappelle spake thusly:
> On 13-12-15 19:35, Yann E. MORIN wrote:
> > Currently, we put all source archives side-by-side in the same
> > directory.
> > 
> > Since we're about to also save individual patches that were applied
> > on those sources, we don't want to make that directory a complete
> > mess of unassorted files.
> > 
> > So, we install each source archive in its own sub-directory, where
> > we'll later store the patches too. Store that location in a variable,
> > so it can be re-used later on (to install patches in a future commit).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> > 
> > ---
> > Changes v1 -> v2:
> >   - perl no longer has a post-legal-info hook  (Thoams, Luca)
> > ---
> >  package/pkg-generic.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 784c39c..3b6240a 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -491,6 +491,8 @@ endif
> >  
> >  $(2)_REDISTRIBUTE		?= YES
> >  
> > +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME_VERSION)
> 
>  Not directly related to this patch, but I find this
> $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) bit extremely ugly.
> $(LEGAL_INFO_DIR)/$(4)-sources is a lot nicer. Of course, that means we put
> things in target-sources instead of plain sources, but I think that's an
> improvement as well.

I'm not so sure it is better: we do not have the habit of prefixing
target stuff with 'target-'. Only the host stuff we do prefix with
'host-'. Why would we derogate from that rule for legal-info?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
