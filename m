From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 21 Nov 2017 10:25:46 +1100
Subject: [Buildroot] [PATCH] kvm-unit-tests: Bump version
In-Reply-To: <20171120054840.22149-1-cyrilbur@gmail.com>
References: <20171120054840.22149-1-cyrilbur@gmail.com>
Message-ID: <1511220346.6880.0.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-11-20 at 16:48 +1100, Cyril Bur wrote:
> Since binutils commit 1a9ccd70f9a7 ("Fix the linker so that it will not
> silently generate ELF binaries with invalid program headers. Fix readelf
> to report such invalid binaries.") the behaviour has changed and
> binutils tries to create a program header segment for which there is no
> space. Thanks to Nicholas Piggin and his patch to Linux:
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=ff45000fcb56b5b0f
> 
> Cedric fixed this in kvm-unit-tests commit 95062c20790d ("powerpc: add
> -n to LDFLAGS") so bump to that version.
> 
> Fixes:
> http://autobuild.buildroot.net/results/80825b492abf61313637b109d6a0944b38d5f739
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Thanks for the fixups Thomas!

> ---
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index 0ddb017802..767e855d26 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KVM_UNIT_TESTS_VERSION = 5731572b2ac23eb410732110b93425b5bb7f27dd
> +KVM_UNIT_TESTS_VERSION = 95062c20790d82713bfa7475b61a4adef3f3645a
>  KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
>  KVM_UNIT_TESTS_SITE_METHOD = git
>  KVM_UNIT_TESTS_LICENSE = LGPLv2
