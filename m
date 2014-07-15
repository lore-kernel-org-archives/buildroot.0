From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 22:30:22 +0200
Subject: [Buildroot] [PATCH] qt5: Add an option to select default
	platform
In-Reply-To: <8141517.o3agpU1nI3@sagittea>
References: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
 <53B7087D.4080801@mind.be> <8141517.o3agpU1nI3@sagittea>
Message-ID: <20140715203022.GF3351@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-07-07 09:58 +0200, J?r?me Pouiller spake thusly:
> On Friday 04 July 2014 22:03:09 Arnout Vandecappelle wrote:
> > On 04/07/14 11:36, J?r?me Pouiller wrote:
> > > Whithout this path, default platform is automaticaly set (generally
> > > set to "eglfs" as defined in
> > > qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
> > > is not always what the user would like. Thus, user have to manually
> > > appends "-platform <BACKEND>" to command line when running any qt5
> > > application.
> > > 
> > > This patch allows user to choose default platform explicitly.
> > > 
> > > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > > ---
> > > 
> > >  package/qt5/qt5base/Config.in  | 43
> > >  ++++++++++++++++++++++++++++++++++++++++++
> > >  package/qt5/qt5base/qt5base.mk |  6 ++++++
> > >  2 files changed, 49 insertions(+)
> > > 
> > > diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> > > index 70ddcd3..5fa7c02 100644
> > > --- a/package/qt5/qt5base/Config.in
> > > +++ b/package/qt5/qt5base/Config.in
> > > @@ -144,6 +144,49 @@ config BR2_PACKAGE_QT5BASE_EGLFS
> > > 
> > >  comment "eglfs backend available if OpenGLES and EGL are enabled"
> > >  
> > >  	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
> > > 
> > > +choice
> > > +	prompt "default graphical platform"
> > > +	default BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
> > 
> >  I wonder if it is really worthwhile to make this a choice. That means that
> > whenever a new platform is added (wayland, vnc, ...) we have to update the
> > choice. And one could imagine a user implementing their own QPA plugin...
> > 
> >  So I would propose to make this a string, default to empty, and when it's
> > empty don't pass the -qpa option.
> I have no opinion on that. If nobody has any arguments against, I am going to 
> implement this idea.

Yes, I concur with Arnout: that would be a better solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
