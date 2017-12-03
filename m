From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Dec 2017 10:34:09 +0100
Subject: [Buildroot] [RFCv3 08/15] package/pkg-generic: handle host-xz
 as an extract dependency
In-Reply-To: <20171203102929.7962bc0a@windsurf.lan>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-9-thomas.petazzoni@free-electrons.com>
 <20171202150843.GD2988@scaer>
 <20171202211627.6d664875@windsurf.lan>
 <20171203083256.GF2988@scaer>
 <20171203102929.7962bc0a@windsurf.lan>
Message-ID: <20171203093409.GG2988@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-03 10:29 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> > > > Currently, filesystems that want to compress with xz all depend on
> > > > host-xz unconditioanlly. Do we want to change that as well, so they only
> > > > depend on it if needed?  
> > > 
> > > I don't understand this part, because filesystems do not depend on
> > > host-xz unconditionally. They only depend on it if xz compression of
> > > the filesystem image is requested. From fs/common.mk:
> > > 
> > > ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> > > ROOTFS_$(2)_DEPENDENCIES += host-xz
> > > ROOTFS_$(2)_COMPRESS_EXT = .xz
> > > ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> > > endif  
[--SNIP--]
> > What I mean is that, probably, we will want to make it:
> > 
> >     ROOTFS_$(2)_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
> 
> Yes, I thought about this too. But again, it's a separate issue: the
> filesystem code already depends on host-xz, regardless of whether xz is
> already available on the system.

Yes, sure. I was just merely saying that when you eventually make those
dependencies really when-needed, you should also have a look at the
filesystem stuff. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
