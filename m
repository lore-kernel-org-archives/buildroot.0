From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Oct 2017 08:20:36 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-10-01
In-Reply-To: <20171002063058.73A6D20968@mail.free-electrons.com>
References: <20171002063058.73A6D20968@mail.free-electrons.com>
Message-ID: <CANQCQpYngM314ZhzOaA82BjCai8xiw1FpS227m9p5i9=nhKE9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Oct 2, 2017 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> Build statistics for 2017-10-01
> ================================
>
>       successes : 214
>        failures : 61
>        timeouts : 0
>           TOTAL : 275
>
> Classification of failures by reason
> ====================================
>

<snip>

>
>  powerpc64le |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/95258b05d9d44d1775fb780d82713fca3c4c23dd | ORPH
>      powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/7befbdc6206e5b9ece0e3336196a031ff7394709 | ORPH
>       mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/fd719822686a3b37084e010677cb0bae6961e9cc | ORPH
>       mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/30957ac0226e4a53b7ccb6fcbe5afa02c556410f | ORPH
>          arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1bd2f68338e1a8ca38c0c3d946cd0ab6e3502535 | ORPH
>       mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/5d205467439f4f2313ccce38b98aa750415ba4a8 | ORPH
>         i686 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/27703beb74be158b4a0ce1ce187b713c9cbffc3a |
>      aarch64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/eae6870c9dc626fc425e4e76bf6b2293ced8469d |
>          arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/09d2b3af3843b4c15e6d98ff9a73b5a3ac2218d2 |
>         m68k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/0158f6c25dee54c76b1831264e6286729b40ff94 |
>          arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/e6c0c844872c46ad315389ca09515f719554adfa |
>       x86_64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/d2d3a7fe0c4009f5c474573070730e94a702dde9 |
>         or1k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/86901d116c8c294d1b681f2039a22537f9ff127a |
>      aarch64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/bf95e377682c024f9dfd9ca75ccf9f21bf551bc6 |


I've brought a RHEL7.4 box online for autobr and I'm sure you've seen
some of different failures.  This one is weird (both host mtd and
squashfs, I think there is something in the configure step not
evaluating correctly for the host dependency for lzo, hoping to get a
chance to look at it this week.


>        arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/d72fc6095ffda260a1fbd268ed443a2f6c7689bd | ORPH
>         or1k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/98f659434128d30bc7b6a2344828769e79296415 | ORPH
>     mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c8202668666f7e2054bf5540fd07e87bf16f8a71 | ORPH
>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/96e0575b72b4f2d98fbad4baa3e5402e9044d10b | ORPH
>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/bfa6442bbc9b65ed7f0aab047b9f4a31ee775442 | ORPH
>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/519e4f60156db6fcee749e6147d237f2e8bddfba | ORPH
>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/0eb1da61683f746d9b12593ffd092e214bdd55ea | ORPH
>          sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/346350305e9416cd11c2fd86aeaec425531b21ff |
>          arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6f1505527b09bd7f4831495abb078dc73b8f295d |

I've installed python3 now on my host and should resolve these
Python.h issues.  Shouldn't be necessary thought so something must
still be touching the host env.

-Matt
