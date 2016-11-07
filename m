From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Mon, 7 Nov 2016 17:26:55 -0500 (EST)
Subject: [Buildroot] [PATCH 0/6] package/pseudo: fix build and better
	mimic fakeroot
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <1270837880.6241362.1478557615050.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

----- Original Message -----
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: buildroot at buildroot.org
> Cc: "Erico Nunes" <nunes.erico@gmail.com>, "Ga?l PORTAY" <gael.portay@savoirfairelinux.com>, "Julien BOIBESSOT"
> <julien.boibessot@free.fr>, "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com>, "Yann E. MORIN"
> <yann.morin.1998@free.fr>
> Sent: Monday, November 7, 2016 4:23:37 PM
> Subject: [PATCH 0/6] package/pseudo: fix build and better mimic fakeroot

> Hello All!

> When we switched from using fakeroot to using pseudo, a lot of
> assumptions were made, in that we assumed pseudo was by default
> behaving as fakeroot did.

> That is wrong. pseudo is a little bit more versatile than fakeroot
> is, so using it is a little bit more involved.

> First, its buildsystem is a bit convoluted, and can incorrectly guess
> the host charateristics, like bitness.

> Second, it needs to be told at runtime where to look at, and put its
> own stuff. It correctly gueses, but prints a warning that it had to
> gues, and the location to store its DB is not optimum (even if not
> incorrect).

> So, this series ensures that pseudo is correctly built and that we
> correctly specify the runtime configuration.

I build my firmware inside a Docker container, in which a minimal 
Ubuntu x86-64 distro runs with no libc6-dev-i386 installed.
However, '-m32' was polluting the compiler options and the x86-64
headers couldn't be found. This patchset fixes the build.

Tested-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>

Thanks,

Patrick
