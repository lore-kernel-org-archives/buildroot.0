From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Jul 2018 17:10:45 +0200
Subject: [Buildroot] [PATCH 16/50] package/busybox: invert dependency
 with rsyslogd
In-Reply-To: <310327190.1977638.1530842315370.JavaMail.zimbra@datacom.com.br>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <3bdcebd1fb9ecf3173194d86e6b1cc0e2a5cb3fc.1530565933.git.yann.morin.1998@free.fr>
 <310327190.1977638.1530842315370.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180706151045.GB3128@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-07-05 22:58 -0300, Carlos Santos spake thusly:
> > From: "Yann Morin" <yann.morin.1998@free.fr>
> > To: "buildroot" <buildroot@buildroot.org>
> > Cc: "Yann Morin" <yann.morin.1998@free.fr>
> > Sent: Monday, July 2, 2018 6:11:50 PM
> > Subject: [Buildroot] [PATCH 16/50] package/busybox: invert dependency with rsyslogd
> Should be "rsyslog", not "rsyslogd", in the commit title.

Yip!...

Thanks! :-)

Regards,
Yann E. MORIN.

> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> > package/busybox/busybox.mk | 1 +
> > package/rsyslog/rsyslog.mk | 5 -----
> > 2 files changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index 7686667884..3a19500ad3 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
> > 
> > # Packages that provide commands that may also be busybox applets:
> > BUSYBOX_DEPENDENCIES = \
> > +	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslogd) \
> > 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
> > 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
> > 	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
> > diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> > index e32505be22..61e08ba765 100644
> > --- a/package/rsyslog/rsyslog.mk
> > +++ b/package/rsyslog/rsyslog.mk
> > @@ -17,11 +17,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
> > RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
> > 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
> > 
> > -# Build after BusyBox
> > -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> > -RSYSLOG_DEPENDENCIES += busybox
> > -endif
> > -
> > ifeq ($(BR2_PACKAGE_GNUTLS),y)
> > RSYSLOG_DEPENDENCIES += gnutls
> > RSYSLOG_CONF_OPTS += --enable-gnutls
> > --
> > 2.14.1
> 
> -- 
> Carlos Santos (Casantos) - DATACOM, P&D

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
