From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 16:06:36 +0200
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
 <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
 <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
 <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
Message-ID: <20160707160636.505b2da4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 22:55:36 +0900, Akihiko Odaki wrote:

> I think those packages are not meant to be built for the host.

QT5_QMAKE is a variable meant to built qmake-based packages for the
target. It has never been intended to build qmake-based packages for
the host.

Which qmake-based package do you need to build for host? Notice that we
do not build qt5 for the host, so in order to build qmake-based
packages for the host, you would first have to create a host-qt5base
package, which is going to cause a lot of problems down the road.

>  > Python and others already have their own infrastructures so they   
> don't need this kind of stuff.
> 
> You mean package/pkg-*.mk by the infrastructures? Many packages 
> depending on Python don't use package/pkg-python.mk and specify the path 
> in their -.mk.
> 
> $ git grep bin/python | wc -l
> 93

Using Python and being a Python package are completely different things.

The Python package infrastructure is used by Python modules that use
distutils or setuptools.

But besides that, lots of packages use Python in their build process,
even if they are not at all Python modules.

> The variable is not used in Qt packages and they will need to be 
> modified to use the variable if it is kept. My patches to add a few Qt 
> packages are also pending. There is no option to keep as they are.

Not sure I understood this part.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
