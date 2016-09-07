From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 07 Sep 2016 17:51:10 +0200
Subject: [Buildroot] Problem with qt5webkit on ARM?
In-Reply-To: <FD3EC9758442224FA81FA20FD6F1AE8C64833190@mx01.dti.lan>
References: <FD3EC9758442224FA81FA20FD6F1AE8C64833190@mx01.dti.lan>
Message-ID: <1589997.cMmLFOyjqE@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

On Tuesday 06 September 2016 02:39:21 Allan Chandler wrote:
> We are trying to get the qt5webkit (5.5.0 from BR 2015.11) package
> running on an iMX6 device and we're getting asserts from the code.
> 
> Originally, I thought it may be our application (a cut-down browser)
> but it appears the browser in the qt5webkit-examples package has
> exactly the same issue.
> 
> It manifests itself with the output (the last section is the important
> one): =====
> QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2
> to enable double buffering and vsync. If this is not desired, you can
> override this via: export QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
> 
> Unable to query physical screen size, defaulting to 100 dpi.
> To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and
> QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).

I have not tested Qt + EGLFS + iMX6 since a while, but I remember that I 
have felt it was not stable enough to be used on real projects. Maybe 
things are better now. However, I suggest to try Xorg backend, if it is 
possible.

BR,

-- 
J?r?me Pouiller, Sysmic
Expert Linux Embarqu?
