From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 01 Apr 2014 12:05:32 +0200
Subject: [Buildroot] qt5, eglfs and xcb
In-Reply-To: <20140330172128.06f1d5d2@skate>
References: <5338207F.9010807@gmail.com> <20140330172128.06f1d5d2@skate>
Message-ID: <533A8F6C.1010606@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Il 30/03/2014 17:21, Thomas Petazzoni ha scritto:
> As explained above, this requires more than just XCB, contrary to what 
> the company you requested support from is claiming. You need an OpenGL 
> implementation that works under X.org, and this implementation is 
> usually Mesa. And the support for making Mesa recognized as a proper 
> OpenGL implementation has only been merged since yesterday, and is not 
> yet completely ready. It would certainly be interesting to fix this in 
> Buildroot and allow Qt5 to build for X.org with OpenGL support. 


Ok, as far as I understand it means nobody has successfully compiled Qt5 
+ webkit + xcb + mesa yet.
Perhaps, people use only the framebuffer with buildroot.


> But if you want this to happen, you should either: 1) Do it yourself. 
> 2) Wait for someone else to do it, but then you can't expect any 
> particular deadline or guarantees. It may be something that will get 
> done this summer as part of the Google Summer of Code. 3) Hire a third 
> party to do it. Actually, it's a little bit strange that you've asked 
> a company who isn't able to fix the problem in Buildroot, rather than 
> a company that actually is able to do it. 


Unfortunately we have a dead-line for our project and my knowledge is 
too small to do it myself. I'm going for the third option, but with 
another company :-)


> BTW, what is your hardware platform? What type of graphics hardware 
> are you using? What X.org driver are you using? Anyway, thanks for the 
> report, this is definitely something that should be improved. Thomas 

We're using a Freescale iMX6 MARS board, with the modular X.org server.
As drivers, I selected:

xf86-input-evdev
xf86-input-keyboard
xf86-input-mouse
xf86-input-tslib
xf86-video-fbdev

because I don't know which other video driver I should select for my 
platform...

Best regards
Marco
