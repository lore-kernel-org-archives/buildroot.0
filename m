From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jun 2009 21:25:09 +0000 (UTC)
Subject: [Buildroot] [Bug 415] New: Berkeley DB: mut_pthread.o: relocation
 R_X86_64_32 against `a local symbol' can not be used when making a shared
 object
Message-ID: <bug-415-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=415

              Host: Archlinux x86_64
            Target: x86_64
             Build: 2009.05
           Summary: Berkeley DB: mut_pthread.o: relocation R_X86_64_32
                    against `a local symbol' can not be used when making a
                    shared object
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The Berkeley DB package does not compile.

Target: x86_64
Threading model: linuxthreads old/stable

===
/bin/sh ./libtool --mode=link
/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc
-Os -pipe -Os 
-I/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/usr/include
-I/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/include
--sysroot=/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/ -isysroot
/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir -mtune=generic -fPIC
-DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-avoid-version -rpath /lib  -o libdb-4.3.la mut_pthread.o  bt_compare.o
bt_conv.o bt_curadj.o bt_cursor.o bt_delete.o bt_method.o bt_open.o bt_put.o
bt_rec.o bt_reclaim.o bt_recno.o bt_rsearch.o bt_search.o bt_split.o bt_stat.o
bt_upgrade.o btree_auto.o hash.o hash_auto.o hash_conv.o hash_dup.o hash_meta.o
hash_method.o hash_open.o hash_page.o hash_rec.o hash_reclaim.o hash_stat.o
hash_upgrade.o hash_verify.o qam.o qam_auto.o qam_conv.o qam_files.o
qam_method.o qam_open.o qam_rec.o qam_stat.o qam_upgrade.o qam_verify.o
rep_auto.o rep_backup.o rep_method.o rep_record.o rep_region.o rep_stat.o
rep_util.o db_ovfl_vrfy.o db_vrfy.o db_vrfyutil.o bt_verify.o  crypto_stub.o
crdel_auto.o crdel_rec.o db.o db_am.o db_auto.o db_byteorder.o db_cam.o
db_conv.o db_dispatch.o db_dup.o db_err.o db_getlong.o db_idspace.o db_iface.o
db_join.o db_log2.o db_meta.o db_method.o db_open.o db_overflow.o db_pr.o
db_rec.o db_reclaim.o db_rename.o db_remove.o db_ret.o db_salloc.o db_setid.o
db_setlsn.o db_shash.o db_stati.o db_truncate.o db_upg.o db_upg_opd.o dbm.o
dbreg.o dbreg_auto.o dbreg_rec.o dbreg_stat.o dbreg_util.o env_file.o
env_method.o env_open.o env_recover.o env_region.o env_stat.o fileops_auto.o
fop_basic.o fop_rec.o fop_util.o hash_func.o hmac.o hsearch.o lock.o
lock_deadlock.o lock_id.o lock_list.o lock_method.o lock_region.o lock_stat.o
lock_timer.o lock_util.o log.o log_archive.o log_compare.o log_get.o
log_method.o log_put.o log_stat.o mp_alloc.o mp_bh.o mp_fget.o mp_fmethod.o
mp_fopen.o mp_fput.o mp_fset.o mp_method.o mp_region.o mp_register.o mp_stat.o
mp_sync.o mp_trickle.o mutex.o os_abs.o os_alloc.o os_clock.o os_config.o
os_dir.o os_errno.o os_fid.o os_fsync.o os_handle.o os_id.o os_map.o
os_method.o os_oflags.o os_open.o os_region.o os_rename.o os_root.o os_rpath.o
os_rw.o os_seek.o os_sleep.o os_spin.o os_stat.o os_tmpdir.o os_truncate.o
os_unlink.o sha1.o seq_stat.o sequence.o snprintf.o txn.o txn_auto.o
txn_method.o txn_rec.o txn_recover.o txn_region.o txn_stat.o txn_util.o xa.o
xa_db.o xa_map.o 

