From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:29:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: broken on or1k
In-Reply-To: <20190831060006.18607-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 31 Aug 2019 08:00:06 +0200")
References: <20190831060006.18607-1-bernd.kuhls@t-online.de>
Message-ID: <87ef11hjws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/961/9618aeffa7d72162d6643a89470c4a01d044a2dc/

This is an old toolchain:

BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"

Does this also happen with E.G. the internal toolchain?

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/ffmpeg/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
 > index a5c05d9c1c..66a8e09c31 100644
 > --- a/package/ffmpeg/Config.in
 > +++ b/package/ffmpeg/Config.in
 > @@ -14,6 +14,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 >  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
 >  	# details.
 >  	depends on !BR2_m68k_cf
 > +	depends on !BR2_or1k # assertion fail in binutils
 
 >  menuconfig BR2_PACKAGE_FFMPEG
 >  	bool "ffmpeg"
 > -- 
 > 2.20.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
