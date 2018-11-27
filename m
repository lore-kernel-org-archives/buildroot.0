From: Christian Stewart <christian@paral.in>
Date: Mon, 26 Nov 2018 22:24:56 -0800
Subject: [Buildroot] [PATCH next v4 3/6] Makefile: rework main directory
 creation logic
In-Reply-To: <CANQCQpZ=nfbSoOYi9anZhQ8_y51qM1q2f3Uwvr0TQGaSOgh-QQ@mail.gmail.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-4-thomas.petazzoni@bootlin.com>
 <CANQCQpaBS+vSiDngcmfBEJ4GCCKEqt0hXR=4upA2A=++-n-Bpg@mail.gmail.com>
 <20181116151536.666d593a@windsurf> <20181116161447.7632d0bd@windsurf>
 <CANQCQpZ=nfbSoOYi9anZhQ8_y51qM1q2f3Uwvr0TQGaSOgh-QQ@mail.gmail.com>
Message-ID: <878t1fqbpj.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Matthew,

Matthew Weber <matthew.weber@rockwellcollins.com> writes:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_SYSTEMD=y
> BR2_PACKAGE_DOCKER_ENGINE=y
> BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Looking at it a bit further, the  "go build" linking fails when the
> BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is set.  Since there is a
> pending patch for the docker package, I built with the current "next"
> that doesn't have [1] and also with it applied.  I observed that [1]
> fixed the static client build.  When they broke out the client from
> the daemon the linking approach must have changed.

The CLI is linked statically correctly with the new patch applied, which
also splits the CLI and daemon into separate patches and upgrades Docker
to the latest stable.

I'll submit the most recent revision of the patch tonight, after
finishing testing the new release with an odroid xu4, bananapi m1+, and
a pi 0.

Best,
Christian
