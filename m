From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Jan 2018 09:54:16 -0600
Subject: [Buildroot] [git commit] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <20180128145128.360AE834A1@busybox.osuosl.org>
References: <20180128145128.360AE834A1@busybox.osuosl.org>
Message-ID: <CANQCQpZY6fS8rojojQx4D3cYWV6ZYWifJoRGZnxiTF3LyWzquw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Peter,

On Sun, Jan 28, 2018 at 8:21 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=20a4583ebf7fe97ea22a1ea11621dd44a8114ca5
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This enables a user to build a complete system using these
> options.  It is important to note that not all packages will
> build correctly to start with.
>
> Modeled after OpenWRT approach
> https://github.com/openwrt/openwrt/blob/master/config/Config-build.in#L176
>
> A good testing tool to check a target's elf files for compliance
> to an array of hardening techniques can be found here:
> https://github.com/slimm609/checksec.sh
>

I've internally started to look at build failures across all packages
with the following config set in an off-line autobuilder.
BR2_OPTIMIZE_1=y
BR2_RELRO_FULL=y
BR2_FORTIFY_SOURCE_1=y
BR2_SSP_STRONG=y

So far things are pretty broken but we'll see after I get past the tip
of the iceburg how much work it might take to turn on a basic set of
these options for regression.

I sent some of the package fix-ups as part of this initial series but
will probably refresh the series after I get a few more of the big
failures worked out.

Matt
