From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 15 Jul 2014 18:24:47 +0200
Subject: [Buildroot] [PATCH 1/2] qt5declarative: Reduce dependencies to
	GLes2 only
In-Reply-To: <201407151703.27792.fatih.asici@gmail.com>
References: <533A8F6C.1010606@gmail.com> <53C4E59E.4030103@gmail.com>
 <201407151703.27792.fatih.asici@gmail.com>
Message-ID: <2694981.viQ6KxKrnD@desktop-057>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 15 July 2014 17:03:27 Fatih A??c? wrote:
> On Tuesday 15 July 2014 11:26:06 Hadrien Boutteville wrote:
> > Hello Fatih,
> 
> Hi,
> 
> > I'm mainlining some pending patches for the Google Summer of Code, and
> > for this one I'm not really able to say if it is correct or not. It
> > seems coherent for me but I'm not a Qt5 expert.
> > 
> > As Thomas said, since you are our Qt5 expert have you some comments on
> > this patch?
> 
> Sorry for the late reply. Totally forgot this mail.
... and I totally forgot I sent it. 

I initially sent it to Marco Trapanese in order to help him (may be I should 
have send it privately in order to not appear in Patchwork?).

Some work (as Fatih describe below) is necessary before it could be mainlined.

> Desktop opengl and opengles2 implementations can be available at the same
> time. For -opengl option, we should allow the user to select the api. Each
> implementation option must depend on only the related library (_HAS_LIBGL
> for desktop and _HAS_LIBGLES for es2).
> 
> _QT5BASE_EGLFS must only depend on _HAS_LIBEGL. If selected, "-eglfs" must
> be passed.
> 
> At this time, Qt5OpenGL library is installed if _QT5BASE_EGLFS is selected.
> This must be changed, too. It should be installed to target, if (_HAS_LIBGL
> || _HAS_LIBGLES).


--
J?r?me Pouiller
