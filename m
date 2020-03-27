From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 08:18:34 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: fix build if net-snmp is
 installed on the host
In-Reply-To: <20200316150106.8800-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 16 Mar 2020 16:01:05 +0100")
References: <20200316150106.8800-1-patrickdepinguin@gmail.com>
Message-ID: <87sghufeph.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > If syslog-ng is selected in Buildroot and net-snmp is not, but net-snmp is
 > found on the host machine (at least its net-snmp-config script) then
 > compilation of syslog-ng fails with:

 >   CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-grammar.lo
 >   CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest.lo
 >   CC       modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-plugin.lo
 > arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
 > make[3]: *** [Makefile:17397: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-grammar.lo] Error 1
 > make[3]: *** Waiting for unfinished jobs....
 > arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
 > make[3]: *** [Makefile:17404: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest.lo] Error 1
 > arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
 > make[3]: *** [Makefile:17411: modules/snmp-dest/modules_snmp_dest_libsnmpdest_la-snmpdest-plugin.lo] Error 1
 > make[2]: *** [Makefile:21428: all-recursive] Error 1
 > make[1]: *** [Makefile:8740: all] Error 2
 > make[1]: Leaving directory '.../buildroot/output/build/syslog-ng-3.25.1'
 > make: *** [package/pkg-generic.mk:269: .../buildroot/output/build/syslog-ng-3.25.1/.stamp_built] Error 2

 > The path /usr/include is obtained via /usr/bin/net-snmp-config.

 > The fix comprises two parts:
 > 1. only enable net-snmp support in syslog-ng if the net-snmp package is
 > enabled in Buildroot
 > 2. for the case where net-snmp is selected in Buildroot, fix the configure
 > script of syslog-ng to allow parsing --with-netsnmp=<path> correctly.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2019.11.x and 2020.02.x, thanks. 2019.02.x uses an older
syslog-ng version and the patch does not apply as is.

-- 
Bye, Peter Korsgaard
