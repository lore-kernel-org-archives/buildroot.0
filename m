From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2017 22:52:04 +0200
Subject: [Buildroot] [PATCH 31/49 v2] package/corosync: new package
In-Reply-To: <8f21b4d7-1666-b31b-83b2-92dc4ceb2177@mind.be>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <752e6d4352e6b6254704028375d0a356f337bacc.1504993178.git.yann.morin.1998@free.fr>
 <8f21b4d7-1666-b31b-83b2-92dc4ceb2177@mind.be>
Message-ID: <20170924205204.GA2575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-23 18:58 +0200, Arnout Vandecappelle spake thusly:
> On 09-09-17 23:39, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/package/corosync/corosync.mk b/package/corosync/corosync.mk
> > new file mode 100644
> > index 0000000000..865f5e0f8d
> > --- /dev/null
> > +++ b/package/corosync/corosync.mk
> > @@ -0,0 +1,47 @@
> > +################################################################################
> > +#
> > +# corosync
> > +#
> > +################################################################################
> > +
> > +COROSYNC_VERSION = v2.4.2
> > +COROSYNC_SITE = $(call github,corosync,corosync,$(COROSYNC_VERSION))
> 
>  Anything wrong with the official
> http://build.clusterlabs.org/corosync/releases/corosync-2.4.2.tar.gz download
> location?

No thing wrong I guess. I can't remember why I went for the github
repository... Fixed.

[--SNIP--]
> > +	--disable-systemd \
>  Hm, below you add a --enable-systemd...

Arg, forgot to remove...

> > +	--disable-upstart \
> > +	$(if $(BR2_INIT_SYSTEMD),--enable-systemd,--disable-systemd) \
>  No dependency on systemd needed? It just installs units?

Yes, it only installs unit files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
