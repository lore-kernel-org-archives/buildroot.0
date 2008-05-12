From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 12 May 2008 11:44:58 +0000
Subject: [Buildroot] grub on x86 problems
Message-ID: <1210592698.3915.29.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

Concerning the problems a number of people are having with grub (on at
least x86) with "File not found" error popping up. (by popping up I mean
when using setup(xxx) or find /boot/xyz when the file is there).

The problem is due to this patch => grub.300-honor_UCLIBC_HAS_LFS.patch

Removing it renders grub usable again. Furthermore applying the patch
and building grub under my host system also breaks horribly with the
same "File not found" error.

Looks impossible to occur in this manner to me ... I just tested 3 times
to be sure, clean sources, clean builds against my host system glibc and
buildroot uclibc. Applying that patch to a verbatim grub breaks both my
host build and buildroot build grub binaries.

Ok ... looking further into this ... removing #include <features.h>
fixes it on glibc and uclibc.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080512/4a823464/attachment.pgp 
