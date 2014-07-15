From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 15 Jul 2014 17:03:27 +0300
Subject: [Buildroot] [PATCH 1/2] qt5declarative: Reduce dependencies to
	GLes2 only
In-Reply-To: <53C4E59E.4030103@gmail.com>
References: <533A8F6C.1010606@gmail.com> <20140420111843.340cb627@skate>
 <53C4E59E.4030103@gmail.com>
Message-ID: <201407151703.27792.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 15 July 2014 11:26:06 Hadrien Boutteville wrote:
> Hello Fatih,

Hi,

> I'm mainlining some pending patches for the Google Summer of Code, and
> for this one I'm not really able to say if it is correct or not. It
> seems coherent for me but I'm not a Qt5 expert.
> 
> As Thomas said, since you are our Qt5 expert have you some comments on
> this patch?

Sorry for the late reply. Totally forgot this mail.

Desktop opengl and opengles2 implementations can be available at the same 
time. For -opengl option, we should allow the user to select the api. Each 
implementation option must depend on only the related library (_HAS_LIBGL for 
desktop and _HAS_LIBGLES for es2).

_QT5BASE_EGLFS must only depend on _HAS_LIBEGL. If selected, "-eglfs" must be 
passed.

At this time, Qt5OpenGL library is installed if _QT5BASE_EGLFS is selected. 
This must be changed, too. It should be installed to target, if (_HAS_LIBGL || 
_HAS_LIBGLES).

I will prepare a patch to fix all these issues.

Regards,
Fatih
