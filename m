From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Sat, 31 Jul 2010 11:05:11 +0530
Subject: [Buildroot] BR compile on FreeBSD
Message-ID: <AANLkTiks7OCXF8VVY2u7bWtzvPSvYzoN0HEDX2YdobQy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Please don't get cranky about this. I feel BSDs are best for cross compile.
Two Linux boxes with Lenny, one compiles BR perfectly and other gives all
sort of troubles on a git clone and .config from the first - iconv issues,
libglib issues, i am fed up.

Getting the following on FreeBSD:-

gmake[1]: Entering directory `/usr/buildroot/output/toolchain/uClibc-0.9.31'
  HOSTCC extra/locale/gen_locale
In file included from extra/locale/gen_locale.c:13:
extra/locale/c8tables.h:23:1: error: unterminated #ifdef
extra/locale/gen_locale.c: In function 'do_lc_time':
extra/locale/gen_locale.c:954: error: 'ERA_YEAR' undeclared (first use in
this function)
extra/locale/gen_locale.c:954: error: (Each undeclared identifier is
reported only once
extra/locale/gen_locale.c:954: error: for each function it appears in.)
extra/locale/gen_locale.c: In function 'lc_numeric_S':
extra/locale/gen_locale.c:986: error: 'GROUPING' undeclared (first use in
this function)
extra/locale/gen_locale.c: In function 'do_lc_numeric':
extra/locale/gen_locale.c:1056: error: 'GROUPING' undeclared (first use in
this function)
extra/locale/gen_locale.c:1083:2: warning: #warning fix the char entries for
monetary... target signedness of char may be different!
extra/locale/gen_locale.c: In function 'lc_monetary_S':
extra/locale/gen_locale.c:1114: error: 'MON_GROUPING' undeclared (first use
in this function)
extra/locale/gen_locale.c: In function 'do_lc_monetary':
extra/locale/gen_locale.c:1184: error: 'INT_CURR_SYMBOL' undeclared (first
use in this function)
extra/locale/gen_locale.c:1185: error: 'CURRENCY_SYMBOL' undeclared (first
use in this function)
extra/locale/gen_locale.c:1186: error: 'MON_DECIMAL_POINT' undeclared (first
use in this function)
extra/locale/gen_locale.c:1187: error: 'MON_THOUSANDS_SEP' undeclared (first
use in this function)
extra/locale/gen_locale.c:1188: error: 'MON_GROUPING' undeclared (first use
in this function)
extra/locale/gen_locale.c:1189: error: 'POSITIVE_SIGN' undeclared (first use
in this function)
extra/locale/gen_locale.c:1190: error: 'NEGATIVE_SIGN' undeclared (first use
in this function)
extra/locale/gen_locale.c:1191: error: 'INT_FRAC_DIGITS' undeclared (first
use in this function)
extra/locale/gen_locale.c:1192: error: 'FRAC_DIGITS' undeclared (first use
in this function)
extra/locale/gen_locale.c:1193: error: 'P_CS_PRECEDES' undeclared (first use
in this function)
extra/locale/gen_locale.c:1194: error: 'P_SEP_BY_SPACE' undeclared (first
use in this function)
extra/locale/gen_locale.c:1195: error: 'N_CS_PRECEDES' undeclared (first use
in this function)
extra/locale/gen_locale.c:1196: error: 'N_SEP_BY_SPACE' undeclared (first
use in this function)
extra/locale/gen_locale.c:1197: error: 'P_SIGN_POSN' undeclared (first use
in this function)
extra/locale/gen_locale.c:1198: error: 'N_SIGN_POSN' undeclared (first use
in this function)
extra/locale/gen_locale.c:1199: error: 'INT_P_CS_PRECEDES' undeclared (first
use in this function)
extra/locale/gen_locale.c:1200: error: 'INT_P_SEP_BY_SPACE' undeclared
(first use in this function)
extra/locale/gen_locale.c:1201: error: 'INT_N_CS_PRECEDES' undeclared (first
use in this function)
extra/locale/gen_locale.c:1202: error: 'INT_N_SEP_BY_SPACE' undeclared
(first use in this function)
extra/locale/gen_locale.c:1203: error: 'INT_P_SIGN_POSN' undeclared (first
use in this function)
extra/locale/gen_locale.c:1204: error: 'INT_N_SIGN_POSN' undeclared (first
use in this function)
extra/locale/gen_locale.c: In function 'do_lc_ctype':
extra/locale/gen_locale.c:1322: error: '_NL_CTYPE_OUTDIGIT0_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1323: error: '_NL_CTYPE_OUTDIGIT1_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1324: error: '_NL_CTYPE_OUTDIGIT2_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1325: error: '_NL_CTYPE_OUTDIGIT3_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1326: error: '_NL_CTYPE_OUTDIGIT4_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1327: error: '_NL_CTYPE_OUTDIGIT5_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1328: error: '_NL_CTYPE_OUTDIGIT6_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1329: error: '_NL_CTYPE_OUTDIGIT7_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1330: error: '_NL_CTYPE_OUTDIGIT8_MB' undeclared
(first use in this function)
extra/locale/gen_locale.c:1331: error: '_NL_CTYPE_OUTDIGIT9_MB' undeclared
(first use in this function)
gmake[1]: *** [extra/locale/gen_locale] Error 1
gmake[1]: Leaving directory `/usr/buildroot/output/toolchain/uClibc-0.9.31'
gmake: *** [/usr/buildroot/output/toolchain/uClibc-0.9.31/.configured] Error
2


regards

Nataraj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100731/a4a8bca7/attachment-0001.html>
