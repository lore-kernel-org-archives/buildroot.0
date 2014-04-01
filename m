From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 23:20:57 +0200
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: is a full-openGL
 provider if X.org is present
In-Reply-To: <533B1E13.9020200@crapouillou.net>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <7b289a2d0fd88d16d66a9ce87db4a3a43821c630.1396302677.git.yann.morin.1998@free.fr>
 <533A6F37.9050805@crapouillou.net> <20140401181437.GA3291@free.fr>
 <533B1E13.9020200@crapouillou.net>
Message-ID: <20140401212057.GA1278@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2014-04-01 22:14 +0200, Paul Cercueil spake thusly:
> On 01/04/2014 20:14, Yann E. MORIN wrote:
> >I have to admit I am a bit lost in all this mess... :-(
> 
> It works like this: regular OpenGL only works with DRI drivers, and DRI
> drivers are only usable under X11.
> Which means that all DRI drivers should depend on XORG7 (even the swrast
> one), and they should all select OpenGL.
> 
> Gallium drivers are meant to be used with EGL and OpenGL ES, and only some
> of them can be used under X11 using a DRI compatibility layer (for instance,
> "nouveau" in Mesa is both a Gallium and a DRI driver). But they should also
> all work fine without X11, and will support Wayland, which is not the case
> for DRI drivers.

OK, you managed to confuse me yet a bit more! :-)

So, to sum-up our discussion on IRC, so everyone can follow:

  - mesa3d has two types of drivers: Gallium drivers, and DRI drivers

  - Gallium drivers provide EGL and GLES

  - DRI drivers provide full-openGL, and also EGL and GLES

  - for a specific chip, there are two drivers: one Gallium and one DRI

  - some drivers have a DRI wrapper over a Gallium driver, wrapper that
    provides DRI via the Gallium driver

  - X11 needs a DRI driver

  - Gallium are used for non-X11 display (eg. directfb, a wayland
    compositor...)

Is the above a proper summary of what you explained me on IRC?

I'll wait for your reply before I lay out my proposal for fixing mesa3d
support in Buildroot, because if any of the above is wrong, my prioposal
would be wrong.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
