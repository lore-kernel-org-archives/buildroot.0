From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 May 2013 19:36:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-05-17
In-Reply-To: <20130518063006.E936E52C0F6@lolut.humanoidz.org>
References: <20130518063006.E936E52C0F6@lolut.humanoidz.org>
Message-ID: <20130518193629.4367854c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 May 2013 08:30:06 +0200 (CEST), Thomas Petazzoni wrote:
> Build statistics for 2013-05-17
> ===============================
> 
>         success : 70 
>        failures : 39 
>        timeouts : 3  
>           TOTAL : 112

Ok, I found the reason for the timeouts. The fact that they always
happen on qt5base helped me to understand what's going on: my build
script doesn't automatically enable
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED when Qt5 is selected. My build
script does that for Qt4, but not yet for Qt5.

This is now fixed, so hopefully it should make those timeouts disappear.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
