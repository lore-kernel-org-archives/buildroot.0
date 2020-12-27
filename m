From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:16:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix build on mips r6
In-Reply-To: <20201227104442.889130-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 27 Dec 2020 11:44:42 +0100")
References: <20201227104442.889130-1-bernd.kuhls@t-online.de>
Message-ID: <87czyvbd98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/4a5/4a582af6b66c59a61b75a7047d8530202972ebdd/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hmm, this seems to be identical to
package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch,
which got added by:

commit c599d699028bb313384daf51b0a21bb220a60c67
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Tue Nov 3 18:13:28 2020 +0100

    package/pcre2: fix build on mips r6

    Fix build of pcre2 10.35 on mips r6:
    https://bugs.exim.org/show_bug.cgi?id=2667

    Fixes:
     - http://autobuild.buildroot.org/results/eab208c050867c9bd12bd80dca33cbe0199b0a7d

    Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

How come php uses a bundled copy of pcre2? Can't we make it use our
external one instead?

-- 
Bye, Peter Korsgaard
