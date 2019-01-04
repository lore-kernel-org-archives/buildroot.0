From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Jan 2019 09:39:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/gettext: Turn into virtual
 package
In-Reply-To: <CAMw6YJLvioTwKbgAdYvtZqbVg1W-RAADT_umZkGMaw9MnVpHMw@mail.gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
 <20181223150448.21980-2-vadim4j@gmail.com>
 <20181230181026.3ce6aca3@windsurf>
 <CAMw6YJLfzWh+=5NVkjO=TPiZ75KdOw6x-qApgPUeV+mUMKYqOg@mail.gmail.com>
 <20181231160614.0f7e9f0b@windsurf>
 <CAMw6YJKfY_+pK=gDCb9QF=sbg+RXhJbgC=zJC8qXy_MxMwjsVg@mail.gmail.com>
 <20190103152834.3194d737@windsurf>
 <CAMw6YJ+xU9GiZ809dCQTmPEgtpu3iCOErT5w7fqoee09R-hpaQ@mail.gmail.com>
 <CAMw6YJLvioTwKbgAdYvtZqbVg1W-RAADT_umZkGMaw9MnVpHMw@mail.gmail.com>
Message-ID: <20190104093938.00fb138b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in Cc, i.e use "Reply All" when replying
to mailing list e-mails. Thanks!

I'm also adding Andr? and Yann in Cc, since they are involved in the
host-gettext dependency in wine.

On Fri, 4 Jan 2019 03:49:49 +0200, Vadim Kochan wrote:

> So the wine builds OK w/o host-gettext (tested with dockerfile), but
> this libgettextpo is required by (optionally)
> 'tools/wrc' which allows to convert window's resources into *.po files
> (https://linux.die.net/man/1/wrc). And
> looks like it might be needed on the host only if NLS=y.

The dependency on host-gettext was added in commit
164ac197fef763dfa61154ad41588b6701baca86, which says:

""
    wine: Add gettext dependency for host-wine
    
    Mostly based on a comment by Yann E. MORIN
""

I am not sure what "comment" Yann made about this, and especially if
the dependency really needs to be mandatory.

Andr?, Yann, do you remember ? Could you give more details about the
host-gettext dependency in wine ?

Do we need it unconditionally, or only when BR2_SYSTEM_ENABLE_NLS=y ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
