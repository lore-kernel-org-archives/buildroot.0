From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 09 Apr 2014 17:46:35 +0200
Subject: [Buildroot] [PATCH 2/2] exim: new package
In-Reply-To: <53417337.2010801@lucaceresoli.net>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-3-git-send-email-luca@lucaceresoli.net>
 <20140405183515.473bebd4@skate> <53407F98.9080602@lucaceresoli.net>
 <20140406103755.2daa940a@skate> <53417337.2010801@lucaceresoli.net>
Message-ID: <53456B5B.7050109@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, Thomas,

Luca Ceresoli wrote:
...
>>>> My defconfig is:
>>>>
>>>> BR2_arm=y
>>>> BR2_TOOLCHAIN_EXTERNAL=y
>>>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>>>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>>>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2014.02-rc1.tar.bz2"
>>>>
>>>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13=y
>>>> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>>>> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>>>> BR2_PACKAGE_EXIM=y
>>>
>>> I'll have a look at this error.
>
> This is because in my original patch dated 2011 exim was configured in
> a very stripped-down version, just enough to deliver mail locally to
> cyrus-imapd.
>
> At that time this was done coherently in the build configuration file
> (package/exim/Local-Makefile), which disables most optional features,
> and in the runtime configuration file (/etc/exim/configure on the
> target), which does not configure those features.
>
> In my resubmit last month I removed my runtime configuration file which
> was tailored for cyrus-imapd, since I was sending the exim patch alone.
> However I dd notchange the build config file. As it is, it disables
> features such as the dnslookup router, which is enabled by the stock
> runtime config file.
>
> I'm sending a patch that changes the configuration approach in a way
> more similar to Bernd Kuhls' approach: instead of blindly copying a
> minimal Buildroot-provided configuration file, change to copy the
> exim-provided one and tweak it as needed. This actually makes the
> configuration closed to standard exim.

For the records, here's the patch that fixes the issue:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/81356

-- 
Luca
