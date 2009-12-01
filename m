From: Nicholas Kinar <n.kinar@usask.ca>
Date: Tue, 01 Dec 2009 09:21:05 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <20091201144803.26ddbe83@surf>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf>
Message-ID: <4B153461.1030404@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> To be honest, for many years, the Buildroot project was mostly
> unmaintaned, so it was basically not possible for all these forks
> (Gumstix, OpenWRT, Armadeus, etc.) to submit their changes and get some
> proper review and integration.
>
> Nowadays, the project is in a much better shape, and I think the
> situation would be different now that potential contributors see that
> the project is active, has an official maintainer, deliver regular
> releases, etc.
>
> Sincerly,
>
> Thomas
>   

After installing some basic utilities from the Fink project (i.e. 
binutils), as well as building and installing some additional software 
(i.e. fakeroot), I can coax buildroot into configuring (i.e. make 
defconfig), downloading the source code (i.e. make source), and 
partially building (make).

Buildroot crashes partially through the install.  If I recall correctly, 
there is trouble with buildroot finding a directory, or difficulties 
building uclibc.

At this time, I don't remember the complete series of steps that I took, 
but I assume that if all of the GNU build dependencies are satisfied on 
the Mac OS X machine, then buildroot should run.  However, this strongly 
depends on the user replacing the BSD utilities with Fink packages.

Here is where buildroot-2009.08 crashes:


Checking build system dependencies:
BUILDROOT_DL_DIR clean:                Ok
CC clean:                    Ok
CXX clean:                    Ok
CPP clean:                    Ok
CFLAGS clean:                    Ok
INCLUDES clean:                    Ok
CXXFLAGS clean:                    Ok
which installed:                Ok
sed works:                    Ok (/sw/bin/sed)
GNU make version '3.81':            Ok
C compiler '/usr/bin/gcc'
C compiler version '4.0.1':            Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.0.1':            Ok
awk installed:                    Ok
bash installed:                    Ok
bison installed:                Ok
flex installed:                    Ok
gettext installed:                Ok
makeinfo installed:                Ok
Build system dependencies:            Ok

rm -rf 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/project_build_avr32/atngw100/buildroot-config
mkdir -p 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/project_build_avr32/atngw100
cp -dpRf package/config/buildroot-config 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/project_build_avr32/atngw100/buildroot-config
set -x && /usr/bin/make -j1 -C 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc-0.9.30-avr32-2.1.5 
\
        
PREFIX=/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc_dev/ 
\
        DEVEL_PREFIX=/usr/ \
        
RUNTIME_PREFIX=/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc_dev/ 
\
        HOSTCC="/usr/bin/gcc" headers \
        install_headers
+ /usr/bin/make -j1 -C 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc-0.9.30-avr32-2.1.5 
PREFIX=/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc_dev/ 
DEVEL_PREFIX=/usr/ 
RUNTIME_PREFIX=/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc_dev/ 
HOSTCC=/usr/bin/gcc headers install_headers
/bin/sh: 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc: 
No such file or directory
make[1]: 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc: 
Command not found
make[1]: 
/Users/nkinar/Desktop/buildroot/buildroot-2009.08/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc: 
Command not found
  HOSTCC extra/locale/gen_locale
extra/locale/gen_locale.c: In function 'do_locale_names':
extra/locale/gen_locale.c:238: warning: format '%d' expects type 'int', 
but argument 3 has type 'long unsigned int'
extra/locale/gen_locale.c:242: warning: format '%d' expects type 'int', 
but argument 3 has type 'long unsigned int'
extra/locale/gen_locale.c: In function 'do_lc_time':
extra/locale/gen_locale.c:954: error: 'ERA_YEAR' undeclared (first use 
in this function)
extra/locale/gen_locale.c:954: error: (Each undeclared identifier is 
reported only once
extra/locale/gen_locale.c:954: error: for each function it appears in.)
extra/locale/gen_locale.c: In function 'lc_numeric_S':
extra/locale/gen_locale.c:986: error: 'GROUPING' undeclared (first use 
in this function)
extra/locale/gen_locale.c: In function 'do_lc_numeric':
extra/locale/gen_locale.c:1056: error: 'GROUPING' undeclared (first use 
in this function)
extra/locale/gen_locale.c:1083:2: warning: #warning fix the char entries 
for monetary... target signedness of char may be different!
extra/locale/gen_locale.c: In function 'lc_monetary_S':
extra/locale/gen_locale.c:1114: error: 'MON_GROUPING' undeclared (first 
use in this function)
extra/locale/gen_locale.c: In function 'do_lc_monetary':
extra/locale/gen_locale.c:1184: error: 'INT_CURR_SYMBOL' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1185: error: 'CURRENCY_SYMBOL' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1186: error: 'MON_DECIMAL_POINT' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1187: error: 'MON_THOUSANDS_SEP' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1188: error: 'MON_GROUPING' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1189: error: 'POSITIVE_SIGN' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1190: error: 'NEGATIVE_SIGN' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1191: error: 'INT_FRAC_DIGITS' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1192: error: 'FRAC_DIGITS' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1193: error: 'P_CS_PRECEDES' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1194: error: 'P_SEP_BY_SPACE' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1195: error: 'N_CS_PRECEDES' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1196: error: 'N_SEP_BY_SPACE' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1197: error: 'P_SIGN_POSN' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1198: error: 'N_SIGN_POSN' undeclared (first 
use in this function)
extra/locale/gen_locale.c:1199: error: 'INT_P_CS_PRECEDES' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1200: error: 'INT_P_SEP_BY_SPACE' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1201: error: 'INT_N_CS_PRECEDES' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1202: error: 'INT_N_SEP_BY_SPACE' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1203: error: 'INT_P_SIGN_POSN' undeclared 
(first use in this function)
extra/locale/gen_locale.c:1204: error: 'INT_N_SIGN_POSN' undeclared 
(first use in this function)
extra/locale/gen_locale.c: In function 'do_lc_ctype':
extra/locale/gen_locale.c:1322: error: '_NL_CTYPE_OUTDIGIT0_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1323: error: '_NL_CTYPE_OUTDIGIT1_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1324: error: '_NL_CTYPE_OUTDIGIT2_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1325: error: '_NL_CTYPE_OUTDIGIT3_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1326: error: '_NL_CTYPE_OUTDIGIT4_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1327: error: '_NL_CTYPE_OUTDIGIT5_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1328: error: '_NL_CTYPE_OUTDIGIT6_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1329: error: '_NL_CTYPE_OUTDIGIT7_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1330: error: '_NL_CTYPE_OUTDIGIT8_MB' 
undeclared (first use in this function)
extra/locale/gen_locale.c:1331: error: '_NL_CTYPE_OUTDIGIT9_MB' 
undeclared (first use in this function)
make[1]: *** [extra/locale/gen_locale] Error 1
make: *** 
[/Users/nkinar/Desktop/buildroot/buildroot-2009.08/toolchain_build_avr32/uClibc-0.9.30-avr32-2.1.5/.configured] 
Error 2
