From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 23:19:22 +0200
Subject: [Buildroot] [PATCH v2,1/1] qt: fix build on powerpc_e500mc
In-Reply-To: <20180830163146.4952-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 30 Aug 2018 18:31:46 +0200")
References: <20180830163146.4952-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2he8wpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gcc bug internal compiler error: in validate_condition_mode, at
 > config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.
 > Workaround is to set -mno-isel, see
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
 > https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html

 > This bug is also raised on BR2_powerpc_8540, BR2_powerpc_8548 and
 > BR2_powerpc_e5500.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/9b9d11b3281a72c8f54fc675408acb96d24d8e7e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - apply workaround for BR2_powerpc_8540, BR2_powerpc_8548 and
 >    BR2_powerpc_e5500
 >  - There is no build failure with gcc 7.x toolchain so replace
 >    BR2_TOOLCHAIN_GCC_AT_LEAST_8 by BR2_TOOLCHAIN_GCC_AT_LEAST_7

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
