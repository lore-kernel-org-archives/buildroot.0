From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 10 Nov 2012 23:26:19 +0000
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
 on target
In-Reply-To: <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CA+wH294SsYiTG9AP9_q==F2-3MKf_Oe75yCM21rSDSgyNTeGcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 November 2012 22:36, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> As discussed during the ELCE 2012 Buildroot Developers Meeting, we no
> longer want to support the possibility of building a toolchain for the
> target. None of the core developers have any use for this, it has been
> known to be broken or cause problems for a long time without anyone
> providing fixes for it.
>
> In addition to this, Buildroot is inherently a cross-compilation tool,
> so the usage of a native toolchain on the target is not really
> useful. Many newcomers are tempted to use this possibility even though
> it is clearly not the intended usage of Buildroot.

If someone took lead on reintroducing this functionality would it be
accepted? There are at least a couple of cases where installing
development files are useful:
* When using buildroot to build a rootfs that is used as a sysroot for
an external build system
* When using e.g. luajit packages which can make use of header files
to generate bindings (not exploited all that much right now due to
lack of preprocessor support in luajit)

Not disagreeing with this being marked deprecated for the time being
at all, I'm just not so sure that devfiles or event native toolchains
are inherently out of the scope of buildroot.

Alex
