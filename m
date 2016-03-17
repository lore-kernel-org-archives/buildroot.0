From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 10:16:51 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: disable rpath via configure option
In-Reply-To: <1458194542-5765-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Thu, 17 Mar 2016 03:02:22 -0300")
References: <1458194542-5765-1-git-send-email-rprebello@gmail.com>
Message-ID: <878u1h79bw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The -rpath option was being stripped from sdl-config via a post install
 > staging hook, but the same wasn't being done for sdl.pc. Because of
 > this, packages that detect SDL via pkg-config ended up passing
 > '-Wl,-rpath,/usr/lib' to the linker, which caused build failures under
 > certain circumstances since libraries were being looked for in the wrong
 > directory.

 > Fix by passing the --disable-rpath option to the SDL configure script,
 > which takes care of disabling -rpath everywhere. This also allows the
 > SDL_FIXUP_SDL_CONFIG hack to be completely removed.

 > Fixes:

 >   http://autobuild.buildroot.net/results/624/62499217eeaf3228b46652e3f65776d7ece8fce6/
 >   http://autobuild.buildroot.net/results/cc1/cc1f78f6c43e3a7bf3ed80d759d9c4d7363d0e48/

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
