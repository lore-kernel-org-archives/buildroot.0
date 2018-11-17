From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 17 Nov 2018 07:15:33 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-15
In-Reply-To: <20181116070015.AF42620736@mail.bootlin.com>
References: <20181116070015.AF42620736@mail.bootlin.com>
Message-ID: <CANQCQpZB-8Xb5VPkukqeex4fk4eUxstc6rbHB+pykQnjgbKJOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Nov 16, 2018 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-11-15
> ===============================
>

[snip]

>       x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e14007c638f225ec718eb0be9323626f2bcf3a71 |

This build failure has been around for awhile and is related to the
host machine's GCC not having stack protector support.  Currently it
happens to be the case on the "Xogium (Arch Linux)" machine. Prior to
that Joseph Kogut had a couple brauto machines with similar.

This dependency is on the host machines's GCC because of the need to
build 32bit code on x86-64 bit Buildroot targets.  (Only x86_64
targets are failing and there is a note in the pkg's .mk.
http://autobuild.buildroot.net/?reason=kvm-unit-tests-kvm-unit-tests-20171020)

Who is running the Xogium builder?  I was wondering if they could run
the kernel's SSP detection script[1] and provide the output/exit code.
I'll then add a configure test patch do to similar for this package.

Thanks!
Matt


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/gcc-x86_32-has-stack-protector.sh?h=v4.20-rc2
