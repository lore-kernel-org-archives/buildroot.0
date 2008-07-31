From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 31 Jul 2008 09:15:19 +0200
Subject: [Buildroot] missing acl.h for host mtd-utils
In-Reply-To: <1217483230.6143.29.camel@kokopelli>
References: <1217483230.6143.29.camel@kokopelli>
Message-ID: <48916687.5090805@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian Beattie wrote:
> I think I have tracked this down, two of the missing include files and
> the library were due to a missing package on my system, but I still
> don't have an acl.h and I'm not sure where it would come from.  My
> development system is Ubuntu.  If somebody knows what package contains
> acl.h I'd appreciate hearing.  In the mean time I have worked around
> this by copying the target acl patch to a host package.
> 

*  sys-apps/acl
      Latest version available: 2.2.45
      Latest version installed: 2.2.45
      Size of files: 244 kB
      Homepage:      http://oss.sgi.com/projects/xfs/
      Description:   Access control list utilities, libraries and headers
      License:       LGPL-2.1

$ equery f acl
[ Searching for packages matching acl... ]
* Contents of sys-apps/acl-2.2.45:
/bin
/bin/chacl
/bin/getfacl
/bin/setfacl
/lib
/lib/libacl.so -> libacl.so.1
/lib/libacl.so.1 -> libacl.so.1.1.0
/lib/libacl.so.1.1.0
/usr
/usr/include
/usr/include/acl
/usr/include/acl/libacl.h
/usr/include/sys
/usr/include/sys/acl.h
/usr/lib
/usr/lib/libacl.a
/usr/lib/libacl.la
/usr/lib/libacl.so
/usr/share
/usr/share/doc
/usr/share/doc/acl-2.2.45
/usr/share/doc/acl-2.2.45/CHANGES.bz2
/usr/share/doc/acl-2.2.45/COPYING.bz2
/usr/share/doc/acl-2.2.45/PORTING.bz2
/usr/share/doc/acl-2.2.45/README.bz2
/usr/share/locale
/usr/share/locale/de
/usr/share/locale/de/LC_MESSAGES
/usr/share/locale/de/LC_MESSAGES/acl.mo
/usr/share/locale/es
/usr/share/locale/es/LC_MESSAGES
/usr/share/locale/es/LC_MESSAGES/acl.mo
/usr/share/locale/fr
/usr/share/locale/fr/LC_MESSAGES
/usr/share/locale/fr/LC_MESSAGES/acl.mo
/usr/share/locale/gl
/usr/share/locale/gl/LC_MESSAGES
/usr/share/locale/gl/LC_MESSAGES/acl.mo
/usr/share/locale/pl
/usr/share/locale/pl/LC_MESSAGES
/usr/share/locale/pl/LC_MESSAGES/acl.mo
/usr/share/locale/sv
/usr/share/locale/sv/LC_MESSAGES
/usr/share/locale/sv/LC_MESSAGES/acl.mo
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/chacl.1.bz2
/usr/share/man/man1/getfacl.1.bz2
/usr/share/man/man1/setfacl.1.bz2
/usr/share/man/man3
/usr/share/man/man3/acl_add_perm.3.bz2
/usr/share/man/man3/acl_calc_mask.3.bz2
/usr/share/man/man3/acl_check.3.bz2
/usr/share/man/man3/acl_clear_perms.3.bz2
/usr/share/man/man3/acl_cmp.3.bz2
/usr/share/man/man3/acl_copy_entry.3.bz2
/usr/share/man/man3/acl_copy_ext.3.bz2
/usr/share/man/man3/acl_copy_int.3.bz2
/usr/share/man/man3/acl_create_entry.3.bz2
/usr/share/man/man3/acl_delete_def_file.3.bz2
/usr/share/man/man3/acl_delete_entry.3.bz2
/usr/share/man/man3/acl_delete_perm.3.bz2
/usr/share/man/man3/acl_dup.3.bz2
/usr/share/man/man3/acl_entries.3.bz2
/usr/share/man/man3/acl_equiv_mode.3.bz2
/usr/share/man/man3/acl_error.3.bz2
/usr/share/man/man3/acl_extended_fd.3.bz2
/usr/share/man/man3/acl_extended_file.3.bz2
/usr/share/man/man3/acl_free.3.bz2
/usr/share/man/man3/acl_from_mode.3.bz2
/usr/share/man/man3/acl_from_text.3.bz2
/usr/share/man/man3/acl_get_entry.3.bz2
/usr/share/man/man3/acl_get_fd.3.bz2
/usr/share/man/man3/acl_get_file.3.bz2
/usr/share/man/man3/acl_get_perm.3.bz2
/usr/share/man/man3/acl_get_permset.3.bz2
/usr/share/man/man3/acl_get_qualifier.3.bz2
/usr/share/man/man3/acl_get_tag_type.3.bz2
/usr/share/man/man3/acl_init.3.bz2
/usr/share/man/man3/acl_set_fd.3.bz2
/usr/share/man/man3/acl_set_file.3.bz2
/usr/share/man/man3/acl_set_permset.3.bz2
/usr/share/man/man3/acl_set_qualifier.3.bz2
/usr/share/man/man3/acl_set_tag_type.3.bz2
/usr/share/man/man3/acl_size.3.bz2
/usr/share/man/man3/acl_to_any_text.3.bz2
/usr/share/man/man3/acl_to_text.3.bz2
/usr/share/man/man3/acl_valid.3.bz2
/usr/share/man/man5
/usr/share/man/man5/acl.5.bz2

HTH,
Hinko
-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
