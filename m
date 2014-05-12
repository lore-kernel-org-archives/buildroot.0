From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 23:03:45 +0200
Subject: [Buildroot] OpenGL issues affecting the autobuilders
References: <20140512220140.5fe69970@free-electrons.com>
Message-ID: <hip74bxv7r.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140512220140.5fe69970 at free-electrons.com: 

> With the MESA OpenGL implementation
> ===================================
> 
> Pango fails to build, see
> http://autobuild.buildroot.org/results/23f/23f1178838e32832b24354ba99dbb7
> b53763291c/build-end.log. Error is:
> 
> /home/test/test/1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/li
> b/libGLESv2.so: undefined reference to `_glapi_get_dispatch' 
> /home/test/test/1/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/li
> b/libGLESv2.so: undefined reference to `_glapi_Dispatch' 

Hi,

should be fixed by picking

http://patchwork.ozlabs.org/patch/347624/
http://patchwork.ozlabs.org/patch/347621/

from my xbmc patch series. Both patches apply to HEAD.

Regards, Bernd
