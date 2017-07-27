From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 27 Jul 2017 09:09:16 +0200
Subject: [Buildroot] [PATCH v3] package/qt5location: handle plugins
 being conditionally built
In-Reply-To: <20170725215220.6d447778@windsurf.home>
References: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
 <20170725215220.6d447778@windsurf.home>
Message-ID: <trinity-8a980cb9-66d2-4be0-a688-0ff6f1e041fe-1501139356950@3capp-gmx-bs67>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Joshua,

> 
> Thanks, but Peter had sent an almost identical patch a few hours
> before, and I've applied his patch.
> 
> Thanks a lot for all this work on Qt5, much appreciated! Note that we
> still have a build failure of qt5webkit 5.6.1:
> 
>   http://autobuild.buildroot.net/results/2f3/2f381967c82775ad911a246a9607034ef489c1ce/build-end.log
> 

From the build-end.log:

  The WebKit build was disabled for the following reasons:
      * ICU is required.


ICU depends on BR2_HOST_GCC_AT_LEAST_4_8 and BR2_TOOLCHAIN_GCC_AT_LEAST_4_8, this dependency is propagated to
qt5webkit but not to qt-webkit-kiosk (which selects qt5webkit circumventing the icu prerequisite)...

Patch (propagating the icu dependencies to qt-webkit-kiosk) will follow...

Regards,
Peter


> Thanks!
> 
> Thomas
