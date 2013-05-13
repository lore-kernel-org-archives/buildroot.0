From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 19:19:20 +0200
Subject: [Buildroot] qt5.0.2 build error for qtjsbackend module
In-Reply-To: <CAOvs79_S7jzBFG93vQB-qKEW2JtRYeBu6_UUqTt_sjNezXWJug@mail.gmail.com>
References: <CAOvs79_S7jzBFG93vQB-qKEW2JtRYeBu6_UUqTt_sjNezXWJug@mail.gmail.com>
Message-ID: <20130513191920.14f442f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos de Sa,

On Mon, 13 May 2013 22:36:19 +0530, Carlos de Sa wrote:

> I'm trying to cross-compile build Qt 5.0.2 for a TI AM3359 board using the
> patches from Thomas Pettazoni. The qt5 build system has been modifed quite

Petazzoni :-)

(Yeah, I know getting the number of 't', 'z' and 'n' correct in my name
takes quite a while !)

> a bit from his original layout but the patches, sequence and commands
> are the same.

What do you mean by "it has been modified quite a bit from the original
layout" ? If you're not using the Buildroot code, it means you're
building in a way that is completely unknown to us. In this situation,
how would you want us to help you?

> So far the qtbase, script, svg, xml patterns and image formats modules are
> compiling sucessfully. However when compiling the javascript backend
> "qtjsbackend" the build fails when running a python script -
> 
> python out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/tools/js2c.py
> generated-release/libraries.cpp CORE off
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/src/macros.py
> ../3rdparty/v8/src/runtime.js ../3rdparty/v8/src/v8natives.js
> ../3rdparty/v8/src/array.js ../3rdparty/v8/src/string.js
> ../3rdparty/v8/src/uri.js ../3rdparty/v8/src/math.js
> ../3rdparty/v8/src/messages.js ../3rdparty/v8/src/apinatives.js
> ../3rdparty/v8/src/date.js ../3rdparty/v8/src/regexp.js
> ../3rdparty/v8/src/json.js ../3rdparty/v8/src/liveedit-debugger.js
> ../3rdparty/v8/src/mirror-debugger.js ../3rdparty/v8/src/debug-debugger.js
> python out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/tools/js2c.py
> generated-release/experimental-libraries.cpp EXPERIMENTAL off
> out/build/qt5-5.0.2/qtjsbackend/src/v8/../3rdparty/v8/src/macros.py
> ../3rdparty/v8/src/proxy.js
> ../../bin/mkv8snapshot generated-release/snapshot.cpp
> Extension or internal compilation error at line 0.
> make[4]: *** [generated-release/snapshot.cpp] Segmentation fault
> make[4]: *** Waiting for unfinished jobs....

Would be good to find out which thing is segfaulting here.

> Any help on this would be much appreciated as I need to this compile
> qtdeclarative which depends on this module.

Please let us know which Buildroot version is used (preferably the
latest Git, or 2013.05-rc1, which is the first release that contained
the Qt5 support), and the corresponding Buildroot .config so that we
can reproduce the issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
