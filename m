From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 10:59:50 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <CAAXf6LXzu+j-xV7nPx200Tj8NAt6x_yrOoOjiEJpZGrCUmkB9g@mail.gmail.com>
References: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
 <20150715105526.19c500e8@free-electrons.com>
 <CAAXf6LXzu+j-xV7nPx200Tj8NAt6x_yrOoOjiEJpZGrCUmkB9g@mail.gmail.com>
Message-ID: <20150715105950.42ac4b53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Jul 2015 10:57:52 +0200, Thomas De Schampheleire wrote:

> Well that is part of the discussion: conceptually I believe that the
> symlink creation is part of the toolchain as a whole. It needs to be
> done before libc, but actually all remaining toolchain components will
> probably rely on it, and also the packages.
> By placing it in gcc-initial I believe it is pretty hidden.

It is also pretty hidden to put the hook for a given package outside of
this package .mk file.

> Moreover, suppose we add support for the llvm/clang compiler. For such
> toolchains, we'd also need the symbolic links, so that code would have
> to be duplicated...

I don't think trying to take llvm/clang into account really makes sense
here. It's probably going to be so much different than what we have
today that lots of things would have to be reworked anyway.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
