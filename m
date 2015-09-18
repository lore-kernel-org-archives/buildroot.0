From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 18 Sep 2015 20:22:52 +1200
Subject: [Buildroot] [PATCH v4 0/2] Micropython package
In-Reply-To: <20150918093222.13fa5739@free-electrons.com>
References: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
 <1442446199-15963-1-git-send-email-judge.packham@gmail.com>
 <20150918093222.13fa5739@free-electrons.com>
Message-ID: <CAFOYHZCxy2PWfdPXiTrxDzf4LnLnPCwATyia200X2kHucNqJSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 18, 2015 at 7:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Chris,
>
> On Thu, 17 Sep 2015 11:29:57 +1200, Chris Packham wrote:
>
>> Chris Packham (2):
>>   micropython: new package
>>   micropython-lib: new packages
>
> There are a number of build failures caused by Micropython in the
> autobuilders:
>
>  * On MIPS64
>    http://autobuild.buildroot.org/results/99a/99a610c72877fef53d93e1a923bd5c71b3376618/build-end.log
>
>  * On Xtensa
>    http://autobuild.buildroot.org/results/670/670907760d6b3e7eb46b433647b392cec3bafdcd/build-end.log
>
>  * On SH4A
>    http://autobuild.buildroot.org/results/f5a/f5a2c563b8bdab9e345960a5b92d31f3f92dba00/build-end.log
>
> See http://autobuild.buildroot.org/?reason=micropython-v1.4.5 for the
> complete list of build failures.
>
> If you could look into these, it would be helpful.

Xtensa and SH4A look like they need MICROPY_GCREGS_SETJMP I'll send a
patch for them shortly. The MIPS64 one looks different so might need
some investigation.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
