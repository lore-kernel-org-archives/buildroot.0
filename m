From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 7 Nov 2016 22:42:14 +0100
Subject: [Buildroot] [PATCH 0/6] package/pseudo: fix build and better
	mimic fakeroot
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <CAK4VdL0Q7z9cu=PDrLJHbLs=w0=wYcg6SWgciDwsCQjz9bVuhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Nov 7, 2016 at 10:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> When we switched from using fakeroot to using pseudo, a lot of
> assumptions were made, in that we assumed pseudo was by default
> behaving as fakeroot did.
>
> That is wrong. pseudo is a little bit more versatile than fakeroot
> is, so using it is a little bit more involved.
>
> First, its buildsystem is a bit convoluted, and can incorrectly guess
> the host charateristics, like bitness.
>
> Second, it needs to be told at runtime where to look at, and put its
> own stuff. It correctly gueses, but prints a warning that it had to
> gues, and the location to store its DB is not optimum (even if not
> incorrect).
>
> So, this series ensures that pseudo is correctly built and that we
> correctly specify the runtime configuration.
>
>
> Regards,
> Yann E. MORIN.
>
>
> The following changes since commit adf31efcd433712f546f2a3bcdb18abe650db27b
>
>   board/boundarydevices: fix boot partition number in bootscript (2016-11-07 22:09:37 +0100)
>
>
> are available in the git repository at:
>
>   git://git.buildroot.org/~ymorin/git/buildroot.git
>
> for you to fetch changes up to f7a170d2df33fe2825b401df89702f02e053c81f
>
>   fs: call pseudo as instructed by the pseudo package (2016-11-07 22:22:24 +0100)
>
>
> ----------------------------------------------------------------
> Yann E. MORIN (6):
>       core: export a variable with the host's bitness
>       package/pseudo: enforce the host bitness
>       package/pseudo: force rpath and pass our host CFLAGS
>       package/pseudo: expose the host binary in a variable
>       package/pseudo: fix fakeroot wrapper to correctly use pseudo
>       fs: call pseudo as instructed by the pseudo package
>
>  Makefile                 |  6 ++++++
>  fs/common.mk             |  2 +-
>  package/pseudo/pseudo.mk | 13 ++++++++++++-
>  3 files changed, 19 insertions(+), 2 deletions(-)

I have tested this series on x86_64 and on an aarch64 build machine,
which was failing to build pseudo prior to this. Both running Fedora.
So, for the series:

Tested-by: Erico Nunes <nunes.erico@gmail.com>


Thanks for this fix.

Erico
