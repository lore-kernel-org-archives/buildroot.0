From: Marcel Patzlaff <M.Patzlaff@pilz.de>
Date: Tue, 31 Jul 2018 10:43:59 +0200
Subject: [Buildroot] Antwort: Re: [PATCH 3/3] New
 <pkg>-update-last-config-fragment target in pkg-kconfig.mk
In-Reply-To: <20180731095343.3440afc1@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de><20180730155153.24091-4-m.patzlaff@pilz.de><20180730234643.34315d11@windsurf><OFD5432E43.3E2246DD-ONC12582DB.0025E0A8-C12582DB.002A82C6@local-dmz.de>
 <20180731095343.3440afc1@windsurf>
Message-ID: <OF5BD57ED7.0DA2E29B-ONC12582DB.002CDAFD-C12582DB.002FF1B7@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Well, it should just reflect what the merge_config script does: the 
last
> > file in the list of files to be merged always overrides settings done 
in
> > files before. So this means, that the last fragment is basically the
> > most significate one.
> 
> Fragments are not about "priority", they are typically about splitting
> by topic different aspects. So it is not because the last fragment
> overrides the configuration options of other fragments that a
> configuration change you just did to enable driver FOO should go in the
> last fragment.

Fair enough, that's a use case where you most probably do not want to
use the proposed automatism. But if you exploit the layered
customisations (through BR2_EXTERNAL) and associate at most one fragment
with each layer than you know which layer to update and you can make use
of the proposed feature. That's at least how we are using it here. It
would then just be analogous to <pkg>-update-defconfig in the first
layer.

> > Updating any other fragment in the list would require either to have 
no
> > dependencies between fragments at all (too restrictive at least for my
> > use cases and also I'm not sure that this is feasible) or to have a 
deep
> > understanding of the dependencies.
> 
> When someone is using fragments, then they understand what they mean to
> split the configuration in different snippets. People who don't
> understand that will typically use a single monolithic .config file.

Of course one can keep it that way. But with the proposed change here it
does not have to.

> > From my perspective, neither option is that encouraging, so I do not
> > want to propose a way to update any fragment other than the last one.
> 
> My position is that updating anything is not correct, because you
> cannot know whether it is the last fragment or any of the other
> fragment that needs to be updated. The only sane semantic is to show
> what the differences are, and let the user figure out where these
> configuration differences should be propagated.

The target clearily states what it updates. So for use cases where this
is not meaningful it may of course not be used.

If this change set is targeted at too specific use cases or does only
solve one specific need, then well you should reject it. I am not sure
about that because I only see how buildroot is used in-house. And from
that perspective there is really a need for it.

So at last, I do not have a problem withdrawing the patch series and
keep maintaining it in-house. I only have to know if there is interest
in it outside or not.

Kind regards,
Marcel

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
