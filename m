From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 18:55:23 +0100
Subject: [Buildroot] Strange message
In-Reply-To: <20170323182321.646a87dd@free-electrons.com>
References: <1f799db0-e1ae-56f7-7361-8d3a1dd5d750@grandegger.com>
 <20170323182321.646a87dd@free-electrons.com>
Message-ID: <a193ef41-71e9-4640-2136-c903eedc48ce@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo,

Am 23.03.2017 um 18:23 schrieb Thomas Petazzoni:
> Hello,
>
> On Thu, 23 Mar 2017 16:03:27 +0100, Wolfgang Grandegger wrote:
>
>> what does the message below mean:
>>
>>>>> qt5xmlpatterns 5.6.2 Fixing libtool files
>> qt5xmlpatterns: installs files in /opt/bdo/dcu_host/host/usr/x86_64-buildroot-linux-gnu/sysroot//opt/bdo/dcu_host
>> make[1]: *** [/opt/bdo/dcu_host/build/qt5xmlpatterns-5.6.2/.stamp_staging_installed] Fehler 1
>
> The thing that it checks is if you're installing files in
> $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O) which is exactly what's going
> on.
>
> Your O is /opt/bdo/dcu_host/, or your staging dir
> is /opt/bdo/dcu_host/host/usr/x86_64-buildroot-linux-gnu/sysroot/ and
> therefore $(STAGING_DIR)/$(O)
> is /opt/bdo/dcu_host/host/usr/x86_64-buildroot-linux-gnu/sysroot//opt/bdo/dcu_host.
> This generally indicates a bogus build system, because there's no
> reason for a directory identical to $(O) to creep in into the
> target/staging directories.
>
> See package/pkg-generic.mk for the implementation of
> step_check_build_dir.

OK, I see! Then it was my qt.conf which did break the build.

Thanks,

Wolfgang.
