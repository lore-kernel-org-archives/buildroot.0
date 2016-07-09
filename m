From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 9 Jul 2016 14:25:33 +0200
Subject: [Buildroot] [Patch v2 3/3] rust: new package
In-Reply-To: <78101ffb-56d4-75be-465a-69b1a236798c@gmail.com>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-4-git-send-email-eric.le.bihan.dev@free.fr>
 <78101ffb-56d4-75be-465a-69b1a236798c@gmail.com>
Message-ID: <20160709142533.5d4e34b6@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Tue, 5 Jul 2016 12:11:13 +0200,
Romain Naour <romain.naour@gmail.com> a ?crit :

> Le 24/06/2016 ? 21:46, Eric Le Bihan a ?crit :
> > This new package provides the compiler for the Rust programming
> > language.
> > 
> > Currently, only the host variant is built.
> > 
> > The internal build process is as follows:
> > 
> >  1. rustc-stage0, provided by rust-bootstrap, is used to build
> >     rustc-stage1.
> >  2. rust-stage1 builds the final Rust compiler (rust-stage2)
> >     and the standard library for the host architecture.
> >  3. the standard library for the target architecture is build.
> > 
> > The Rust compiler uses LLVM as its backend, compiled with support
> > for x86, ARM, PowerPC and MIPS architectures.  
> 
> rust build it's own bundled copy of llvm if it's not available on the
> host. If host-rust require a llvm compiler we need to add llvm
> support in Buildroot first.
> 
> I have some WIP patches about llvm/clang, if you want to take a look:
> https://github.com/RomainNaour/buildroot/tree/clang-llvm

Indeed, having host-rust depends on host-llvm may be added later.
AFAIK, the copy of LLVM bundled in Rust only contains optimizations. In
any case, a version of LLVM/clang will have to be built and this takes a
very long time... Maybe disabling support for some architectures
will speed it up (I haven't checked). I'll try your patch.

Regards,

-- 
ELB
