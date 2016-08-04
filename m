From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 4 Aug 2016 11:54:19 +0200
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
In-Reply-To: <CAMWiJUtJa4ppP3gdneeCYwtuxx4ba2w02MTjjWC7cmiUZgdGMw@mail.gmail.com>
References: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
 <20160802213044.264e63f8@free-electrons.com>
 <CAMWiJUs2371W5JZGnDuAozTCKUHKQtoU+V1hrb1rHKsh=nG6DA@mail.gmail.com>
 <20160803115341.21a3018b@free-electrons.com>
 <CAAMH-yvnsS7vq=XS_E0iLaRV-XZi2aQkHSKujn5FuZ5kK5=dug@mail.gmail.com>
 <CAMWiJUtJa4ppP3gdneeCYwtuxx4ba2w02MTjjWC7cmiUZgdGMw@mail.gmail.com>
Message-ID: <CAAMH-ysPacctbWpfsCLBbNm4EsJ4zOd2swtRmRbLRa-o4Hkg2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Aug 3, 2016 at 5:42 PM, Zhaozhou Meng <mengzhaozhou@gmail.com> wrote:
> Thanks for the infomations that help me a lot.
>
> Not really for using the QT eglfs under X11.
> I know it will override the X11 if I do that, the elgfs is setted fullscreen
> display, beside that, is there other reason that I wouldn't be able to use
> it ?

Please read the EGLFS definition from Qt documentation:
http://doc.qt.io/qt-5/embedded-linux.html

"EGLFS is a platform plugin for running Qt5 applications on top of EGL
and OpenGL ES 2.0 without an actual windowing system (like X11 or
Wayland)."

The reason is that the windowing system such as X11 leverages the
available GPU/graphics libraries (in this case the Vivante GPU3D) so
EGLFS cannot access it at the same time.

Regards,
Gary
