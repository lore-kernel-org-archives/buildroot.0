From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 21 Nov 2015 19:31:08 -0200
Subject: [Buildroot] [PATCH] bullet: disable on microblaze
In-Reply-To: <1448140207-28861-1-git-send-email-arnout@mind.be>
References: <1448140207-28861-1-git-send-email-arnout@mind.be>
Message-ID: <CANu7NGuTHtfww8cuxTfmFUYQBkN8bbp3d6SuxQg9NRt2gxL9xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

I'm looking at a related bug in the gpsd package (
https://bugs.busybox.net/show_bug.cgi?id=6872) and preparing a patch for
it. in my case, looks like it is just a matter of
disabling -fexpensive-optimizations. That way we can keep compiling the
package for the microblaze architecture.

I can make some tests in the bullet package if you want.

Regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-21 19:10 GMT-02:00 Arnout Vandecappelle (Essensium/Mind) <
arnout@mind.be>:

> gcc doesn't finish compiling btSoftBody.cpp when optimization is
> enabled.
>
> Fixes:
>
> http://autobuild.buildroot.net/results/6e4/6e4a9ede477b031f47f7e271c38f67f432a3573c
>
> http://autobuild.buildroot.net/results/7dc/7dc4ab759dd3b1e3e03fe52c78e31327340bf8c9
>
> http://autobuild.buildroot.net/results/637/637bae8b2be6c4c64f4f7c661cc8d4606b553538
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> An option would have been to disable optimisation, but I couldn't be
> bothered...
> ---
>  package/bullet/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/bullet/Config.in b/package/bullet/Config.in
> index fc285ab..56b3d62 100644
> --- a/package/bullet/Config.in
> +++ b/package/bullet/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_BULLET
>         bool "bullet"
>         depends on BR2_INSTALL_LIBSTDCPP
> +       depends on !BR2_microblaze
>         help
>           Bullet is a Collision Detection and Rigid Body Dynamics
>           Library.
> @@ -9,3 +10,4 @@ config BR2_PACKAGE_BULLET
>
>  comment "bullet needs a toolchain w/ C++"
>         depends on !BR2_INSTALL_LIBSTDCPP
> +       depends on !BR2_microblaze
> --
> 2.6.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151121/a2f08aec/attachment.html>
