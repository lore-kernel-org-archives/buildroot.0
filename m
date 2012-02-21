From: Avishay Orpaz <avishorp@gmail.com>
Date: Tue, 21 Feb 2012 15:59:22 +0200
Subject: [Buildroot] Dynaminc Component System for Buildroot
In-Reply-To: <201202201020.55665.arnout@mind.be>
References: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
 <201202201020.55665.arnout@mind.be>
Message-ID: <CAMkyJgAKNjcDRO+p1SVAa0PYuZ6=w3UM0dC+vJX-YUF2nzxQMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the valuable feedback. Hopefully I'll return with a patch
shortly.

Avishay

2012/2/20 Arnout Vandecappelle <arnout@mind.be>

> On Monday 20 February 2012 08:45:48 Avishay Orpaz wrote:
> > Hi
> > I've been using buildroot for about two years for building embedded
> systems
> > on various platforms. An embedded system usually comprises of a set of
> > standard tool and custom software, scripts etc. Buildroot does great job
> on
> > the first, but then I have to manually compile the project-specific
> > software and install it in the target system created by buildroot.
>
>  No you don't.  You have to manually create a Config.in and pkg.mk for
> your project-specific software, using the 'local' SITE_METHOD.  You could
> even skip the Config.in and just add a
> TARGETS += pkg
> at the end of the pkg.mk.
>
> > In order
> > to make workflow smoother, I have an idea of adding a dynamic component
> > support for buildroot. In such a system, buildroot, when invoked, will
> scan
> > a specific directory for components. Components are directories with some
> > distinguishing feature (a special file or so) which contains buildroot
> .mk
> > file. Those components will appear on buildroot configuration menu, will
> > use the regular compilation-installation infrastructure it provides and
> > will be installed in the target filesystem as any other, out-of-the-box
> > component.
>
>  We have that system: the packages directory.
>
>  I agree that one limitation of the packages directory is that the
> project-specific packages have to be created directly in the buildroot
> tree.  But that can be overcome by adding a line like this to local.mk:
> include <project-path>/*/*.mk
>
>
> > I'm willing to put time and effort into building such an extension, but I
> > would really like to get some feedback before I start, and to estimate
> the
> > chances it would be merged into the buildroot mainline.
>
>  Although my comments above may be a bit negative, I do believe that it
> would be worthwhile to simplify the addition of project-specific packages
> to buildroot.  It will get a lot of comments, though, so you'll probably
> have more work with taking into account the reviews than with the
> implementation itself.
>
>  So I would advise the following:
> - make use of existing infrastructure (_SITE_METHOD=local, local.mk);
> - make sure you post an RFC patch as soon as possible, to get some
> dicsussion started;
> - don't expect it to be accepted in less than two months or so.
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120221/41734616/attachment.html>
