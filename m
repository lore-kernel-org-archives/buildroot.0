From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Apr 2017 20:47:38 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170406183316.44d8db5a@free-electrons.com>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <20170406183316.44d8db5a@free-electrons.com>
Message-ID: <20170407204738.3f114ab4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 6 Apr 2017 18:33:16 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu, 6 Apr 2017 13:47:11 +0200, Peter Seiderer wrote:
> 
> > Untested but maybe the following works:
> > 
> > diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> > index 853322c..5e0fbe2 100644
> > --- a/package/qt5/qt5declarative/Config.in
> > +++ b/package/qt5/qt5declarative/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
> >         select BR2_PACKAGE_QT5XMLPATTERNS
> >         select BR2_PACKAGE_QT5BASE
> >         select BR2_PACKAGE_QT5BASE_GUI
> > +       select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5BASE_EXAMPLES
> >         depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> >         help
> >           Qt is a cross-platform application and UI framework for
> 
> Thanks, can you submit as a proper patch?
> 

Preferred the upstreamable solution to disable examples/quick/demos/photoviewer
in case the qt5 widgets module is not available and submitted as a proper
patch, see [1]...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2017-April/188935.html


> Thomas
