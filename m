From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Aug 2017 09:57:37 +0200
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <20170812094839.70a0c4b1@tux.kirchner>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner>
 <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner>
Message-ID: <20170812095737.58da25f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 09:48:39 +0200, Bj?rn Kirchner wrote:

> > There is -m32, so it's trying to build a 32 bit binary on your x86_64
> > machine...
> >   
> > > -Wno-unused-local-typedefs -Wno-maybe-uninitialized
> > > -Wno-missing-field-initializers -Wno-unused-parameter -O3 -fno-ident
> > > -fdata-sections -ffunction-sections -fno-threadsafe-statics
> > > -fvisibility-inlines-hidden -std=gnu++11 -fno-rtti -fno-exceptions
> > > -Wno-deprecated -Wno-narrowing
> > > -c ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.cc
> > > -o v8_snapshot/obj/v8/mkpeephole/bytecode-operands.o In file
> > > included from /usr/include/c++/4.9/ios:38:0,
> > > from /usr/include/c++/4.9/ostream:38,
> > > from ../../3rdparty/chromium/v8/src/globals.h:11,
> > > from ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.h:8,
> > > from ../../3rdparty/chromium/v8/src/interpreter/bytecode-operands.cc:5: /usr/include/c++/4.9/iosfwd:38:28:
> > > fatal error: bits/c++config.h: No such file or directory #include
> > > <bits/c++config.h> ^ compilation terminated.  
> > 
> > ... but you don't have the 32 bit development headers installed.  
> 
> You were absolutely right. After installing the missing headers,
> compilation finished without errors. Thanks.

But still, we need to resolve this:

 * Why qtwebengine builds this application for 32 bit ?

 * If it really needs to do so (which would be weird), then qtwebengine
   should select BR2_HOSTARCH_NEEDS_IA32_COMPILER

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
