From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 Apr 2008 06:56:34 -0700
Subject: [Buildroot] [buildroot 0003004]: undefined reference problem
Message-ID: <6d549fad81eae11f610ec1e0b71259b5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3004 
====================================================================== 
Reported By:                gebecom
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3004
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-21-2008 01:17 PDT
Last Modified:              04-22-2008 06:56 PDT
====================================================================== 
Summary:                    undefined reference problem
Description: 
/opt/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/bin/ld:
cannot find /opt/usr/local/arm/gcc-4.1.2-uclibc/lib/libc.so.0
collect2: ld returned 1 exit status

actually it is trying to get libc.so.s0 from a wrong path, i copied the
files at that particular file path but it fails at some next stage giving
the error details below...

/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towupper_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtold_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strftime_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__nl_langinfo_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__newlocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__freelocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsxfrm_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__iswctype_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towlower_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtod_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__uselocale'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strcoll_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wctype_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strxfrm_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsftime_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtof_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcscoll_l'
/opt/atmel/gcc-4.1.2-uclibc/bin/../lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/lib/libstdc++.so:
undefined reference to `__duplocale'

please guide me how can i fix this issue and the possible reason, 
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 04-21-08 07:09  
---------------------------------------------------------------------- 
Where did you get your compiler? It doesn't seem to have been built with
buildroot (in that case it would be installed in build_$arch/staging_dir,
not in /opt/atmel). I think you should complain to the vendor, as
buildroot can't fix a broken external toolchain. 

---------------------------------------------------------------------- 
 gebecom - 04-21-08 07:17  
---------------------------------------------------------------------- 
i have wrong kopiert, hier is the error
how can i solve the question?
Generating embedded module rules ...
   [CC] stereorize.c -> stereorize.o
   [CC] frame.c -> frame.o
   [LD] stereorize.o frame.o -> stereorize
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towupper_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtold_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strftime_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__nl_langinfo_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__newlocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__freelocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsxfrm_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__iswctype_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towlower_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtod_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__uselocale'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strcoll_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wctype_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strxfrm_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsftime_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtof_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcscoll_l'
/build-tools/buildroot/build_mipsel/staging_dir/bin-ccache/../lib/gcc/mipsel-linux-uclibc/3.4.6/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__duplocale'
collect2: ld returned 1 exit status
make[1]: *** [stereorize] Error 1
make: *** [utils] Error 2

 

---------------------------------------------------------------------- 
 hmoffatt - 04-21-08 07:24  
---------------------------------------------------------------------- 
It looks like whatever package you are building (stereorize.o etc) needs
WCHAR support in uClibc which is disabled in your build. 

make uclibc-menuconfig and turn on "wide character support" under "string
and stdio" support. 

---------------------------------------------------------------------- 
 gebecom - 04-22-08 03:50  
---------------------------------------------------------------------- 
it works!
thanks!

 

---------------------------------------------------------------------- 
 hmoffatt - 04-22-08 03:02  
---------------------------------------------------------------------- 
Can you tell us which package was failing to compile? Maybe we can prevent
this problem from happening to other people. Thanks. 

---------------------------------------------------------------------- 
 gebecom - 04-22-08 03:56  
---------------------------------------------------------------------- 
i solve the problem with your guide.
i will cross compile asterisk.(port to asterisk)
after configure i excute make.
but it fails, error is:
[CC] hash/hash.c -> hash/hash.o
   [CC] hash/hash_bigkey.c -> hash/hash_bigkey.o
   [CC] hash/hash_buf.c -> hash/hash_buf.o
   [CC] hash/hash_func.c -> hash/hash_func.o
   [CC] hash/hash_log2.c -> hash/hash_log2.o
   [CC] hash/hash_page.c -> hash/hash_page.o
   [CC] hash/ndbm.c -> hash/ndbm.o
   [CC] btree/bt_close.c -> btree/bt_close.o
   [CC] btree/bt_conv.c -> btree/bt_conv.o
   [CC] btree/bt_debug.c -> btree/bt_debug.o
   [CC] btree/bt_delete.c -> btree/bt_delete.o
   [CC] btree/bt_get.c -> btree/bt_get.o
   [CC] btree/bt_open.c -> btree/bt_open.o
   [CC] btree/bt_overflow.c -> btree/bt_overflow.o
   [CC] btree/bt_page.c -> btree/bt_page.o
   [CC] btree/bt_put.c -> btree/bt_put.o
   [CC] btree/bt_search.c -> btree/bt_search.o
   [CC] btree/bt_seq.c -> btree/bt_seq.o
   [CC] btree/bt_split.c -> btree/bt_split.o
   [CC] btree/bt_utils.c -> btree/bt_utils.o
   [CC] db/db.c -> db/db.o
   [CC] mpool/mpool.c -> mpool/mpool.o
   [CC] recno/rec_close.c -> recno/rec_close.o
   [CC] recno/rec_delete.c -> recno/rec_delete.o
   [CC] recno/rec_get.c -> recno/rec_get.o
   [CC] recno/rec_open.c -> recno/rec_open.o
   [CC] recno/rec_put.c -> recno/rec_put.o
   [CC] recno/rec_search.c -> recno/rec_search.o
   [CC] recno/rec_seq.c -> recno/rec_seq.o
   [CC] recno/rec_utils.c -> recno/rec_utils.o
   [AR] hash/hash.o hash/hash_bigkey.o hash/hash_buf.o hash/hash_func.o
hash/hash_log2.o hash/hash_page.o hash/ndbm.o btree/bt_close.o
btree/bt_conv.o btree/bt_debug.o btree/bt_delete.o btree/bt_get.o
btree/bt_open.o btree/bt_overflow.o btree/bt_page.o btree/bt_put.o
btree/bt_search.o btree/bt_seq.o btree/bt_split.o btree/bt_utils.o db/db.o
mpool/mpool.o recno/rec_close.o recno/rec_delete.o recno/rec_get.o
recno/rec_open.o recno/rec_put.o recno/rec_search.o recno/rec_seq.o
recno/rec_utils.o -> libdb1.a
   [LD] abstract_jb.o acl.o aescrypt.o aeskey.o aestab.o alaw.o app.o
ast_expr2.o ast_expr2f.o asterisk.o astmm.o astobj2.o audiohook.o
autoservice.o callerid.o cdr.o channel.o chanvars.o cli.o config.o
cryptostub.o db.o devicestate.o dial.o dns.o dnsmgr.o dsp.o enum.o file.o
fixedjitterbuf.o frame.o fskmodem.o global_datastores.o http.o image.o
indications.o io.o jitterbuf.o loader.o logger.o manager.o md5.o netsock.o
pbx.o plc.o privacy.o rtp.o say.o sched.o sha1.o slinfactory.o srv.o
stdtime/localtime.o strcompat.o tdd.o term.o threadstorage.o translate.o
udptl.o ulaw.o utils.o editline/libedit.a db1-ast/libdb1.a -> asterisk
dns.o: In function `ast_search_dns':
/gebecom/asterisk-1.4.19/main/dns.c:285: undefined reference to
`__res_close'
collect2: ld returned 1 exit status
make[1]: *** [asterisk] Error 1
make: *** [main] Error 2

please guide me how can i fix this issue and the possible reason,
thanks in advances 

---------------------------------------------------------------------- 
 bernhardf - 04-22-08 05:29  
---------------------------------------------------------------------- 
asterisk should be fixed not to rely on such BSD-ism.
I suppose you fix asterisk and submit your patch to the
asterisk-developers.

As a quick workaround, enable res_close in uClibc (IIRC in networking,
marged BSD-compat). 

---------------------------------------------------------------------- 
 hmoffatt - 04-22-08 06:56  
---------------------------------------------------------------------- 
Are you using the asterisk package in buildroot (package/asterisk), or
simply using the buildroot-generated toolchain to compile it yourself?

I think the latter because you mention version 1.4.9, while the asterisk
package in buildroot specifies 1.6.0-beta6.

It looks like asterisk is calling internal glibc functions to do DNS
resolution. At this point it's really a uClibc issue rather than a
buildroot issue, and you really can't expect uClibc to be providing
internal glibc interfaces.

The buildroot asterisk package has a patch which MAY help - look in
package/asterisk. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-21-08 01:17  gebecom        New Issue                                    
04-21-08 01:17  gebecom        Status                   new => assigned     
04-21-08 01:17  gebecom        Assigned To               => buildroot       
04-21-08 07:09  hmoffatt       Note Added: 0006794                          
04-21-08 07:14  gebecom        Issue Monitored: gebecom                     
04-21-08 07:16  gebecom        Note Added: 0006804                          
04-21-08 07:17  gebecom        Note Edited: 0006804                         
04-21-08 07:24  hmoffatt       Note Added: 0006814                          
04-21-08 07:35  gebecom        Note Added: 0006824                          
04-21-08 07:37  gebecom        Note Edited: 0006824                         
04-21-08 07:38  gebecom        Note Edited: 0006824                         
04-21-08 08:04  gebecom        Note Added: 0006834                          
04-22-08 02:46  gebecom        Note Deleted: 0006834                        
04-22-08 02:46  gebecom        Note Edited: 0006824                         
04-22-08 03:02  hmoffatt       Note Added: 0006874                          
04-22-08 03:50  gebecom        Note Edited: 0006824                         
04-22-08 03:56  gebecom        Note Added: 0006884                          
04-22-08 05:29  bernhardf      Note Added: 0006904                          
04-22-08 06:56  hmoffatt       Note Added: 0006914                          
======================================================================
