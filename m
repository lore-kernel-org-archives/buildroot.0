From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 15:52:13 +0100
Subject: [Buildroot] QT5 and EGL display
In-Reply-To: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
References: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
Message-ID: <20151221155213.279e62a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Leonardo Giordano,

On Mon, 21 Dec 2015 10:55:43 -0300, Leonardo Giordano wrote:

> Maybe this is not a pure buildroot question, but I couldn't find any help.
> 
> I'm using buildroot 2015.11 to cross-compile for an Atmel board.
> I enabled QT5, and then mesa3d to enable Qt widgets.

mesa3d will give a pretty poor performance, because on an Atmel
platform, there is no GPU, so it will be a fully software based
implementation of OpenGL.

> But when I tried to run a simple QT application, I got the following
> message:
> 
> #./App
> Could not open egl display
> Aborted
> #

You forgot to enable EGL in mesa3d, probably ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
