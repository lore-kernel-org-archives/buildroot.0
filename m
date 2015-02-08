From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 18:10:51 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
In-Reply-To: <D347304386AE432996658D49AB648DAE@JohanW7>
References: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
 <20150208155730.2a1b569e@free-electrons.com>
 <D347304386AE432996658D49AB648DAE@JohanW7>
Message-ID: <20150208181051.51ff61b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 8 Feb 2015 17:26:41 +0100, Sagaert Johan wrote:

> [7m>>> webkit 1.11.5 Building[27m
> PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buil
> droot12git/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-
> cmake-3.0.2/bin"  /usr/bin/make -j5  -C /home/buildroot12git/output/build/webkit-1.11.5/
> make[1]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
>   GEN      generate-webkit2-forwarding-headers
>   GEN      DerivedSources/JavaScriptCore/LLIntAssembly.h
> offlineasm: Parsing ./Source/JavaScriptCore/llint/LowLevelInterpreter.asm and Programs/LLIntOffsetsExtractor and creating assembly
> file DerivedSources/JavaScriptCore/LLIntAssembly.h.
> offlineasm: No magic values found. Skipping assembly file generation.
>   GEN      generate-webkit2-forwarding-headers
> /usr/bin/make  all-am
> make[2]: Entering directory `/home/buildroot12git/output/build/webkit-1.11.5'
> /bin/mkdir -p ./.deps/DerivedSources
>   CXXLD    Programs/jsc-1
>   CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNodeList.o
>   CC       Source/JavaScriptCore/API/tests/Programs_minidom-JSNode.o
>   CC       Source/JavaScriptCore/API/tests/Programs_minidom-NodeList.o
>   CXXLD    libwebkitgtk-1.0.la
> In file included from ./Source/WTF/wtf/UnusedParam.h:24:0,
>                  from Source/JavaScriptCore/API/tests/JSNodeList.c:30:
> ./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token In file included from
> ./Source/WTF/wtf/UnusedParam.h:24:0,
>                  from Source/JavaScriptCore/API/tests/JSNode.c:33:
> ./Source/WTF/wtf/Platform.h:301:1: error: expected identifier or '(' before '/' token

Can you re-run the build with 'make V=1', so that we see the full
command line that leads to this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
