From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 8 Oct 2015 11:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <1444257869.12599.3.camel@embedded.rocks>
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
 <1444257869.12599.3.camel@embedded.rocks>
Message-ID: <561636D7.9080709@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On 10/08/15 00:44, J?rg Krause wrote:
> No need for patch #2 and #3 from 0.12.x?

Not when using our cross environment...
Running on an up-to-date Archlinux system.
The (unmodified) patches don't apply cleanly as well.

> Additionally, this package does not compile with the Sourcery CodeBench
> x86/x86_64 2012.09 toolchain:
> 
>     In file included from ../src/js_stream.h:6:0,
>                      from ../src/js_stream.cc:1:
>     ../src/stream_base.h:218:11: error: looser throw specifier for
>     'virtual node::StreamBase::~StreamBase()'
>     ../src/stream_base.h:134:11: error:   overriding 'virtual
>     node::StreamResource::~StreamResource() noexcept (true)'
>     In file included from ../src/js_stream.cc:1:0:
>     ../src/js_stream.h:17:3: error: looser throw specifier for 'virtual
>     node::JSStream::~JSStream()'
>     In file included from ../src/js_stream.h:6:0,
>                      from ../src/js_stream.cc:1:
>     ../src/stream_base.h:218:11: error:   overriding 'virtual
>     node::StreamBase::~StreamBase() noexcept (true)'
>     node.target.mk:146: recipe for target
>     '/home/joerg/Development/git/buildroot/output/build/nodejs
>     -4.1.2/out/Release/obj.target/node/src/js_stream.o' failed
>     make[2]: ***
>     [/home/joerg/Development/git/buildroot/output/build/nodejs
>     -4.1.2/out/Release/obj.target/node/src/js_stream.o] Error 1
>     make[2]: *** Waiting for unfinished jobs....
>     make[2]: Leaving directory
>     '/home/joerg/Development/git/buildroot/output/build/nodejs
>     -4.1.2/out'
>     Makefile:45: recipe for target 'node' failed
>     make[1]: *** [node] Error 2
>     make[1]: Leaving directory
>     '/home/joerg/Development/git/buildroot/output/build/nodejs-4.1.2'
>     package/pkg-generic.mk:156: recipe for target
>     '/home/joerg/Development/git/buildroot/output/build/nodejs
>     -4.1.2/.stamp_built' failed
>     make: *** [/home/joerg/Development/git/buildroot/output/build/nodejs
>     -4.1.2/.stamp_built] Error 2
> 
> Maybe gcc > 4.7 required?

I think so, I am using:

gcc version 4.9.3 20141031 (prerelease) (Linaro GCC 2014.11)
from
gcc-linaro-arm-linux-gnueabihf-4.9-2014.07_linux


regards,

Jaap Crezee
