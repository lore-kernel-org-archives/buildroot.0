From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Feb 2019 23:39:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: fix build with new
 headers
In-Reply-To: <87sgwad9z6.fsf@dell.be.48ers.dk>
References: <20190224204931.2759-1-panfilov.artyom@gmail.com>
 <20190225055853.rq2w5qnl4jxacj53@sapphire.tkos.co.il>
 <fac051b6-8a25-df0e-22ed-4d9bf97a93a9@gmail.com>
 <87sgwad9z6.fsf@dell.be.48ers.dk>
Message-ID: <39be702c-6716-c855-ac9c-531278a7b713@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 26/02/2019 ? 13:12, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > Hi Baruch, Artem, All,
>  > Le 25/02/2019 ? 06:58, Baruch Siach a ?crit?:
>  >> Hi Artem,
>  >> 
>  >> On Sun, Feb 24, 2019 at 11:49:31PM +0300, Artem Panfilov wrote:
>  >>> net_tstamp.h in recent kernel versions requires time.h for clockid_t.
>  >> 
>  >> This is a kernel bug. Kernel UAPI headers must not use the userspace clockid_t 
>  >> type. This bug has been fixed in kernel commit e2c4cf7f98a5 ("net: Use 
>  >> __kernel_clockid_t in uapi net_stamp.h") just before the v4.20 release. It 
>  >> looks like this Linaro toolchain took the headers of a kernel -rc release.
>  >> 
>  >> Maybe update the Linaro toolchain to 2019.02 in master?
>  >> Romain?
> 
>  > Actually it's not a Linaro toolchain anymore, it's an ARM toolchain.
> 
>  > Indeed, these toolchains use a 4.20 -rc kernel release.
>  > I noticed it while updating to the 2018.11 release that was released one month
>  > before the official kernel 4.20 release (respectively 23 Nov 2018 and 23 Dec
>  > 2018). I had to wait for BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20 symbol in Buildroot.
> 
>  > The latest ARM toolchain 2019.01 release use 5.0-rc1 kernel release.
>  > We can't include this version into Buildroot since the kernel 5.0 is not
>  > released yet.
> 
>  > Maybe we should report this issue to https://bugs.linaro.org ?
> 
> Yes, it would be nice if they could use released kernels for the
> headers.
> 

Done:
https://bugs.linaro.org/show_bug.cgi?id=4297

Best regards,
Romain
