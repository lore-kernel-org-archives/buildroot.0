From: Andreas Naumann <dev@andin.de>
Date: Thu, 27 Jun 2013 15:57:20 +0200
Subject: [Buildroot] qt5: No SOURCES in qmake created Makefiles
In-Reply-To: <20130618190656.228e7658@skate>
References: <51BF198C.2040405@andin.de> <20130617162213.1fdc7d97@skate>
 <CALo-6+jQ-qjc9HfFwTSUh1x6JQnTtH1XUOo0oX8f4nApVH=L7w@mail.gmail.com>
 <51C07EB6.4080003@andin.de> <20130618190656.228e7658@skate>
Message-ID: <51CC44C0.8020509@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
am a little sorry for the fuzz. This worked out to be a non-issue. Seems 
when using examples from another qt tree, even though absolutely clean 
within the directory, still build options from the folders above get 
picked up.
When I copied it away, in my case to /tmp/analogclock/, compiling with 
buildroots qmake from 5.0.2 works just fine.

cheers,
Andreas


Am 18.06.2013 19:06, schrieb Thomas Petazzoni:
> Dear Andreas Naumann,
>
> On Tue, 18 Jun 2013 17:37:26 +0200, Andreas Naumann wrote:
>
>> In order to reproduce the issue I used the beaglebone_defconfig, changed
>> to linaro toolchain and activated a minimal qt5 set:
>> BR2_PACKAGE_QT5=y
>> BR2_PACKAGE_QT5BASE=y
>> BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>> BR2_PACKAGE_QT5BASE_GUI=y
>> BR2_PACKAGE_QT5BASE_WIDGETS=y
>> BR2_PACKAGE_QT5BASE_LINUXFB=y
>> BR2_PACKAGE_QT5JSBACKEND=y
>>
>> Now I have been going back in revisions and find the problem to start
>> exactly when switching to qt 5.0.2 (d6b2bac qt5: bump to 5.0.2). So I
>> have been looking through the release notes
>> (http://blog.qt.digia.com/blog/2013/04/10/qt-5-0-2-released/) but
>> nothing really rings a bell. But I'm not very knowledgable in the qt
>> build framework.
>
> Ah, ah, this is interesting. I'll try to reproduce and let you know
> what I find.
>
> Thanks,
>
> Thomas
>