*** Warning: Linking the shared library libdb-4.3.la against the non-libtool
*** objects  mut_pthread.o bt_compare.o bt_conv.o bt_curadj.o bt_cursor.o
bt_delete.o bt_method.o bt_open.o bt_put.o bt_rec.o bt_reclaim.o bt_recno.o
bt_rsearch.o bt_search.o bt_split.o bt_stat.o bt_upgrade.o btree_auto.o hash.o
hash_auto.o hash_conv.o hash_dup.o hash_meta.o hash_method.o hash_open.o
hash_page.o hash_rec.o hash_reclaim.o hash_stat.o hash_upgrade.o hash_verify.o
qam.o qam_auto.o qam_conv.o qam_files.o qam_method.o qam_open.o qam_rec.o
qam_stat.o qam_upgrade.o qam_verify.o rep_auto.o rep_backup.o rep_method.o
rep_record.o rep_region.o rep_stat.o rep_util.o db_ovfl_vrfy.o db_vrfy.o
db_vrfyutil.o bt_verify.o crypto_stub.o crdel_auto.o crdel_rec.o db.o db_am.o
db_auto.o db_byteorder.o db_cam.o db_conv.o db_dispatch.o db_dup.o db_err.o
db_getlong.o db_idspace.o db_iface.o db_join.o db_log2.o db_meta.o db_method.o
db_open.o db_overflow.o db_pr.o db_rec.o db_reclaim.o db_rename.o db_remove.o
db_ret.o db_salloc.o db_setid.o db_setlsn.o db_shash.o db_stati.o db_truncate.o
db_upg.o db_upg_opd.o dbm.o dbreg.o dbreg_auto.o dbreg_rec.o dbreg_stat.o
dbreg_util.o env_file.o env_method.o env_open.o env_recover.o env_region.o
env_stat.o fileops_auto.o fop_basic.o fop_rec.o fop_util.o hash_func.o hmac.o
hsearch.o lock.o lock_deadlock.o lock_id.o lock_list.o lock_method.o
lock_region.o lock_stat.o lock_timer.o lock_util.o log.o log_archive.o
log_compare.o log_get.o log_method.o log_put.o log_stat.o mp_alloc.o mp_bh.o
mp_fget.o mp_fmethod.o mp_fopen.o mp_fput.o mp_fset.o mp_method.o mp_region.o
mp_register.o mp_stat.o mp_sync.o mp_trickle.o mutex.o os_abs.o os_alloc.o
os_clock.o os_config.o os_dir.o os_errno.o os_fid.o os_fsync.o os_handle.o
os_id.o os_map.o os_method.o os_oflags.o os_open.o os_region.o os_rename.o
os_root.o os_rpath.o os_rw.o os_seek.o os_sleep.o os_spin.o os_stat.o
os_tmpdir.o os_truncate.o os_unlink.o sha1.o seq_stat.o sequence.o snprintf.o
txn.o txn_auto.o txn_method.o txn_rec.o txn_recover.o txn_region.o txn_stat.o
txn_util.o xa.o xa_db.o xa_map.o is not portable!
/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc
-Os -pipe -Os 
-I/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/usr/include
-I/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/include
--sysroot=/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/ -isysroot
/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir -mtune=generic -fPIC
-DPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -shared 
 mut_pthread.o bt_compare.o bt_conv.o bt_curadj.o bt_cursor.o bt_delete.o
bt_method.o bt_open.o bt_put.o bt_rec.o bt_reclaim.o bt_recno.o bt_rsearch.o
bt_search.o bt_split.o bt_stat.o bt_upgrade.o btree_auto.o hash.o hash_auto.o
hash_conv.o hash_dup.o hash_meta.o hash_method.o hash_open.o hash_page.o
hash_rec.o hash_reclaim.o hash_stat.o hash_upgrade.o hash_verify.o qam.o
qam_auto.o qam_conv.o qam_files.o qam_method.o qam_open.o qam_rec.o qam_stat.o
qam_upgrade.o qam_verify.o rep_auto.o rep_backup.o rep_method.o rep_record.o
rep_region.o rep_stat.o rep_util.o db_ovfl_vrfy.o db_vrfy.o db_vrfyutil.o
bt_verify.o crypto_stub.o crdel_auto.o crdel_rec.o db.o db_am.o db_auto.o
db_byteorder.o db_cam.o db_conv.o db_dispatch.o db_dup.o db_err.o db_getlong.o
db_idspace.o db_iface.o db_join.o db_log2.o db_meta.o db_method.o db_open.o
db_overflow.o db_pr.o db_rec.o db_reclaim.o db_rename.o db_remove.o db_ret.o
db_salloc.o db_setid.o db_setlsn.o db_shash.o db_stati.o db_truncate.o db_upg.o
db_upg_opd.o dbm.o dbreg.o dbreg_auto.o dbreg_rec.o dbreg_stat.o dbreg_util.o
env_file.o env_method.o env_open.o env_recover.o env_region.o env_stat.o
fileops_auto.o fop_basic.o fop_rec.o fop_util.o hash_func.o hmac.o hsearch.o
lock.o lock_deadlock.o lock_id.o lock_list.o lock_method.o lock_region.o
lock_stat.o lock_timer.o lock_util.o log.o log_archive.o log_compare.o
log_get.o log_method.o log_put.o log_stat.o mp_alloc.o mp_bh.o mp_fget.o
mp_fmethod.o mp_fopen.o mp_fput.o mp_fset.o mp_method.o mp_region.o
mp_register.o mp_stat.o mp_sync.o mp_trickle.o mutex.o os_abs.o os_alloc.o
os_clock.o os_config.o os_dir.o os_errno.o os_fid.o os_fsync.o os_handle.o
os_id.o os_map.o os_method.o os_oflags.o os_open.o os_region.o os_rename.o
os_root.o os_rpath.o os_rw.o os_seek.o os_sleep.o os_spin.o os_stat.o
os_tmpdir.o os_truncate.o os_unlink.o sha1.o seq_stat.o sequence.o snprintf.o
txn.o txn_auto.o txn_method.o txn_rec.o txn_recover.o txn_region.o txn_stat.o
txn_util.o xa.o xa_db.o xa_map.o   -mtune=generic -Wl,-soname -Wl,libdb-4.3.so
-o .libs/libdb-4.3.so
/home/max/pxe/buildroot-2009.05/build_x86_64/staging_dir/usr/bin/../lib/gcc/x86_64-linux-uclibc/4.4.0/../../../../x86_64-linux-uclibc/bin/ld:
mut_pthread.o: relocation R_X86_64_32 against `a local symbol' can not be used
when making a shared object; recompile with -fPIC
mut_pthread.o: could not read symbols: Bad value
collect2: ld returned 1 exit status
make[1]: *** [libdb-4.3.la] Error 1
make[1]: Leaving directory
`/home/max/pxe/buildroot-2009.05/build_x86_64/db-4.3.29.NC/build_unix'
make: ***
[/home/max/pxe/buildroot-2009.05/build_x86_64/db-4.3.29.NC/build_unix/.libs/libdb-4.3.so]
Error 2
===


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
