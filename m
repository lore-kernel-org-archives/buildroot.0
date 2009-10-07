From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 22:59:34 +0200
Subject: [Buildroot] [PATCH 12/14] rsync: bump version
In-Reply-To: <87ab03j591.fsf@macbook.be.48ers.dk>
References: <df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
	<f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
	<d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<730af4752b8da4a9b2a2b1583987899fa3eef334.1254945750.git.rep.dot.nop@gmail.com>
	<87ab03j591.fsf@macbook.be.48ers.dk>
Message-ID: <20091007205934.GI23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 10:52:58PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard>   Bump version to 3.0.6.
> Bernhard>   autoreconf is off per default, so no need to specify it.
> Bernhard>   Use config.cache (fix the incorrect package instead).
> Bernhard>   Pass ENABLE_DEBUG setting to configure.
> 
> Bernhard> -RSYNC_VERSION:=3.0.5
> Bernhard> +RSYNC_VERSION:=3.0.6
> Bernhard>  RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
> Bernhard> -RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
> Bernhard> -RSYNC_AUTORECONF:=no
> Bernhard> -RSYNC_USE_CONFIG_CACHE:=no
> Bernhard> +RSYNC_SITE:=http://rsync.samba.org/ftp/rsync
> Bernhard> +#RSYNC_USE_CONFIG_CACHE:=no
>
>Please don't add commented out code. Do we know what package fail(ed)?

We know that some other package populated the cache with a wrong value.
The correct fix is to repair the package that misdetected
struct sockaddr_storage and _not_ to penalize rsync.
The setting was commented out as a reminder.
