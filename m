From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 8 Feb 2015 17:26:41 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
In-Reply-To: <20150208155730.2a1b569e@free-electrons.com>
References: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
 <20150208155730.2a1b569e@free-electrons.com>
Message-ID: <D347304386AE432996658D49AB648DAE@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: zondag 8 februari 2015 15:58
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] webkit : fix single line comments

Dear Sagaert Johan,

On Sun,  8 Feb 2015 14:30:20 +0100, Sagaert Johan wrote:
> 
> Single line comments generate an error and break the build.
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

This looks weird. Single line comments are perfectly acceptable in C++ and in C99. What error are you getting, and in which
situation?

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot




Hi 

Found it strange too.
Select target A8 and for fp option select NEON 
I posted this already on 2 feb (subject [Buildroot] target options for Cortex A8/A9)

See below

[7m>>> webkit 1.11.5 Building[27m
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buil
droot12git/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-
cmake-3.0.2/bin"  /usr/bin/make -j5  -C /home/buildroot12git/output/build/webkit-1.11.5/
make[1]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
  GEN      generate-webkit2-forwarding-headers
  GEN      DerivedSources/JavaScriptCore/LLIntAssembly.h
offlineasm: Parsing ./Source/JavaScriptCore/llint/LowLevelInterpreter.asm and Programs/LLIntOffsetsExtractor and creating assembly
file DerivedSources/JavaScriptCore/LLIntAssembly.h.
offlineasm: No magic values found. Skipping assembly file generation.
  GEN      generate-webkit2-forwarding-headers
/usr/bin/make  all-am
make[2]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
/bin/mkdir -p ./.deps/DerivedSources
  CXXLD    Programs/jsc-1
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNodeList.o
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNode.o
  CC       Source/JavaScriptCore/API/tests/Programs_minidom-NodeList.o
  CXXLD    libwebkitgtk-1.0.la
In file included from ./Source/WTF/wtf/UnusedParam.h:24:0,
                 from Source/JavaScriptCore/API/tests/JSNodeList.c:30:
./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token In file included from
./Source/WTF/wtf/UnusedParam.h:24:0,
                 from Source/JavaScriptCore/API/tests/JSNode.c:33:
./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--------------------------------
make[2]: *** [Source/JavaScriptCore/API/tests/Programs_minidom-JSNodeList.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Source/JavaScriptCore/API/tests/Programs_minidom-JSNode.o] Error 1
/home/buildroot12git/output/build/libglib2-2.42.0/glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged,
use `utimes'
/home/buildroot12git/output/build/libglib2-2.42.0/glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged,
use `utimes'
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libICE.so: warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libxml2.so: warning: gethostbyname is
obsolescent, use getnameinfo() instead.
make[2]: Leaving directory `/home/buildroot12git/output/build/webkit-1.11.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/webkit-1.11.5'
make: *** [/home/buildroot12git/output/build/webkit-1.11.5/.stamp_built] Error 2

Best regards Johan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150208/4b8d9a7b/attachment.bin>
