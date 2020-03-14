From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:13:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: bump to version 1.9.0
In-Reply-To: <20200313213931.1436698-1-fontaine.fabrice@gmail.com>
References: <20200313213931.1436698-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314151303.162dd9a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 13 Mar 2020 22:39:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Retrieve official tarball and so remove autoreconf
> - xlib_Xcursor is a mandatory dependency since
>   https://github.com/rdesktop/rdesktop/commit/6dd85edc6f8293acd100b34add1405ea5a744111
> - libtasn1 is a mandatory dependency since
>   https://github.com/rdesktop/rdesktop/commit/673b267e665642def474f228142e46b18d195e01
> - nettle is a mandatory dependency since
>   https://github.com/rdesktop/rdesktop/commit/00d9e0c4c806c1d5d21ec7865f03cafe9acbeab3
> - gnutls is a mandatory dependency instead of openssl since
>   https://github.com/rdesktop/rdesktop/commit/166d1bc14d34c20dd0c640571a749a6599180367
> - pulseaudio is an optional dependency since
>   https://github.com/rdesktop/rdesktop/commit/9b98c3b2296f07b99b94aceb2c19131f32bde476
> - iconv is mandatory since
>   https://github.com/rdesktop/rdesktop/commit/2ea3f69873d18d07ef79c724c656d25b9d63a114
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rdesktop/Config.in     | 12 +++++++++++-
>  package/rdesktop/rdesktop.hash |  2 +-
>  package/rdesktop/rdesktop.mk   | 20 ++++++++++++++------
>  3 files changed, 26 insertions(+), 8 deletions(-)

Applied to master, thanks. However, it would be nice to use the --with
options when possible. For example for the audio stuff, it would be
good to have something like --with-sound=pulse, --with-sound=alsa (and
of course see if they are mutually exclusive or not).

On a side note, it's kind silly to need both gnutls *and* nettle, as
both are crypto libraries...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
