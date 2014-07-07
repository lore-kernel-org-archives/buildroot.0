From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Jul 2014 09:58:40 +0200
Subject: [Buildroot] [PATCH] qt5: Add an option to select default
	platform
In-Reply-To: <53B7087D.4080801@mind.be>
References: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
 <53B7087D.4080801@mind.be>
Message-ID: <8141517.o3agpU1nI3@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Friday 04 July 2014 22:03:09 Arnout Vandecappelle wrote:
> On 04/07/14 11:36, J?r?me Pouiller wrote:
> > Whithout this path, default platform is automaticaly set (generally
> > set to "eglfs" as defined in
> > qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
> > is not always what the user would like. Thus, user have to manually
> > appends "-platform <BACKEND>" to command line when running any qt5
> > application.
> > 
> > This patch allows user to choose default platform explicitly.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  package/qt5/qt5base/Config.in  | 43
> >  ++++++++++++++++++++++++++++++++++++++++++
> >  package/qt5/qt5base/qt5base.mk |  6 ++++++
> >  2 files changed, 49 insertions(+)
> > 
> > diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> > index 70ddcd3..5fa7c02 100644
> > --- a/package/qt5/qt5base/Config.in
> > +++ b/package/qt5/qt5base/Config.in
> > @@ -144,6 +144,49 @@ config BR2_PACKAGE_QT5BASE_EGLFS
> > 
> >  comment "eglfs backend available if OpenGLES and EGL are enabled"
> >  
> >  	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
> > 
> > +choice
> > +	prompt "default graphical platform"
> > +	default BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
> 
>  I wonder if it is really worthwhile to make this a choice. That means that
> whenever a new platform is added (wayland, vnc, ...) we have to update the
> choice. And one could imagine a user implementing their own QPA plugin...
> 
>  So I would propose to make this a string, default to empty, and when it's
> empty don't pass the -qpa option.
I have no opinion on that. If nobody has any arguments against, I am going to 
implement this idea.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
