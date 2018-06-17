From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 13:47:12 +0200
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <CAF_dkJAfn_-H_L3mf8jDnu72D7=UV38sAbRrDQy+nQ=P1XjuYw@mail.gmail.com>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
 <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
 <20180407084321.1e68cc90@windsurf.home>
 <CAF_dkJDwfTvVHmSVgi4mo=2u=-Yj-__3e7rqsOyUXppLPeysEQ@mail.gmail.com>
 <CAF_dkJAH5u3g_rQYaUVzCnUMyeMTMZrRbo0KDnOt6pVQtwvb-g@mail.gmail.com>
 <20180615211330.479e44c5@windsurf>
 <CAF_dkJAfn_-H_L3mf8jDnu72D7=UV38sAbRrDQy+nQ=P1XjuYw@mail.gmail.com>
Message-ID: <20180617134712.4fbe529e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Sat, 16 Jun 2018 22:28:08 -0400, Patrick Doyle wrote:

> >  4/ Create a tarball of /opt/armv7-eabihf--musl--stable-2018.02-2 and
> >     you're done :-)  
> So, once I do that, I can pull that tarball into my build as if it
> were a bootliin tarball?

Yes.

> And buildroot is smart enough to run the relocate-sdk.sh script
> contained therein?

No, Buildroot is not smart enough to do this, but it's not a problem.
The relocate-sdk.sh is necessary to fixup path in .la files, -config
scripts and stuff like that, which you don't have in a SDK that is just
a pure toolchain. The only thing that really matters is to have
relative RPATH, and that's already done as part of the "make sdk"
target.

Hence, "make sdk" + tarballing output/host already makes a toolchain
that is relocatable, and usable as-is as an external toolchain for
another Buildroot build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
