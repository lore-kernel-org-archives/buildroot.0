From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2014 11:27:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-07
In-Reply-To: <20140210093158.1dc26780@skate>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>
 <20140208124907.GA3442@free.fr> <20140210093158.1dc26780@skate>
Message-ID: <CAAXf6LVr18TkjCX_APQOabr6idsUMCRgrqxTL69yHO=2XJSugA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2014 at 9:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Sat, 8 Feb 2014 13:49:07 +0100, Yann E. MORIN wrote:
>
>> On 2014-02-08 08:30 +0100, Thomas Petazzoni spake thusly:
>> > Build statistics for 2014-02-07
>> >        arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/310e355f2f601801e4500b9d3e714d3883e7aa32/
>> >        arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/90e1a2e3e428e6c3fe5b51668ab92c139f176260/
>>
>> Too old toolchain:
>>   - SYS_TURBO was introduced in linux 3.2
>>   - SYS_DVBC_ANNEX_A in linux 3.2
>>   - SYS_DVBC_ANNEX_C and DTV_ENUM_DELSYS in linux 3.3
>
> The too old toolchain in question is Linaro 2013.11, i.e a fairly
> recent Linaro toolchain. I believe kernel 3.2/3.3 are not that old for
> embedded products, and we should support toolchains that have such old
> kernel headers.
>
>> >    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/549564293607c959fa09e12510bb2aaa79f4f479/
>>
>> Too old toolchain, as usual.
>
> This one I agree is old. The question is: how do I exclude this package
> from being built. Should we introduce hidden Config.in bools for kernel
> header versions, so that the packages that need at least the kernel
> headers from kernel X.Y are not visible if you have a too old
> toolchain? Those bools would be set by linux-headers/Config.in for the
> internal backend, automatically set for the well-known external
> toolchains, and a custom choice for special external toolchains.

I think we should indeed implement a mechanism to restrict packages
based on kernel headers.
There have been many packages that require recent kernel headers, and
it is not feasible to fix all these packages individually. Forcing the
user to update their kernel headers or toolchain is not unreasonable,
and otherwise they are always welcome to propose a patch for a
particular package, or discuss the matter upstream.

The solution you propose seems a good idea to me and not too complex.

Best regards,
Thomas
