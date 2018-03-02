From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:45:35 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180222230055.25455-1-julius@kriukas.lt>
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
Message-ID: <20180302224535.38c7ccd9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Feb 2018 01:00:55 +0200, Julius Kriukas wrote:
> When BR2_REPRODUCIBLE is enabled or host uses non UTF-8 capable locale
> building systemd fails with an error:
> 
> [1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
> FAILED: catalog/systemd.bg.catalog
> /buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
> Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
> You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
> Please switch to a UTF-8 locale for your platform.
> ...
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
> package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
> make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1
> 
> This patch changes default host system locale from C to en_US.UTF-8 when
> building systemd package to fix this issue. It also introduces
> BR2_NEEDS_HOST_EN_US_UTF8_LOCALE flag that checks if this locale is available on
> the host system. If locale is not available error message is show and build
> process is stopped.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>
> 
> ---
> Changes v1 -> v2:
>   - Added BR2_NEEDS_HOST_EN_US_UTF8_LOCALE flag that is selected by
>     BR2_REPRODUCIBLE.
>   - Extended support/dependencies/dependencies.sh to check for
>     en_US.UTF-8 locale availability if BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
>     is set.

I've changed to use C.UTF-8 instead of en_US.UTF-8 and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
