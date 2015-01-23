From: Ben Ben <carmazen84@gmail.com>
Date: Fri, 23 Jan 2015 14:24:59 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/opengl-registry: new
	package
In-Reply-To: <20150123123904.GD8089@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <a262173c20d1679301970131f119c65bc916d8be.1421699898.git.yann.morin.1998@free.fr>
 <20150120181244.7b007fc4@nserafini-N550JK>
 <20150121173631.GD4375@free.fr>
 <20150122081225.004e5ff2@nserafini-N550JK>
 <20150123123904.GD8089@free.fr>
Message-ID: <CA+GxxTddahFPM4xCubMTFxnyiV=W7rqXve5-jVzq-ttcKHAswA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

I took a look in khronos documentation. Looks like eglplatform.h,
gl2platform.h are not generate by the script genheader.py
https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api/readme.pdf

This files seems hancoded and not maintained anymore.
https://www.khronos.org/registry/gles/#specfiles

So maybe it's the inclusion of Qt5 which are not up to date ?

Nicolas, I also add manually them to compile Qt5 but I had linking issue. I
didn't looking much to solve the problem, I can't say if it's related. I
will retry later.

Best regards,
Beno?t, beginner in buildroot.



2015-01-23 13:39 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:

> Nicolas, All,
>
> On 2015-01-22 08:12 +0100, Nicolas Serafini spake thusly:
> > On Wed, 21 Jan 2015 18:36:31 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2015-01-20 18:12 +0100, Nicolas Serafini spake thusly:
> > > > I have done some test using Nvidia tegra binary blob and I was not
> > > > able to build package that has dependency (like QT5 with OpenglES)
> > > > because some headers files are missing.
> > > > EGL/eglplatform.h
> > > > GLES/glplatform.h
> > > > GLES2/gl2platform.h
> > > > GLES3/gl3platform.h
> > > >
> > > > If I add them manually it's working.
> > >
> > > Do you mean that they are present in opengl-registry, but not
> > > installed? If so, I may have missed something. I'll have a look later
> > > tonight.
> >
> > No they are not present in opengl-registry. I looked into the Makefile
> > if there is an option to enable the generation of these files but I saw
> > nothing.
> >
> > I took the missing files on this page
> > https://www.khronos.org/registry/
>
> Ok, so it the same location as I had found, too.
>
> So, here's what I've done to get those headers:
>
> http://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/gfx&id=0d2cdbc1bac3065383b8f31c1c8b954359550c77
>
> It's not as clean as I had liked, but it works. I still have some minor
> cleanups to do before I respin the series, though...
>
> Thank you! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150123/183e987e/attachment.html>
