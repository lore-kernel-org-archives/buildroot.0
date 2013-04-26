From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 26 Apr 2013 11:33:32 +0400
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <64pdjk.r2d.ln@ID-313208.user.individual.net>
References: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
 <64pdjk.r2d.ln@ID-313208.user.individual.net>
Message-ID: <517A2DCC.9060708@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/2013 09:08 AM, Bernd Kuhls wrote:
 > Hi,
 >
 > Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
 > wrote in 
news:1363687526-8469-1-git-send-email-abrodkin-HKixBCOQz3hWk0Htik3J/w at public.gmane.org:
 >
 >> +ifeq ($(BR2_PACKAGE_AVCODEC),y)
 >
 > shouldn?t this be called BR2_PACKAGE_VLC_AVCODEC?
 >
 >> +ifeq ($(BR2_PACKAGE_LUA),y)
 >
 > and this BR2_PACKAGE_VLC_LUA?
 >
 > Regards, Bernd

Hi Bernd,

The idea is to check if "avcodec" and "lua" packages were selected in 
configuration utility (menuconfig/xconfig etc).

Indeed we may rely on VLC's symbols BR2_PACKAGE_AVCODEC and 
BR2_PACKAGE_LUA that select BR2_PACKAGE_FFMPEG and BR2_PACKAGE_LUA 
accordingly.

So initial proposal is to sort of double check if we do have "avcodec" 
and "lua" selected.

Even though you believe it's better to check VLC's own symbols I may do 
a re-spin.

-Alexey
