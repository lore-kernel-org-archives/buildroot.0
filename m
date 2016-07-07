From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 16:53:16 +0200
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <815daf75-807a-f510-bd73-d87e50b72073@stu.hosei.ac.jp>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
 <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
 <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
 <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
 <20160707160636.505b2da4@free-electrons.com>
 <815daf75-807a-f510-bd73-d87e50b72073@stu.hosei.ac.jp>
Message-ID: <20160707165316.255efa82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 23:31:14 +0900, Akihiko Odaki wrote:

> qtwaylandscanner in qt5wayland, a package I made. Actually it can be 
> built without host-qt5base.

No, it cannot (from the link you pointed) :

#include <QCoreApplication>
#include <QFile>
#include <QXmlStreamReader>

If it builds on your build machine, it's because you have the Qt5
development files installed. But you cannot rely on them being
available on the build machine of every Buildroot user.

> > Using Python and being a Python package are completely different things.
> >
> > The Python package infrastructure is used by Python modules that use
> > distutils or setuptools.
> >
> > But besides that, lots of packages use Python in their build process,
> > even if they are not at all Python modules.  
> 
> Anyway, such building tools have no variables for their pathes?

Not necessarily. The QT5_QMAKE variable exists precisely because some
arguments must be passed to qmake to make it build code for the target.

> >> The variable is not used in Qt packages and they will need to be
> >> modified to use the variable if it is kept. My patches to add a few Qt
> >> packages are also pending. There is no option to keep as they are.  
> >
> > Not sure I understood this part.  
> 
> So actually packages in package/qt5 doesn't use QT5_QMAKE variable.
> 
> $ git grep bin/qmake package/qt5 | wc -l
> 23
> 
> Shouldn't they refer to QT5_QMAKE if it is kept?

Yes, they probably should, indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
