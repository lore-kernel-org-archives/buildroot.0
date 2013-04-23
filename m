From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Tue, 23 Apr 2013 21:09:29 +0000
Subject: [Buildroot] [RFC] permit menu customization
In-Reply-To: <2109665750.1839087.1366701526272.JavaMail.root@openwide.fr>
References: <5175AAAA.5030503@mind.be>
 <2109665750.1839087.1366701526272.JavaMail.root@openwide.fr>
Message-ID: <069B5A25F9844945B625ADE7258AC94C062BE7E7@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think a change like this would be quite useful. I have to maintain a set of buildroot packages which are project specific, and it would on the surface seem like a better solution if these additions could be kept separate to the build root files where changes can be upstreamed.

Regards,
Reuben

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Jeremy Rosen
> Sent: Tuesday, 23 April 2013 7:19 p.m.
> To: Arnout Vandecappelle
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [RFC] permit menu customization
>
> >
> > On 22/04/13 11:07, spdawson at gmail.com wrote:
> > > From: Simon Dawson<spdawson@gmail.com>
> > >
> > > This patch is a first attempt at providing a mechanism by which the
> > > user
> > > can specify a local menu configuration file, for extending the
> > > Buildroot
> > > menu system.
> >
> >   A couple of patches with a similar purpose have been posted in the
> >   last
> > year or so. However, at the last two buildroot developer meetings
> > we've
> > decided that this approach is not the way we want to go. Instead,
> > adding
> > custom packages should be done by including them directly at the top
> > of
> > packages/Config.in.
> >
>
>
> So, basically, it's not possible to add a software to buildroot without
> modifying buildroot-provided files...
>
> I know I wasn't at these dev meetings, but when we work for customers
> that
> develop dedicated software for their appliance I can't use the simple
> rule "every change in the buildroot tree should be upstreamed"
>
> it also means that generating patches in a tree like that (mixture of
> upstreamable and non-upstreamable changes) is more complicated.
>
> I can mange that but I know for a fact that lots of customers won't
> bother
> with that... And I can't always do it for them.
>
> I have been working on some time on finding a way of having a work
> environement for buildroot that I can provide which clearly separates
>
> * buildroot provided files
> * local configuration
> * the local single-purpose software for the project
>
> but I can't really manage to do it. O= helps, it allows to separate
> (most of)
> the configuration, the XXX_OVERRIDE_SRCDIR also helps managing hevily
> patched dependencies (where we would upstream to the project but not to
> buildroot)
>
> but managing buildroot-upstreamable changes is a bit complicated
> because I
> have to edit packages/Config.in and packages/Makefile.in
>
> I would really appreciate a patch as above (I tried to write it myself
> but
> also stumbled on the seeding problem) so, for what it's worth, I'll
> second it
>
> I know the official answer is "a project <=> a board" and that I should
> copy
> the defconfig into a new board, but that seems weird when I am reusing
> an
> existing board and, again, it complicates configuration management.
>
> Basically my whole project has to be a clone of buildroot, whereas I
> would
> like buildroot to be a submodule of my project so I can keep my changes
> separated.
>
>
> comments would be appreciated on how to do that....
>
> >
> >   Another buildroot rule is that the build should never modify the
> > buildroot directory itself when O= is specified on the command line.
> > So
> > the Config.in.user should at least be in the CONFIG_DIR rather than
> > the
> > TOPDIR.
> >
>
> on a (slightly) related note, should I re-send my patch that changes
> the
> default location of local.mk to $(CONFIG_DIR) instead of $(TOPDIR) ?
>
> >
> >   Regards,
> >   Arnout
> >
> > [snip]
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> > Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
