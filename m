From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Oct 2020 23:50:22 +0100
Subject: [Buildroot] [PATCH v3,2/2] package/zeek: new package
In-Reply-To: <20201026220841.085177d8@windsurf.home>
References: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
 <20201025161246.1622486-2-fontaine.fabrice@gmail.com>
 <20201026220841.085177d8@windsurf.home>
Message-ID: <CAPi7W80jJeG5jhntYjPmok_HmDAC19GU=fFbmgDVX2ygqx78rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 26 oct. 2020 ? 22:08, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 25 Oct 2020 17:12:46 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +ZEEK_CONF_OPTS = \
> > +     -DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
> > +     -DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
> > +     -DBROKER_DISABLE_DOCS=ON \
> > +     -DBROKER_DISABLE_TESTS=ON \
> > +     -DINSTALL_AUX_TOOLS=ON \
> > +     -DZEEK_ETC_INSTALL_DIR=/etc
> > +
> > +define ZEEK_FIX_PYTHON_PATH
> > +     $(SED) 's, at PYTHON_EXECUTABLE@,/usr/bin/python,' \
> > +             $(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
> > +endef
> > +
> > +ZEEK_POST_CONFIGURE_HOOKS += ZEEK_FIX_PYTHON_PATH
>
> Does this needs to be a post-configure hook ? Isn't that needed simply
> after the installation ?
I can't use @PYTHON_EXECUTABLE@ in a post install hook as cmake will
replace it with the expanded value of $(HOST_DIR)/bin/python.
I could replace $(HOST_DIR) by /usr in a post install hook but I find
this solution less elegant.
Another option would be to patch ssh_runner.py but I don't think that
upstream will accept that we hardcode /usr/bin/python.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
