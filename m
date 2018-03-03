From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sat, 3 Mar 2018 08:09:27 +0000
Subject: [Buildroot] [PATCH] Fix "Incorrect selection of kernel headers:
 expected 4.11.x, got 4.15.x" for qemu_x86_64_defconfig
In-Reply-To: <878tb9d23y.fsf@dell.be.48ers.dk>
References: <20180303072704.11166-1-ciro.santilli@gmail.com>
 <878tb9d23y.fsf@dell.be.48ers.dk>
Message-ID: <CAFXrp_co-hTv-3tztgWrL2326BwAGXma-wVMD5aRN8OZrBqTgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 3, 2018 at 7:56 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Ciro" == Ciro Santilli <ciro.santilli@gmail.com> writes:
>
> Committed, thanks.
>
> We normally prefix the first commit line with the file/area touched
> instead of suffixing it. It is also nice to explain what commit
> introduced the issue.
>
> You also added a bugzilla entry for this, so it is nice to reference it
> here.
>
> You should add your signed-off-by (git commit -s) to commits. As this is
> such a trivial change I did took the liberty to do so for this commit,
> hopefully that is OK?
>
> For more details, see the manual:
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
> Committed with these minor changes, thanks!
>

Thanks, Peter.

Sorry for the multiple posts and bad practices, I'm learning the
obscure arts of mailing list patches now, I'll keep those in mind for
future contribs.

>  > ---
>  >  configs/qemu_x86_64_defconfig | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
>  > index 92a196790d..b92ae17ae6 100644
>  > --- a/configs/qemu_x86_64_defconfig
>  > +++ b/configs/qemu_x86_64_defconfig
>  > @@ -9,8 +9,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>  >  BR2_TARGET_ROOTFS_EXT2=y
>  >  # BR2_TARGET_ROOTFS_TAR is not set
>
>  > -# Linux headers same as kernel, a 4.11 series
>  > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
>  > +# Linux headers same as kernel, a 4.15 series
>  > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
>
>  >  # Kernel
>  >  BR2_LINUX_KERNEL=y
>  > --
>  > 2.16.1
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> Bye, Peter Korsgaard
