From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 18 Sep 2016 22:56:17 +0200
Subject: [Buildroot] [PATCH 0/2] Openjpeg: Fix autobuild issues - static
	compilation
Message-ID: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For Static libraries, let openjpeg build third party libraries lzma,tiff,etc.
Add Cmake directives to find pthreads and link against pthread libs by default

m68k | openjpeg-2.1 | http://autobuild.buildroot.net/results/2ca3e1b0eaadaf0cf5bf2fde756163ac5786a21c
arm  | openjpeg-2.1 | http://autobuild.buildroot.net/results/5d1184052e1cc7e9da1244d23c5932de4ad0c435
sh4  | openjpeg-2.1 | http://autobuild.buildroot.net/results/6e36f1ab549bd130ebbc6178576a7cfb2e5fe5ad

Olivier Schonken (2):
  Openjpeg: Add patch to enable finding pthreads library by default
  Openjpeg: Build third party dependencies for static library

 ...eLists-to-include-finding-of-pthreads-by-.patch | 49 ++++++++++++++++++++++
 package/openjpeg/openjpeg.mk                       |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch

-- 
2.7.4
