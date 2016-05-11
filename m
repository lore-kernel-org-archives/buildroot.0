From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:08:22 +0200
Subject: [Buildroot] [PATCH 4/6] package/kodi-screensaver-rsxs: needs
 xlib_libXmu
In-Reply-To: <1462905623-17739-4-git-send-email-bernd.kuhls@t-online.de>
References: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
 <1462905623-17739-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160511160822.53d36c6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 20:40:21 +0200, Bernd Kuhls wrote:
> Fixes
> 
> /home/bernd/buildroot/output/build/kodi-screensaver-rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/lib/rsxs-1.0/src/common.cc:42:27:
>  fatal error: X11/Xmu/StdCmap.h: No such file or directory
> 
> X11/Xmu/StdCmap.h is included here:
> https://github.com/notspiff/screensavers.rsxs/blob/master/lib/rsxs-1.0/src/common.cc#L48
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied, but I believe you should report an issue upstream: this
package should have a check for libxmu in its configure.ac script, so
that it fails at configure time as expected rather than badly failing
to build later on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
