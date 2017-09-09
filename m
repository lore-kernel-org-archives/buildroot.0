From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:22:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 11.0
In-Reply-To: <20170908170725.12590-1-bernd.kuhls@t-online.de>
References: <20170908170725.12590-1-bernd.kuhls@t-online.de>
Message-ID: <20170909222249.69269bdb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Sep 2017 19:07:25 +0200, Bernd Kuhls wrote:
> Release notes:
> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/
> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/11.0/
> 
> Dependency to json-c was dropped, updated reverse dependencies as well

When doing this propagation, you removed depends on
BR2_TOOLCHAIN_HAS_SYNC_4 from the options, but not from the Config.in
comment. Example with BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE, where
you did not modify:

comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
        depends on BR2_USE_MMU
        depends on BR2_TOOLCHAIN_HAS_SYNC_4
        depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
