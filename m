From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Mon, 21 Dec 2015 12:14:17 -0300
Subject: [Buildroot] QT5 and EGL display
In-Reply-To: <20151221155213.279e62a5@free-electrons.com>
References: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
 <20151221155213.279e62a5@free-electrons.com>
Message-ID: <CAFMv-cx3j+MKFCfyuQ0nYRLdd64Q-WMD_L_Vbv_arMepbP8Ozw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for replying. So glad to have an email from you (I have been
reading lots of info you published).

EGL is enabled at mesa3d. Compilation failed but I proceed according to:
http://lists.busybox.net/pipermail/buildroot/2014-June/100044.html
and its reply:
http://lists.busybox.net/pipermail/buildroot/2014-June/100045.html

Anyway, which would be the best approach for using QT5 on an Atmel board
(no gpu) in your opinion? The applications we usually do, just need a
simple interface (I mean we don't do games or multimedia apps).

Regards,
Leonardo


2015-12-21 11:52 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Leonardo Giordano,
>
> On Mon, 21 Dec 2015 10:55:43 -0300, Leonardo Giordano wrote:
>
> > Maybe this is not a pure buildroot question, but I couldn't find any
> help.
> >
> > I'm using buildroot 2015.11 to cross-compile for an Atmel board.
> > I enabled QT5, and then mesa3d to enable Qt widgets.
>
> mesa3d will give a pretty poor performance, because on an Atmel
> platform, there is no GPU, so it will be a fully software based
> implementation of OpenGL.
>
> > But when I tried to run a simple QT application, I got the following
> > message:
> >
> > #./App
> > Could not open egl display
> > Aborted
> > #
>
> You forgot to enable EGL in mesa3d, probably ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151221/3e9aa427/attachment.html>
