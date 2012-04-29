From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 12:42:05 +0200
Subject: [Buildroot] [PATCH v2] new package: bellagio
In-Reply-To: <1335286281-8642-1-git-send-email-qais.yousef@imgtec.com> (Qais
 Yousef's message of "Tue, 24 Apr 2012 17:51:21 +0100")
References: <1335286281-8642-1-git-send-email-qais.yousef@imgtec.com>
Message-ID: <87vcki6cqq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Qais" == Qais Yousef <qais.yousef@imgtec.com> writes:

 Qais> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
 Qais> ---

 Qais> I haven't seen the v1 committed, so I am sending v2 here which
 Qais> includes the following additions:

 Qais> 	- Add a patch to fix a runtime error when using dynamicloader.
 Qais> 	- Add a patch to fix when building in parallel.
 Qais> 	- Set AUTORECONF to YES as we modify the Makefile.am

 Qais> All patches have been sent to relevant upstream mailing list.

 Qais> Hope this looks alright! :-)

 Qais> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Qais> index a05d1d9..7e18bcb 100644
 Qais> --- a/package/multimedia/Config.in
 Qais> +++ b/package/multimedia/Config.in
 Qais> @@ -2,6 +2,7 @@ menu "Audio and video libraries and applications"
 Qais>  source "package/multimedia/alsa-lib/Config.in"
 Qais>  source "package/multimedia/alsa-utils/Config.in"
 Qais>  source "package/multimedia/aumix/Config.in"
 Qais> +source "package/multimedia/bellagio/Config.in"
 Qais>  source "package/multimedia/faad2/Config.in"
 Qais>  source "package/multimedia/flac/Config.in"
 Qais>  source "package/multimedia/ffmpeg/Config.in"
 Qais> diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
 Qais> new file mode 100644
 Qais> index 0000000..907709f
 Qais> --- /dev/null
 Qais> +++ b/package/multimedia/bellagio/Config.in
 Qais> @@ -0,0 +1,14 @@
 Qais> +config BR2_PACKAGE_BELLAGIO
 Qais> +	bool "bellagio"
 Qais> +	help
 Qais> +	  Bellagio is an opensource implementation of the
 Qais> +	  OpenMAX IL API.

Bellagio is implemented in C++, so you need to add 'depends on
BR2_INSTALL_LIBSTDCPP'. The configure script also unconditionally adds
-Wall -Werror to CFLAGS, easily breaking the build.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
