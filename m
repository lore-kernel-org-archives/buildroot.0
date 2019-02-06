From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 05:15:27 -0600
Subject: [Buildroot] [PATCH v5 2/3] openjdk: new package
In-Reply-To: <CANQCQpZxPpFRUTWt_MZEYuMTiH0R0+ezvjndoFNDH4OM1+B2rg@mail.gmail.com>
References: <20190205143126.13857-1-aduskett@gmail.com>
 <20190205143126.13857-2-aduskett@gmail.com>
 <CANQCQpZxPpFRUTWt_MZEYuMTiH0R0+ezvjndoFNDH4OM1+B2rg@mail.gmail.com>
Message-ID: <CANQCQpZKK0KwtGVmyxZKV3wXpx_QaT6yxA4_f85Z2YYCofCUsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Wed, Feb 6, 2019 at 4:11 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Adam.
>
> On Tue, Feb 5, 2019 at 8:34 AM <aduskett@gmail.com> wrote:
> >
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> [snip]
> > +OPENJDK_CONF_OPTS = \
> > +       --disable-full-docs \
> > +       --disable-hotspot-gtest \
> > +       --disable-manpages \
> > +       --disable-warnings-as-errors \
> > +       --enable-headless-only \
> > +       --enable-openjdk-only \
> > +       --enable-unlimited-crypto \
> > +       --openjdk-target=$(GNU_TARGET_NAME) \
> > +       --prefix=$(TARGET_DIR)/usr \
> > +       --with-boot-jdk=$(HOST_DIR) \
> > +       --with-debug-level=release \
> > +       --with-devkit=$(HOST_DIR) \
> > +       --with-extra-cflags="$(TARGET_CFLAGS)" \
> > +       --with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> > +       --with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin \
> > +       --with-giflib=system \
> > +       --with-jobs=$(PARALLEL_JOBS) \
>
> Got a build failure where I suspect PARALLEL_JOBS might be a fault.
> I'm dropping my core count and seeing if things succeed.
>
> Here's the pastebin
> https://pastebin.com/FNehyafY

No luck, same failure output with -j8.  My environment was a Ubuntu
14.04 machine running the run-time test.

Matt



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
