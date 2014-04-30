From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Apr 2014 11:23:48 -0300
Subject: [Buildroot] Patchwork cleanup #9: triaging proposal
In-Reply-To: <5360E531.706@zacarias.com.ar>
References: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
 <CAAXf6LX=CTGexZ-mm1dSjBzBV77WcDUo+mzNDyk=nAfwZSLKEQ@mail.gmail.com>
 <5360E531.706@zacarias.com.ar>
Message-ID: <53610774.9080907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/2014 08:57 AM, Gustavo Zacarias wrote:

>> Gustavo: could you provide more details about this audiofile
>> situation, and what to do with the mentioned patch?
> 
> Hi.
> After some testing with latest git i've got:
> 
> Blackfin external 2013R1 FLAT builds audiofile (mpd can't because nommu).
> Sourcery external 2013.11 ARM builds mpd with audiofile fine.
> 
> Mipsel internal defaults (+stdc +wchar) is fine too building mpd+audiofile.
> 
> Now that libstdc++.a is being copying it seems at least some common
> cases work fine.
> Maybe i'm missing something?

D'oh indeed i am, forgot to enable static for internal (and can't for
sourcery).
Blackfin works though since FLAT forces static.
I'll try some tricks and get back, but getting static rolling isn't a
big priority for me.
Regards.
