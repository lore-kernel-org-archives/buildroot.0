From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Tue, 9 Apr 2013 18:02:31 +0530
Subject: [Buildroot] Building Webkit 1.10.2 using buildroot hangs at
 "Installing to staging Directory"
Message-ID: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am in the procees of building webkit 1.10.2 using buildroot.
I use --disable-jit as config option.
Building goes fine till it reaches staging directory. Once it reaches
"Installing to  staging Directory", it hangs.
Please find the below logs
>>> webkit 1.10.2 'Installing to staging directory'
/usr/bin/make -j9 DESTDIR=<Staging-DIR> install -C <Webkit-Build-Dir>
  GEN    generate-webkit2-forwarding-headers
  GEN    generate-webkittestrunner-forwarding-headers
  GEN    generate-testwebkitapi-forwarding-headers
  GEN    DerivedSources/JavaScriptCore/LLIntAssembly.h
offlineasm: Parsing
./Source/JavaScriptCore/llint/LowLevelInterpreter.asm and
Programs/LLIntOffsetsExtractor and creating assembly file
DerivedSources/JavaScriptCore/LLIntAssembly.h.
offlineasm: No magic values found. Skipping assembly file generation
assuming the classic interpreter is enabled.
  GEN    generate-webkittestrunner-forwarding-headers
  GEN    generate-testwebkitapi-forwarding-headers
  GEN    generate-webkit2-forwarding-headers
/usr/bin/make  install-am
/bin/mkdir -p ./.deps/DerivedSources


I debugged and tried putting a slash after "$(am__objects_39) " as
below in Webkit's GnuMakefile. Then the build passes succesfully.
am__objects_39 =
Source/JavaScriptCore/jit/libjavascriptcoregtk_1_0_la-ExecutableAllocatorFixedVMPool.lo
am__objects_40 = \
    Source/JavaScriptCore/API/libjavascriptcoregtk_1_0_la-JSBase.lo \
    Source/JavaScriptCore/API/libjavascriptcoregtk_1_0_la-JSCallbackConstructor.lo
\
    :
        :
        :
        :
    Source/JavaScriptCore/yarr/libjavascriptcoregtk_1_0_la-YarrJIT.lo \
    Source/JavaScriptCore/yarr/libjavascriptcoregtk_1_0_la-YarrPattern.lo \
    Source/JavaScriptCore/yarr/libjavascriptcoregtk_1_0_la-YarrSyntaxChecker.lo
\
    $(am__objects_39) \{Slash added here}
am_libjavascriptcoregtk_1_0_la_OBJECTS =  \
    $(am__objects_40)

I want to resolve it by changing from .am file. Also i would like to
know the rootcause of this issue. Please help me on this.


-- 
Warm Regards,
BS_Chauhan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130409/ebced65f/attachment.html>
