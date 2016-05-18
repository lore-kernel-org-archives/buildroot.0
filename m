From: Anatoly Asviyan <aanatoly@gmail.com>
Date: Wed, 18 May 2016 15:15:57 +0300
Subject: [Buildroot] building qt5webengine
Message-ID: <CAPTQzAD5Kugi=Aov5bW-L=oyypo15OJFsTNkvt=YSyAeScox+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I have succeeded to build qt5webengine for imx6. I've started from Julien
Corjon patch and added the following:

   - compile host python with bz2
   - compile target code with -std=c++11 flag
   - compile host code without that flag
   - hint gyp/ninja voodoo to do Unix build (it should be auto detected,
   but it does not)
   - inject missing V4L2 enum (it exists in my kernel headers but not in
   toolchain's /usr/include/linux)

I've tried to do above things in a clean way, by changing *.pro or *.gyp
files. but it did not worked, so I ended up with an ugly hack.

Todo

   - do above steps in a clean way
   - configure qt5webengine to use BR2's  ssl, ffmpeg and icu and not its
   own copies. This is specifically important for me, since I have patched
   ffmpeg


Patch: https://gist.github.com/aanatoly/76a2310d41d797d266700c70f0890de7

-- 
Regards, Anatoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160518/28c228bc/attachment.html>
