From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 08 Nov 2015 17:21:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Fix linking with
	libvorbis
References: <1446993776-26617-1-git-send-email-bernd.kuhls@t-online.de>
 <20151108154516.28033c10@free-electrons.com>
Message-ID: <7e94hcxe4s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 08 Nov 2015 15:45:16 +0100 schrieb Thomas Petazzoni:

>> +-if test "$_libvorbis" = auto; then
>> ++if test "$_libvorbis" != no; then
> 
> Are you sure this is the correct fix? I believe for MPlayer, the
> behavior of all options is that if you do --enable-<foo>, Mplayer
> enables <foo> without doing any checks for it.

Hi Thomas,

you are right, Mplayer configure is not autoconf-based..., this is v2 of 
my patch: http://patchwork.ozlabs.org/patch/541462/

Regards, Bernd
