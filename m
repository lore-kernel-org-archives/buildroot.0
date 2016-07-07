From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Thu, 7 Jul 2016 22:55:36 +0900
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
 <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
 <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 2016-07-07 16:29, Julien CORJON wrote:
 > Hi Akihiko,
 >
 > -----Message d'origine-----
 > De : buildroot [mailto:buildroot-bounces at busybox.net] De la part de 
Akihiko Odaki
 > Envoy? : jeudi 7 juillet 2016 01:25
 > ? : buildroot at buildroot.org
 > Cc : Thomas Petazzoni
 > Objet : Re: [Buildroot] qt5: QT5_QMAKE spec bug
 >
 > ping
 >
 > On 2016?06?28? 18:16, Akihiko Odaki wrote:
 >> Hi,
 >>
 >> I was trying to use QT5_QMAKE variable for a new package.
 >> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/152724
 >>
 >> However, it failed to build. I found that it failed because -spec
 >> option for cross compiling was applied for host_build. It can be fixed
 >> by setting the value to QMAKE_XSPEC in qmake configuration instead of
 >> using the option.
 >>
 >
 > This is weird, QT5_QMAKE variable is already used in others packages 
(e.g. QWT, qt-webkit-kiosk).
 > If your fix work you could also change qt5xxx packages to use this 
variable instead of full path $(HOST_DIR)/usr/bin/qmake

I think those packages are not meant to be built for the host.

 >> I'm making a patch to apply the change, but I have a question. Now
 >> QT5_QMAKE variable has the path to qmake, but there are no variables
 >> to indicate the path for other commands such as python. Should I
 >> remove QT5_QMAKE variable or keep as it is?
 >
 > Python and others already have their own infrastructures so they 
don't need this kind of stuff.

You mean package/pkg-*.mk by the infrastructures? Many packages 
depending on Python don't use package/pkg-python.mk and specify the path 
in their -.mk.

$ git grep bin/python | wc -l
93

I have not checked other commands, but I guess there are similar codes 
for other commands. That's the reason I wonder if I should use the 
variable or not.

 > I suggest to keep it as is until someone implement an infrastructure 
for Qt ;-)

The variable is not used in Qt packages and they will need to be 
modified to use the variable if it is kept. My patches to add a few Qt 
packages are also pending. There is no option to keep as they are.

Regards,
Akihiko Odaki
