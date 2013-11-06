From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 6 Nov 2013 11:33:15 +0800
Subject: [Buildroot] [PATCH v2] sconeserver: Can't be built with uClibc.
In-Reply-To: <87ppqemooa.fsf@dell.be.48ers.dk>
References: <1383665533-2430-1-git-send-email-sonic.adi@gmail.com>
 <87ppqemooa.fsf@dell.be.48ers.dk>
Message-ID: <CAJxxZ0NgjUKnAuLK22wmgztrCnBaRxBXCJzQF_YFexPVFZEBgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 6, 2013 at 7:09 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:
>
>  > From: Sonic Zhang <sonic.zhang@analog.com>
>
>  > General shadow password file API such as getspnam is not supported in
>  > uClibc.
>
> Ehh, they are?
>
> ./output/host/usr/bin/arm-linux-nm -D \
>   output/target/lib/libuClibc-0.9.33.2.so | grep getspnam
> 0002a6c0 T getspnam
> 0002a6f0 T getspnam_r
>
> They do require you to enable UCLIBC_HAS_SHADOW, but that option
> defaults to y and our default config has it enabled.
>

In the case the UCLIBC_HAS_SHADOW is not supported in the GNU
toolchain release for some architecture such as Blackfin, how should
the building failure be dealt with?

Regards,

Sonic
