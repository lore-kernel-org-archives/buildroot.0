From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Feb 2014 15:45:43 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <53022E68.7010401@imgtec.com>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate> <53022D70.8090908@imgtec.com>
 <53022E68.7010401@imgtec.com>
Message-ID: <53022EA7.5060409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/2014 03:44 PM, Markos Chandras wrote:
> On 02/17/2014 03:40 PM, Vicente Olivert Riera wrote:
>> On 02/07/2014 12:53 PM, Thomas Petazzoni wrote:
>>> Hello all,
>>>
>>> You'll find below a quick analysis of the build failures. If you are in
>>> Cc, it means that there is a question for you below, or a request to
>>> help debugging a specific problem. Thanks!
>>>
>>> On Fri,  7 Feb 2014 08:30:09 +0100 (CET), Thomas Petazzoni wrote:
>>
>>>>      mipsel |              alsa-utils-1.0.26 | NOK |
>>>> http://autobuild.buildroot.net/results/05d3186bcb74c905bbc689859522b88db78c2f68/
>>>>
>>>>
>>>
>>> /home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
>>>
>>> BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3416
>>> /home/test/test/3/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4):
>>>
>>> undefined reference to `_snd_module_rawmidi_virt'
>>>
>>> Looks like a MIPS toolchain problem, maybe? The toolchain used is a
>>> Buildroot toolchain built with Buildroot 2013.11. If the problem no
>>> longer occurs with the internal toolchain backend, then it will be
>>> fixed once I rebuild the external Buildroot toolchains of the Buildroot
>>> (when -rc1 is released). Vicente, can you test if this works with the
>>> internal toolchain?
>>
>> No, it doesn't work. There is the same problem with the internal
>> toolchain, but only fails when BR2_PREFER_STATIC_LIB is selected.
>>
>>>>       nios2 |         ltp-testsuite-20130904 | NOK |
>>>> http://autobuild.buildroot.net/results/9aca518bf53aea62bc4bb437976f0223113c26ce/
>>>>
>>>>
>>>
>>> Would be good to see if the bump of ltp-testsuite proposed by Vicente
>>> fixes this problem. Peter, can you apply
>>> http://patchwork.ozlabs.org/patch/317112/ ?
>>
>> I have received an email from Peter saying "Committed to next, thanks."
>> What that means? To next what?
>>
> The -next branch
>
> http://git.buildroot.org/buildroot/log/?h=next
>
> Whenever a release is approaching, after -rc1, a -next branch is created
> for fixes that will be included *after* the release. In other words,
> anything in -next will not be part of the release. Once a release is
> done, the -next branch is merged back to master, and development is
> moving forward as usual.
>

Oh, I see... Thanks!

-- 
Vincent
