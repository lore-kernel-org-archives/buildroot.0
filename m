From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Jan 2016 17:38:24 +0100
Subject: [Buildroot] Failed to run make after moving the Buildroot
 folder to another directory (Ubuntu to windows partition)
In-Reply-To: <CABi8WTyDTBNuwiznDUU=Z7-hrBLxUmtJch-3JDkSGd=VMMnztA@mail.gmail.com>
References: <CABi8WTyRfz87yBsd5C2REFvKQvfe3PKOhNgSaO50z-1iBP8etA@mail.gmail.com>
 <CA+LtECD-qTmmA457zudv2T0yuCvjGWoQeyaPHuHjQqW+0F+C1Q@mail.gmail.com>
 <CABi8WTyDTBNuwiznDUU=Z7-hrBLxUmtJch-3JDkSGd=VMMnztA@mail.gmail.com>
Message-ID: <56A7A100.9050305@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

FrAnKenStEiN MC wrote:
> Hi , the first solution can be done by running make clean right ?

Right.

'make clean' is roughly equivalent to removing the output directory.

> ?
>
> 2016-01-26 7:21 GMT+00:00 Zolt?n Gyarmati <mr.zoltan.gyarmati@gmail.com
> <mailto:mr.zoltan.gyarmati@gmail.com>>:
>
>     Dear FrAnKenStEiN,
>
>
>     unfortunately you can't just relocate the built buildroot tree like
>     that, so if you really want to relocate, you have to remove the
>     whole 'output' directory and rebuild everything. One other thing you
>     can easily do is to keep the whole buildroot tree (together with
>     your populated output dir) at it's original place, but move out the
>     'dl' dir (which contains the downloaded source tarballs) to
>     somewhere else, and set the 'BR2_DL_DIR' (Build options ->Download
>     dir in menuconfig) dir accordingly.
>
>     Regards
>     zgyarmati
>
>     On Tue, Jan 26, 2016 at 2:48 AM, FrAnKenStEiN MC <chfakht@gmail.com
>     <mailto:chfakht@gmail.com>> wrote:
>
>         Hi , i runned make to build a system for my raspberry .... after
>         a while i was out of space on my linux partition so i have moved
>         the buildroot folder to a windows partition but i have set the
>           NTFS partition executable:
>
>         link to the method used :
>         http://askubuntu.com/questions/245154/how-to-get-permissions-to-execute-programs-from-ntfs-hard-drive
>
>         Just to test if anything has gone wrong i have runned the make
>         command witout any change from the new buildroot directory
>
>         *make 2>&1 | tee logfile*
>
>         He produce an error and here is the complete output :
>
>         [7m>>> host-libconfuse 9413a82f9cb56a94f71fa420f146e841c5372ed8
>         Configuring [27m
>         [7m>>> host-libconfuse 9413a82f9cb56a94f71fa420f146e841c5372ed8
>         Gettextizing [27m
>         Can't locate Autom4te/C4che.pm in @INC (you may need to install
>         the Autom4te::C4che module) (@INC contains:
>         /home/larbi/PFA/buildroot/output/host/usr/share/autoconf
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/lib/perl
>         /etc/perl /usr/local/lib/perl/5.18.2
>         /usr/local/share/perl/5.18.2 /usr/lib/perl5 /usr/share/perl5
>         /usr/lib/perl/5.18 /usr/share/perl/5.18 /usr/local/lib/site_perl
>         .) at
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/bin/autom4te
>         line 37.
>         BEGIN failed--compilation aborted at
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/bin/autom4te
>         line 37.
>         Copying file support/config.rpath
>         Not copying intl/ directory.
>         Copying file po/Makefile.in.in <http://Makefile.in.in>
>         Copying file po/Makevars.template
>         Copying file po/Rules-quot
>         Copying file po/boldquot.sed
>         Copying file po/en at boldquot.header
>         Copying file po/en at quot.header
>         Copying file po/insert-header.sin
>         Copying file po/quot.sed
>         Copying file po/remove-potcdate.sin
>         Copying file m4/gettext.m4
>         Copying file m4/iconv.m4
>         Copying file m4/lib-ld.m4
>         Copying file m4/lib-link.m4
>         Copying file m4/lib-prefix.m4
>         Copying file m4/nls.m4
>         Copying file m4/po.m4
>         Copying file m4/progtest.m4
>         Copying file m4/codeset.m4
>         Copying file m4/fcntl-o.m4
>         Copying file m4/glibc2.m4
>         Copying file m4/glibc21.m4
>         Copying file m4/intdiv0.m4
>         Copying file m4/intl.m4
>         Copying file m4/intldir.m4
>         Copying file m4/intlmacosx.m4
>         Copying file m4/intmax.m4
>         Copying file m4/inttypes_h.m4
>         Copying file m4/inttypes-pri.m4
>         Copying file m4/lcmessage.m4
>         Copying file m4/lock.m4
>         Copying file m4/longlong.m4
>         Copying file m4/printf-posix.m4
>         Copying file m4/size_max.m4
>         Copying file m4/stdint_h.m4
>         Copying file m4/threadlib.m4
>         Copying file m4/uintmax_t.m4
>         Copying file m4/visibility.m4
>         Copying file m4/wchar_t.m4
>         Copying file m4/wint_t.m4
>         Copying file m4/xsize.m4
>
>         Please update po/Makevars so that it defines all the variables
>         mentioned
>         in po/Makevars.template.
>         You can then remove po/Makevars.template.
>
>         Please run 'aclocal -I m4' to regenerate the aclocal.m4 file.
>         You need aclocal from GNU automake 1.8 (or newer) to do this.
>         Then run 'autoconf' to regenerate the configure file.
>
>         You will also need config.guess and config.sub, which you can
>         get from the CVS
>         of the 'config' project at http://savannah.gnu.org/. The
>         commands to fetch them
>         are
>         $ wget
>         'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess'
>         $ wget
>         'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub'
>
>         You might also want to copy the convenience header file gettext.h
>         from the
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/share/gettext
>         directory into your package.
>         It is a wrapper around <libintl.h> that implements the configure
>         --disable-nls
>         option.
>
>         [7m>>> host-libconfuse 9413a82f9cb56a94f71fa420f146e841c5372ed8
>         Autoreconfiguring [27m
>         Can't locate Autom4te/ChannelDefs.pm in @INC (you may need to
>         install the Autom4te::ChannelDefs module) (@INC contains:
>         /home/larbi/PFA/buildroot/output/host/usr/share/autoconf
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/lib/perl
>         /etc/perl /usr/local/lib/perl/5.18.2
>         /usr/local/share/perl/5.18.2 /usr/lib/perl5 /usr/share/perl5
>         /usr/lib/perl/5.18 /usr/share/perl/5.18 /usr/local/lib/site_perl
>         .) at
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/bin/autoreconf
>         line 39.
>         BEGIN failed--compilation aborted at
>         /media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/host/usr/bin/autoreconf
>         line 39.
>         make[1]: ***
>         [/media/larbi/8A6E1DC96E1DAEC7/PFA/buildroot/output/build/host-libconfuse-9413a82f9cb56a94f71fa420f146e841c5372ed8/.stamp_configured]
>         Error 2
>         make: *** [_all] Error 2
>
>         What i can understund is that the issue came from this line :
>         *Can't locate Autom4te/C4che.pm in @INC (you may need to install
>         the Autom4te::C4che module) *
>         *
>         *
>         I'm just a newbie to buildroot , i won't take the risk following
>         some suggestions on the net
>         *thanks*
>         ?
>
>         _______________________________________________
>         buildroot mailing list
>         buildroot at busybox.net <mailto:buildroot@busybox.net>
>         http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Luca
