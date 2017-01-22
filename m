From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jan 2017 22:40:52 +0100
Subject: [Buildroot] [PATCH 03/52] package/asterisk: new package
In-Reply-To: <0d62e8fb-5d3d-8e54-eec0-db4b979ecb56@gmail.com>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
 <bd16c7aca1ba8c82c3c50977bfc207bd2cb7ca65.1483093662.git.yann.morin.1998@free.fr>
 <0d62e8fb-5d3d-8e54-eec0-db4b979ecb56@gmail.com>
Message-ID: <20170122214052.GA3594@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-01-22 21:31 +0100, Romain Naour spake thusly:
> Le 30/12/2016 ? 11:29, Yann E. MORIN a ?crit :
> > Asterisk: the flagship of telephony on Linux. These are the lines of
> > code whose continuous mission is to power small and large enterprises
> > telephony systems, to boldly provide IP PBX where no one has done so
> > before.
> > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> > new file mode 100644
> > index 0000000..239e457
> > --- /dev/null
> > +++ b/package/asterisk/asterisk.mk
[--SNIP--]
> > +# We want to install sample configuration files, too.
> > +ASTERISK_INSTALL_TARGET_OPTS = \
> > +	$(ASTERISK_DIRS) \
> > +	DESTDIR=$(TARGET_DIR) \
> > +	install samples
> 
> There are some warnings about /usr/sbin/ldconfig being used on the target directory:
> 
> /usr/sbin/ldconfig: output/target/usr/lib/libjansson.so is for unknown machine 40.
> [...]
> 
> I suggest to add LDCONFIG=true in ASTERISK_INSTALL_TARGET_OPTS.

Done.

> > +
> > +#-------------------------------------------------------------------------------
> > +# This part deals with building the menuselect tool.
> > +# Even though menuselect is an autotools package, it is *not* installed in
> > +# $(HOST_DIR) as asterisk does expect it to be in a sub-directory of its
> > +# source tree.
> > +
> > +ASTRISK_MENUSELECT_FLAGS = \
> 
> ./support/scripts/check-package package/asterisk/*
> package/asterisk/asterisk.mk:135: possible typo: ASTRISK_MENUSELECT_FLAGS ->
> *ASTERISK*

And fixed as well.

> This is a quick (partial) review for today.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
