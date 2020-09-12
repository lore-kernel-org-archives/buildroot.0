From: Christian Stewart <christian@paral.in>
Date: Sat, 12 Sep 2020 00:18:34 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-11
In-Reply-To: <5f5c7475.1c69fb81.de413.a4f5SMTPIN_ADDED_MISSING@mx.google.com>
References: <5f5c7475.1c69fb81.de413.a4f5SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CA+h8R2qENZw1QQKcW628FCHf-tS7JHRrNPa4NMV7QUGE=RKFrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,


On Sat, Sep 12, 2020 at 12:10 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   mips64el   |         host-go-1.15.1         | http://autobuild.buildroot.net/results/f2aa23536617a4451b04a7b7b5b3c6b73daff3e9
>

I think host-go always fails on mips64, due to:

tmp/go-link-094754572/go.o: in function `internal/cpu.Initialize':
/srv/storage/autobuild/run/instance-3/output-1/host/lib/go/src/internal/cpu/cpu.go:137:(.text+0x14):
relocation R_MIPS_26 against `a local symbol' cannot be used when
making a shared object; recompile with -fPIC

Not familiar with mips - is this something with cflags? Need -fPIC
here for position-independent code conditional on mips?

Best,
Christian Stewart
