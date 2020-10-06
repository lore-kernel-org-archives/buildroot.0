From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 22:24:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ebtables: bump to version
 2.0.11
In-Reply-To: <20200427212653.29933-1-ryanbarnett3@gmail.com>
References: <20200427212653.29933-1-ryanbarnett3@gmail.com>
Message-ID: <20201006222432.378c0385@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 16:26:52 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> With the version bump to 2.0.11, ebtables switch to autotools build
> system. In addition, ebtables-{restore/save} moved to being installed
> as ebtables-legacy-{restore/save}.
> 
> Changes to support this version bump include:
> 
>  * Remove dependency on !BR2_STATIC_LIBS for ebtables-restore as the
>    switch to autotools supports compiling with static libraries.
>  * Update ebtables-save script patch to use /usr/sbin/ebtables-legacy
>  * Remove 0001-*-ethernetdb*.patch as it was merged with commit:
>      http://git.netfilter.org/ebtables/commit/?id=f8079671326e9fd079391d24911a9a8a77f1d6fd
>  * Remove 0002-*-musl-*.patch as support was added with commit:
>      http://git.netfilter.org/ebtables/commit/?id=9fff3d5f9da00255463d28b38d688c25025b7fb1
> 
> Tested with test-pkg with BR2_PACKAGE_EBTABLES=y:
> 
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
