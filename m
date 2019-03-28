From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 28 Mar 2019 18:01:16 +0100
Subject: [Buildroot] [PATCH v2] package/nfs-utils: making nfs server
 optional
In-Reply-To: <20190328174857.7c1d188e@windsurf>
References: <1553781189-15924-1-git-send-email-angelo@amarulasolutions.com>
 <20190328174857.7c1d188e@windsurf>
Message-ID: <CA+_SqVaX=D_2h3-MXCnigM7MdmLgNYVevN_O+MZxOxXgEPcSOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 28, 2019 at 5:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Angelo,
>
> On Thu, 28 Mar 2019 14:53:09 +0100
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_NFS_UTILS_SERVER),y)
> >  define NFS_UTILS_INSTALL_INIT_SYSV
> >       $(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
> >               $(TARGET_DIR)/etc/init.d/S60nfs
> > @@ -95,6 +96,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
> >       $(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
> >               $(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
> >  endef
> > +endif
>
> This is only removing the installation of the init script/systemd unit
> files, not really disabling the server.>
>
> Shouldn't we do like BR2_PACKAGE_NFS_UTILS_RPCDEBUG,
> BR2_PACKAGE_NFS_UTILS_RPC_LOCKD and BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
> are doing, and also remove the unnecessary programs ?

Probably yes. It could save some space and it coulb be betetr for fs
cleaning. Will do.

> Another question is: the systemd stuff installs a nfs-client.service
> unit file, and you're no longer installing this. It's named
> nfs-client... so it seems to be needed even when you are just a client.
>
>
> In fact, I think *some* of the daemons are needed even when you are
> just a client. See what nfs-client.service is doing.

I'll have a better look at the systemd part. I tested with sysy and
the system can mount an nfs share without having any service running.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
