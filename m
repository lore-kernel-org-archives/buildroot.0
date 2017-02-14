From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 14 Feb 2017 15:17:46 +0000 (UTC)
Subject: [Buildroot] [BUILDROOT] Add a text file on "/tmp" directory
 during img compilation
References: <288390896.7283593.1487081370913.ref@mail.yahoo.com>
 <288390896.7283593.1487081370913@mail.yahoo.com>
Message-ID: <o7v72q$48j$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-14, <thierry.xenomai43@yahoo.com> <thierry.xenomai43@yahoo.com> wrote:

> I would like to add a text files and bin?files on "/tmp" directory
> during the image making.

https://buildroot.org/downloads/manual/manual.html#rootfs-custom

You can configure buildroot to run a script after the root tree is
done but but before the final image is created by setting the
BR2_ROOTFS_POST_BUILD_SCRIPT option. Look under

  System Configuration
    Custom scripts to run before creating filesystem images

In that script you can add/delete/remove files from the tree.

If all you want to do is add files, you can use the BR2_ROOTFS_OVERLAY
option to point to a tree that is copied on top of the target tree.

-- 
Grant Edwards               grant.b.edwards        Yow! An Italian is COMBING
                                  at               his hair in suburban DES
                              gmail.com            MOINES!
