From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 21 Nov 2017 10:27:32 +1100
Subject: [Buildroot] [PATCH] kvm-unit-tests: Bump version
In-Reply-To: <20171120221404.256dc295@windsurf.lan>
References: <20171120054840.22149-1-cyrilbur@gmail.com>
 <20171120221404.256dc295@windsurf.lan>
Message-ID: <1511220452.6880.2.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-11-20 at 22:14 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 Nov 2017 16:48:40 +1100, Cyril Bur wrote:
> > Since binutils commit 1a9ccd70f9a7 ("Fix the linker so that it will not
> > silently generate ELF binaries with invalid program headers. Fix readelf
> > to report such invalid binaries.") the behaviour has changed and
> > binutils tries to create a program header segment for which there is no
> > space. Thanks to Nicholas Piggin and his patch to Linux:
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=ff45000fcb56b5b0f
> > 
> > Cedric fixed this in kvm-unit-tests commit 95062c20790d ("powerpc: add
> > -n to LDFLAGS") so bump to that version.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/80825b492abf61313637b109d6a0944b38d5f739
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I'm not sure how you tested this patch. The change to the hash file was
> missing, and one of the patches in package/kvm-unit-tests/ was not
> applying anymore.
> 
> I've fixed up those issues and applied your patch to the master branch,
> but it'd be nice to have a patch tested a bit better next time :-)
> 
> Thanks!
> 

Yeah sorry, I think I had a really old tree, I use buildroot for so
much I think there was a fail on my part to check the tree. Sorry!

> Thomas
