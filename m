From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 8 Oct 2015 09:51:21 +0200
Subject: [Buildroot] Add [user@host dir] back to skeleton /etc/profile
In-Reply-To: <5615875A.2010409@mind.be>
References: <5614523A.2090204@cmlab.biz> <5614D653.7030005@lucaceresoli.net>
 <56154EC9.4090107@cmlab.biz> <561560C0.4030509@cmlab.biz>
 <5615875A.2010409@mind.be>
Message-ID: <CAGduivzJ3_xksqdiETf1gRgfkzo3z0mZGKj=FoyoAbh_CJG70g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 7, 2015 at 10:58 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 07-10-15 19:13, David Van Arnem wrote:
> > On 10/07/2015 10:56 AM, David Van Arnem wrote:
> [snip]
> >> I'd be happy to work on putting the changes back in
> >> package/bash/bash_profile.  I've only used default
> >> packages/configurations in Buildroot so I'm not very familiar with
> >> modifying them, and I could use some guidance.  Should I place
> >> bash_profile in package/bash and then have the bash package Makefile
> >> copy it to system/skeleton/etc/profile?  Or is there another way I
> >> should install it?
> >>
> >> David
> >>
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > Upon more investigation, I have a (hopefully) better idea for how to
> accomplish
> > this. Sticking with the suggestion in the commit message ("If the user
> has a
> > specific needs, it needs to be added in /etc/profile.d/ by a post-build
> > script."), I'm thinking I should create package/bash/bash_profile.sh,
> and in
> > bash.mk set up a section to use $(INSTALL) to install it to
> > $(TARGET_DIR)/etc/profile.d/bash_profile.sh. The skeleton /etc/profile
> sources
> > any *.sh files in /etc/profile.d, so it should hopefully pick it up.
> Does this
> > sound like a viable (and correct wrt best buildroot practices) approach?
>
>  Sounds like a good idea to me!
>
Indeed, that's what this was intented for, go for it.

>
>  Regards,
>  Arnout
>
> >
> > Or, I'll just try it and see if it works :)
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151008/cbe2affb/attachment.html>
