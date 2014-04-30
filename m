From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Apr 2014 08:57:37 -0300
Subject: [Buildroot] Patchwork cleanup #9: triaging proposal
In-Reply-To: <CAAXf6LX=CTGexZ-mm1dSjBzBV77WcDUo+mzNDyk=nAfwZSLKEQ@mail.gmail.com>
References: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
 <CAAXf6LX=CTGexZ-mm1dSjBzBV77WcDUo+mzNDyk=nAfwZSLKEQ@mail.gmail.com>
Message-ID: <5360E531.706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/2014 04:53 AM, Thomas De Schampheleire wrote:

> On Thu, Apr 24, 2014 at 9:46 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> audiofile: needs dynamic library
>> Simon Dawson <spdawson@gmail.com>
>> http://patchwork.ozlabs.org/patch/290552
>>
>> C unsure: the autobuild problem this patch is supposed to fixed is
>> still present (http://autobuild.buildroot.org/?reason=audiofile-0.3.6)
>> but the correctness of the patch has been under discussion. Gustavo
>> may possibly provide more details.
> 
> 
> Gustavo: could you provide more details about this audiofile
> situation, and what to do with the mentioned patch?

Hi.
After some testing with latest git i've got:

Blackfin external 2013R1 FLAT builds audiofile (mpd can't because nommu).
Sourcery external 2013.11 ARM builds mpd with audiofile fine.

Mipsel internal defaults (+stdc +wchar) is fine too building mpd+audiofile.

Now that libstdc++.a is being copying it seems at least some common
cases work fine.
Maybe i'm missing something?

Regards.
