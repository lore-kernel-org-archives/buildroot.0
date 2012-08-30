From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 30 Aug 2012 11:59:19 +0200
Subject: [Buildroot] [PATCH 4/4] qtuio: new package
In-Reply-To: <20120830055345.388d4c89@skate>
References: <1346230869-4926-1-git-send-email-sho@relinux.de>	<1346230869-4926-4-git-send-email-sho@relinux.de>
 <20120830055345.388d4c89@skate>
Message-ID: <503F3977.5070706@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks for the comments!
Am 30.08.2012 05:53, schrieb Thomas Petazzoni:
> Le Wed, 29 Aug 2012 11:01:09 +0200,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
>
>> +	select BR2_PACKAGE_MTDEF2TUIO
> Shouldn't this be MTDEV2TUIO ?
Stupid typo;.)
>> +	depends on BR2_PACKAGE_QT
> The code of qtuio also suggests it requires GUI support in Qt, so I
> guess some other dependencies are needed here.
That's right
>
> +QTUIO_DEPENDENCIES = qt mtdev2tuio
> Is mtdev2tuio really a build-time dependency? I don't think so. If it
> isn't, then keep the select in the Config.in file, but remove the
> build-time dependency here. Add a comment above the select in Config.in
> that explicitly says that it is a runtime dependency only.
Thinking about it, it is not a dependency at all, since one may use a
real TUIO capable touch device.
> +define QTUIO_INSTALL_TARGET_CMDS
>> +$(INSTALL) -D -m 0755 $(@D)/lib/libqTUIO.so* $(TARGET_DIR)/usr/lib
> Normally, install -D requires the complete destination filename as
> second argument. We usually use cp when multiple files need to be
> copied at once.
>
> Doesn't the qtuio package has a usable 'make install' ?
Doesn't seem so.

Fixed patch coming soon

Regards

Stephan
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
