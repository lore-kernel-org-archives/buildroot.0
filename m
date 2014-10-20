From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Oct 2014 08:49:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdl_sound: Fix build with
	BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413781229-23932-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 20 Oct 2014 07:00:29 +0200")
References: <1413781229-23932-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87bnp7ck1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > speex.c: In function 'process_header':
 > speex.c:140:10: error: assignment discards 'const' qualifier from pointer target type [-Werror]
 >      mode = speex_mode_list[header.mode];
 >           ^
 > cc1: all warnings being treated as errors

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks, but it would be nice to use something upstreamable
instead. Either fix the constness (speex_mode_list has afaik returned a
const for a very long time) or discuss with upstream about disabling
-Werror in configure.in.

-- 
Bye, Peter Korsgaard
