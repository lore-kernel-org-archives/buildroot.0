From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2020 14:12:09 +0200
Subject: [Buildroot] [PATCH v2] package/systemd: use current tool for
 generating HWDB
In-Reply-To: <CADYdroMdAVoxU406wekms08mrCvueeN1jqQ39cnY59S4J9Y0wQ@mail.gmail.com>
References: <20200710222656.6885-1-nolange79@gmail.com>
 <20200711112731.GE2273@scaer>
 <CADYdroMdAVoxU406wekms08mrCvueeN1jqQ39cnY59S4J9Y0wQ@mail.gmail.com>
Message-ID: <20200711121209.GF2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-11 13:57 +0200, Norbert Lange spake thusly:
> Yann E. MORIN < [1]yann.morin.1998@free.fr> schrieb am Sa., 11. Juli 2020, 13:27:
>   On 2020-07-11 00:26 +0200, Norbert Lange spake thusly:
[--SNIP--]
>   > Also remove the config files from both paths
>   > (rootfs overlay could add stuff) aswell as the service and tool
>   > from the target fs.
[--SNIP--]
>   However, I'm against removing the service altogether, because in the
>   past, some people have expressed the need to be able to update the hwdb
>   on-target.
> 
> That would be challenging, as the source files for the database were already removed before this patch.
> If they had to re-add those, then a adding a tool and service from the target directory won't be too much to ask?

Those people would indeed be responsible for downloading the source
again, and re-run the update.

> I mean buildroot pretty much doesn't support some sorta packet manager system by design.
> Why the exception here?

I don;t remember, but IIRC there was a rather-copnvioning argument in
favour of it.

>   I would be OK with having a drop-in that disables the service by default
>   when BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set, though.
> 
> It will only run when /usr is newer than /etc AFAIR (not sure how this is determined),

See commit bbe5c6dad4d (Makefile: Update mtime of $(TARGET_DIR)/usr in
target-finalize) which goal was to adress this.

> so disabling does very little.
> BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW already has too many?
> surprising effects for me.

I too am not very happy with BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
because one can still select a squashfs filesystem at the same time.,
and that does not make sense to remount R/W a sqsh, as it is R/O by
nature.

But heck, I don't find it very logical that we can build more than one
filesystem at the same time either (we should have a choice there),
so...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
