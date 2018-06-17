From: Patrick Doyle <wpdster@gmail.com>
Date: Sat, 16 Jun 2018 22:28:08 -0400
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <20180615211330.479e44c5@windsurf>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
 <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
 <20180407084321.1e68cc90@windsurf.home>
 <CAF_dkJDwfTvVHmSVgi4mo=2u=-Yj-__3e7rqsOyUXppLPeysEQ@mail.gmail.com>
 <CAF_dkJAH5u3g_rQYaUVzCnUMyeMTMZrRbo0KDnOt6pVQtwvb-g@mail.gmail.com>
 <20180615211330.479e44c5@windsurf>
Message-ID: <CAF_dkJAfn_-H_L3mf8jDnu72D7=UV38sAbRrDQy+nQ=P1XjuYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
On Fri, Jun 15, 2018 at 3:13 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Here is the summary:
>
>  1/ Generate a Buildroot configuration that just defines the
>     architecture, architecture variant and toolchain options.
>
>     Also use the following for this configuration to disable any
>     user-space package:
>
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
>
>     I also typically pass something like
>     BR2_HOST_DIR=/opt/armv7-eabihf--musl--stable-2018.02-2 in the
>     configuration.
>
>  2/ Do the Buildroot build as usual
>
>  3/ Run "make sdk"
>
>  4/ Create a tarball of /opt/armv7-eabihf--musl--stable-2018.02-2 and
>     you're done :-)
So, once I do that, I can pull that tarball into my build as if it
were a bootliin tarball?  And buildroot is smart enough to run the
relocate-sdk.sh script contained therein?  I wonder if anybody else
noticed that I now seem to be writing my questions as statements?

Thanks Thomas.

--wpd
