From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 16:31:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/webkit: Broken on raspberry pi
In-Reply-To: <1401366393-5815-3-git-send-email-bernd.kuhls@t-online.de>
References: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
 <1401366393-5815-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140529163106.320e2d86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 29 May 2014 14:26:33 +0200, Bernd Kuhls wrote:
> Linking libwebkitgtk-1.0.so fails
> 
> ./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::GLContext()'
> ./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::sharedX11Display()'
> ./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::~GLContext()'
> ./.libs/libwebkitgtk-1.0.so: undefined reference to `WebCore::GLContext::makeContextCurrent()'
> 
> This link error occurred after fixing the configure problem
> http://autobuild.buildroot.net/results/bc0/bc0f9114f9dacf68a510f1e01f2dc3661c34f536/
> 
> webkit-1.x apparently is missing support for raspberry pi.

What makes you think this is RasberryPi specific? It looks more like
the OpenGL support in libwebkitgtk assumes it's OpenGL under X.org, and
not OpenGL with EGL, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
