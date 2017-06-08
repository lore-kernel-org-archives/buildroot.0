From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:48:28 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170608194451.GT26922@waldemar-brodkorb.de>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com>
 <20170607212720.GA23160@scaer>
 <20170608194451.GT26922@waldemar-brodkorb.de>
Message-ID: <20170608214828.291c2721@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 21:44:52 +0200, Waldemar Brodkorb wrote:

> > On principle, I agree that we should drop versions. But glibc is part of
> > the toolchain, and the toolchain has always been special.  
> 
> It is special, but if we can reduce the whole sum of combinations,
> isn't that good? In case of C library, it seems to me that the
> lastest version is always the best one. There are fewer regressions
> then with changing binutils or gcc default.

Yes, that's true.

> > musl is another kind of thing, because it is (was?) moving relatively
> > fast, and I am under the impression that the maintainers are somewhat
> > amenable to some fixes.
> > 
> > Not so much for glibc in my experience...  
> 
> I am reading both mailinglists so at least I sometimes fishing
> interesting bugfixes, as for the sh4 issue.
> 
> If Thomas don't mind I would take musl also over. (DEVELOPERS file)

I don't mind at all. Especially since:

 - Buildroot doesn't have a notion of "taking over". Indeed, multiple
   developers can be listed for a given package in the DEVELOPERS file.

 - In practice, issues with C libraries are rarely reported by the
   autobuilders as being on the C library package itself. It's often
   another package that will fail to build (last example: gdbm).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
