From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:35:11 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <55313B9C.3000008@mind.be>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>
 <552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
 <552D65C3.6010106@mind.be>
 <20150417173642.5fa56833@free-electrons.com>
 <55313020.7050203@mind.be>
 <20150417184658.3b910231@free-electrons.com>
 <55313B9C.3000008@mind.be>
Message-ID: <20150418143511.6da17b4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 17 Apr 2015 18:58:04 +0200, Arnout Vandecappelle wrote:

>  For dependencies, yes. But the legal-info of package foo really has nothing to
> do with the legal-info of host package bar even if foo depends on bar. IMHO of
> course.

Well, it's very subjective :)

>  But what I really mean is that something like this for external-deps would be
> quite simpler:
> 
> external-deps:
> 	echo $(foreach pkg,$(PACKAGES),$($(pkg)_ALL_DOWNLOADS)))

Yes, it would indeed be shorter in code, and faster in execution.

> > However, one down side of not including all .mk files is that you will
> > no longer be able to do 'make <pkg>-<something>' for a package that
> > isn't enabled. And it is something I do everyday when doing BR
> > development, especially 'make <pkg>-extract' and 'make <pkg>-patch',
> > because that the easiest way to quickly get the source code of a given
> > package extracted somewhere. And I can do this without having to go in
> > menuconfig enable the package.
> 
>  I do that as well, but we could add a make variable to read all .mk files.
> Which was also one of the feedbacks on your patch series IIRC.

That's indeed a possibility.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
