From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 11 Sep 2013 10:55:11 -0500
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
In-Reply-To: <20130911091700.0b24df41@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>	<OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
Message-ID: <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/11/2013 
02:17:00 AM:

> Ryan,
> 
> First of all, thanks for the feedback.

You're welcome.

> On Tue, 10 Sep 2013 20:32:32 -0500, rjbarnet at rockwellcollins.com wrote:
> 
> > Thank you so much for this patchset as it address the biggest issue 
that
> > my company currently has with buildroot and will help us become a much 

> > bigger
> > contributer to buildroot since we can move to a model that is 
conducive to
> > contributing changes back up to buildroot.
> 
> Glad to hear this!

I'll give bit more detail on how patch could allow our company to be
better contribute back to the buildroot project with this change. During 
development of a project, we could use git to track mainline and any 
third party package that we add support for, we would contribute them 
back upstream. The hope would be that by the time we get to the point
where we have to lock into a specific version of buildroot, our changes
would have been incorporated into buildroot. If not, we could move the
packages that were rejected into the BR2_EXTERNAL location but still
be able to use an off-the-shelve version of buildroot.

> Ok. Note that after I posted my patches, I had a discussion with Yann
> Morin on IRC and he was skeptical about it, for two reasons:
> 
>  (1) Almost all of what BR2_EXTERNAL allows is possible today with the
>      current Buildroot. For board level stuff, nothing forces you to
>      store it in board/<foo>/ within the Buildroot tree: all of the
>      configuration options in Buildroot can use
>      $(TOPDIR)/../company/<foo>/ to reference a kernel configuration
>      file, or a root filesystem overlay.
> 
>      For packages, the 'local.mk' file is already automatically
>      included in Buildroot if it exists. So you can create such a file
>      and put a "include $(TOPDIR)/../company/external.mk' line in it.
>      This external.mk will include all the makefiles of the external
>      packages. Since Config.in can't be integrated as easily, one
>      solution would be to hardcode BR2_PACKAGE_FOOBAR=y directly within
>      external.mk to have it always enabled.

That just becomes nasty and doesn't really easily allow for different 
configurations where you don't always want all your propriety packages
to build. Also it doesn't make your propriety packages visible within
the buildroot menuconfig. The other nice feature is the is that company's
configs are automatically pulled in a separate area.

>      So, it's already possible today, but I believe the current
>      situation is (a) not very easy to use, and (b) not visible enough.
>      (b) could be solved by more documentation, but I believe
>      BR2_EXTERNAL does not make Buildroot more complicated and solves
>      (a) quite nicely.

I definitely agree

>  (2) Yann's feeling was that by giving a too easy solution to keep
>      things out of tree would discourage BR users from contributing
>      their new packages upstream, since they can keep it outside of the
>      tree nicely. While I certainly admit it can be the case, your
>      introduction to this e-mail interestingly points exactly the
>      opposite :-)

While I do understand Yann's concerns, however, I do think that this goes
against buildroot's philosophy - "Buildroot: make Embedded Linux easy". 
Right now it isn't easy for one to make customization to buildroot without
modifying buildroot's source.

Yann - I would welcome you input into this discussion on mailing list 
here.

I'm probably beating this issue to death but I guess I'm very excited 
about
the possibilities that this patchset opens up for my company.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/cde71f90/attachment-0001.html>
