From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 18 Jun 2008 11:18:12 +1000
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <87fxrcmazj.fsf@macbook.be.48ers.dk>
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
	<87ej6wwmxw.fsf@macbook.be.48ers.dk>
	<20080617104754.GA25850@cloud.net.au>
	<87fxrcmazj.fsf@macbook.be.48ers.dk>
Message-ID: <20080618011812.GE4283@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2008 at 03:45:04PM +0200, Peter Korsgaard wrote:
>  Hamish> Well I've got one board ("tools", in
>  Hamish> local/tools/tools.config) to build the toolchain which I then
>  Hamish> use as external toolchain to build several other boards (all
>  Hamish> armeb-linux-uclibcgnu). So my toolchain lives in the staging
>  Hamish> directory in the same tree.
> 
> So they all put libraries / headers in the same staging_dir? Doesn't

Yes.

> that give problems with packages detecting optional stuff at compile
> time that might not be available for a specific variant (E.G. one
> variant has expat, and another doesn't - Some configure script checks
> for expat and finds it in staging_dir even though it isn't going to be
> there at runtime).

Good point. So far all my boards are very similar so this hasn't been a
problem, but that won't always be the case.

IMHO this is a flaw of the project support - everything should be built
into a project-specific directory. Currently only the kernel and busybox
are built in project_build_$arch.

How would everyone react to a patch which redefines BUILD_DIR to match
PROJECT_BUILD_DIR, ie each project would have
project_build_$arch/$project/staging_dir etc?

I think Ulf commented in the past that he doesn't want to waste the time
spent compiling each package for each board separately, but that seems
to be the only way to do it correctly.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
