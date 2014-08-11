From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Aug 2014 13:06:09 +0200
Subject: [Buildroot] [PATCH 1/1] espeak : depends on MMU
In-Reply-To: <d0d00ba2-2cf5-4f5a-945a-9f215d587e61@email.android.com> (Thomas
 De Schampheleire's message of "Mon, 11 Aug 2014 10:11:50 +0200")
References: <1407742731-5300-1-git-send-email-arnaud@intelibre.fr>
 <d0d00ba2-2cf5-4f5a-945a-9f215d587e61@email.android.com>
Message-ID: <87wqaf70bi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Hi Arnaud,
 > arnaud at intelibre.fr schreef:
 >> From: Arnaud Aujon <arnaud@intelibre.fr>
 >> 
 >> Fixes autobuild http://autobuild.buildroot.net/results/dae/dae5c59dfa127e1c3f9e3885cdd1b97e54d8fe41/
 >> and http://autobuild.buildroot.net/results/fa0/fa04a0fe7d7a201c5f733bd798c0da50ffb81271/
 >> 
 >> espeak uses fork(), don't work on non-MMU platforms
 >> 
 >> Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
 >> ---
 >> package/espeak/Config.in | 14 ++++++++------
 >> 1 file changed, 8 insertions(+), 6 deletions(-)
 >> 
 >> diff --git a/package/espeak/Config.in b/package/espeak/Config.in
 >> index ec81893..57c7d18 100644
 >> --- a/package/espeak/Config.in
 >> +++ b/package/espeak/Config.in
 >> @@ -1,17 +1,19 @@
 >> -comment "espeak needs a toolchain w/ C++, wchar, threads"
 >> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 >> -
 >> config BR2_PACKAGE_ESPEAK
 >> bool "espeak"
 >> depends on BR2_INSTALL_LIBSTDCPP
 >> depends on BR2_USE_WCHAR
 >> depends on BR2_TOOLCHAIN_HAS_THREADS
 >> +	depends on BR2_USE_MMU # fork()
 >> help
 >> espeak is a speech synthesizer software for English and
 >> other languages.
 >> 
 >> http://espeak.sourceforge.net/
 >> 
 >> +comment "espeak needs a toolchain w/ C++, wchar, threads"
 >> +        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 >> +        depends on BR2_USE_MMU
 >> +

 > While the moving of this comment seems to be the right thing to do, I believe this will break the indentation/nesting of the suboptions of espeak.

Indeed. Comments should go at the very top or bottom of the file. Care
to send a reworked patch that leaves the comment at the top?

-- 
Bye, Peter Korsgaard
