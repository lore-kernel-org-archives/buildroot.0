From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Oct 2015 21:34:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Add optional
	dependencies
References: <1445085118-8020-1-git-send-email-bernd.kuhls@t-online.de>
 <20151017163018.537a9963@free-electrons.com>
Message-ID: <96tffcxklv.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 17 Oct 2015 16:30:18 +0200 schrieb Thomas Petazzoni:

> On Sat, 17 Oct 2015 14:31:58 +0200, Bernd Kuhls wrote:
>> Disable libcdio and libilbc since they are incompatible with ffmpeg.
> 
> It isn't really clear what you mean by "they are incompatible with
> ffmpeg". Are you talking about the specific version of those libraries
> we have in Buildroot?
> 
> Nonetheless, I've applied the patch since it's reasonable to explicitly
> disable libraries for which we don't have support at the moment.

Hi Thomas,

detecting libilbc fails with

ffconf.DC5UxjIt.c:(.text.startup+0x1b): undefined reference to 
`WebRtcIlbcfix_InitDecode'

This function is not part of our libilbc version.

Detecting libcdio fails with

/tmp/ffconf.bwyXkIcF.c:1:32: fatal error: cdio/paranoia/cdda.h: No such 
file or directory
 #include <cdio/paranoia/cdda.h>

According to https://ffmpeg.org/pipermail/ffmpeg-cvslog/2013-
January/059617.html we need a seperate cdparanoia package because the 
headers needed by ffmpeg were split from libcdio. According to https://
bugs.busybox.net/show_bug.cgi?id=7826 there is no cdparanoia package in 
buildroot.

Regards, Bernd
