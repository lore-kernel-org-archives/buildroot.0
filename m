From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 8 Aug 2016 12:47:55 +0200
Subject: [Buildroot] imx6 platform var-som-solo
In-Reply-To: <CALtfCQZKkumEfrgO8nVJXVtYmwdd=5WS-mY+j-mYDBhhTNyfUQ@mail.gmail.com>
References: <CALtfCQZz4Pc9mhwr=7t37oyty-KWCPRackStkV67H6rSeu+1Gw@mail.gmail.com>
 <20160804141405.70e0e848@free-electrons.com>
 <CALtfCQZKkumEfrgO8nVJXVtYmwdd=5WS-mY+j-mYDBhhTNyfUQ@mail.gmail.com>
Message-ID: <CALtfCQYj4jsEqf1=gXy0Oaq9YurVad0WqB=JoSFiFi_LTf0POQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've found this link on the internet:
http://autobuild.buildroot.org/results/30f/30ffecf996fcfbce01e0c1e5d0f012b47b4fa0be/build-end.log

With a date:

30ffecf996fcfbce01e0c1e5d0f012b47b4fa0be/ 2016-Jul-02 11:37:58 -   Directory

So this problem seems to be known, isn't it?

-----------------------
...
t.o .obj/qgraphicsscene.o .obj/qgraphicsscene_bsp.o
.obj/qgraphicsscenebsptreeindex.o .obj/qgraphicssceneevent.o
.obj/qgraphicssceneindex.o .obj/qgraphicsscenelinearindex.o
.obj/qgraphicstransform.o .obj/qgraphicsview.o .obj/qgraphicswidget.o
.obj/qgraphicswidget_p.o .obj/qgraphicslayoutstyleinfo.o
.obj/qgraphicsgridlayoutengine.o .obj/qsimplex_p.o
.obj/qgraphicsanchorlayout_p.o .obj/qgraphicsanchorlayout.o
.obj/qsystemtrayicon.o .obj/qcolormap.o .obj/qcompleter.o .obj/qscroller.o
.obj/qscrollerproperties.o .obj/qflickgesture.o .obj/qundogroup.o
.obj/qundostack.o .obj/qundoview.o .obj/qsystemtrayicon_qpa.o
.obj/qguistatemachine.o .obj/qkeyeventtransition.o
.obj/qmouseeventtransition.o .obj/qbasickeyeventtransition.o
.obj/qbasicmouseeventtransition.o .obj/qgraphicseffect.o
.obj/qpixmapfilter.o .obj/qrc_qstyle.o .obj/qrc_qmessagebox.o
 -L/home/oscargomez/GIT/imx6-variscite/buildroot-2016.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-L/home/oscargomez/GIT/imx6-variscite/buildroot-2016.05/output/build/qt5base-5.6.1-1/lib
-lQt5Gui -lQt5Core -lrt -ldl -lpthread -lgobject-2.0 -lglib-2.0 -lXext
-lX11 -lm -lGLESv2 -lEGL
ln -s libQt5Widgets.so.5.6.1 libQt5Widgets.so
ln -s libQt5Widgets.so.5.6.1 libQt5Widgets.so.5
ln -s libQt5Widgets.so.5.6.1 libQt5Widgets.so.5.6
rm -f ../../lib/libQt5Widgets.so.5.6.1
mv -f libQt5Widgets.so.5.6.1  ../../lib/
rm -f ../../lib/libQt5Widgets.so
rm -f ../../lib/libQt5Widgets.so.5
rm -f ../../lib/libQt5Widgets.so.5.6
mv -f libQt5Widgets.so ../../lib/
mv -f libQt5Widgets.so.5 ../../lib/
mv -f libQt5Widgets.so.5.6 ../../lib/
make[2]: *** [sub-src-make_first] Error 2
make[1]: ***
[/home/oscargomez/GIT/imx6-variscite/buildroot-2016.05/output/build/qt5base-5.6.1-1/.stamp_built]
Error 2
make: *** [_all] Error 2
oscargomez at scorpion:~/GIT/imx6-variscite/buildroot-2016.05$
-----------------------

Does anyone know if it solves?

Best regards.

Oscar Gomez Fuente.

On 5 August 2016 at 11:12, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi,
>
> To select imx-gpu-viv I need glibc toolchain with armhf enabled. I already
> have selected glibc but for enable armhf I have to change my Target
> options. I had to enable:
>
> > Target options >
>  [*] Enable VFP extension support
>
> And then it appeared the option EABIhf in Target ABI:
>
> > Target options >
> Target ABI (EABIhf)  --->
>
> And the I selected:
>
> > Target options >
> Floating point strategy (VFPv3)  --->
>
> But then I've got an error to compile qt5:
>
> ----------------------
> qt5base 5.6.1-1 Building
> ...
>                  from eglconvenience/qeglpbuffer_p.h:50,
>                  from eglconvenience/qeglpbuffer.cpp:35:
> ../../include/QtCore/../../src/corelib/kernel/qvariant.h:334:24: warning:
> ?const char* typeToName(int)? declared ?static? but never defined
> [-Wunused-function]
>      static const char *typeToName(int typeId);
>                         ^
> make[4]: *** [.obj/qeglpbuffer.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [sub-platformsupport-make_first] Error 2
> make[2]: *** [sub-src-make_first] Error 2
> make[1]: *** [/home/oscargomez/GIT/imx6-variscite/buildroot-2016.05/
> output/build/qt5base-5.6.1-1/.stamp_built] Error 2
> make: *** [_all] Error 2
> ----------------------
>
> Any suggestion?
>
> Best regards.
>
> Oscar Gomez Fuente
>
> On 4 August 2016 at 14:14, Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com> wrote:
>
>> Hello,
>>
>> On Thu, 4 Aug 2016 13:52:50 +0200, Oscar Gomez Fuente wrote:
>>
>> > I made something similar with the raspberry pi 2B and I didn't have any
>> > problem. I can't find how to select OpenGL and EGL to free the option to
>> > select eglfs.
>>
>> Enable the imx-gpu-viv package, which provides the OpenGL ES and EGL
>> implementation for i.MX6.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160808/50962518/attachment.html>
