From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 13:30:23 +0200
Subject: [Buildroot] [RFC 0/6] mdev-only /dev management (without
 devtmpfs)
In-Reply-To: <55EFFB42.2050106@mind.be>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <55EFFB42.2050106@mind.be>
Message-ID: <20150909133023.005a8364@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Sep 2015 11:26:26 +0200, Arnout Vandecappelle wrote:
> On 08-09-15 23:28, Luca Ceresoli wrote:
> > There is one rough edge that I'd like to have comments about: variable
> > naming. The new method implemented by this patchset is dynamic and uses
> > mdev, so it should ba named BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV and
> > described in kconfig as "dynamic using mdev". But hey, that name and
> > description are already used for the current "devtmpfs + mdev" method! So
> > we might want to rename all variables to encompass the new use case in a
> > clean way. Thid would also imply lagacy management etc.
> 
>  Since we don't like legacy management :-) I'd propose to say that DYNAMIC
> actually means DEVTMPFS. So the new option would be called
> BR2_ROOTFS_DEVICE_CREATION_MDEV: it's not devtmpfs, and there's no need for the
> explicit 'only' part.
> 
>  What do you think?

I agree. I would prefer to not change the name of existing options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
