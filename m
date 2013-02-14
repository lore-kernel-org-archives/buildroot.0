From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 14 Feb 2013 17:14:52 +0000
Subject: [Buildroot] [git commit] libffi: switch to using a Git version,
 brings Microblaze and Xtensa support
In-Reply-To: <20130205150055.C510A9A987@busybox.osuosl.org>
References: <20130205150055.C510A9A987@busybox.osuosl.org>
Message-ID: <CAG2jQ8iKxtdxCTc2DyMTy-3naNtQjWRdonxP8u0e7tVF0tsecA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 February 2013 14:57, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ddd69b5609cc9bd954afcfc2f91831d64b9cfff7
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> We already had backported patches for the Blackfin and AArch64
> support, and now we would have needed to also backport the Xtensa
> support and the Microblaze support. This starts to get crazy.
>
> Let's switch to using a Git version from Github, until libffi finally
> releases a new stable version.
>
> In order to achieve this, we also need to:
>
>  * autoreconf the package, so that a libffi.pc file gets generated
>
>  * manually install the libffi.pc file, because it doesn't get
>    installed by libffi Makefile, for some reason
>
>  * remove the part of the target post install hook that was messing
>    with libffi.pc, since it was modifying the one in STAGING_DIR
>    (which is odd for a target post install hook), and the libffi.pc
>    file is anyway not installed to the target anymore.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  .../libffi-0001-Add-support-for-Blackfin.patch     | 1044 ---------
>  ...fi-0002-Add-aarch64-support-from-upstream.patch | 2326 --------------------
>  package/libffi/libffi.mk                           |   29 +-
>  3 files changed, 23 insertions(+), 3376 deletions(-)
>
> Patch is too large, so refusing to show it
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Peter,

A new libffi is released[1]. Maybe we should revert to the old
Makefile now that a new version is out?
I can provide a patch if needed.

[1] ftp://sourceware.org/pub/libffi/libffi-3.0.12.tar.gz

-- 
Regards,
Markos Chandras
