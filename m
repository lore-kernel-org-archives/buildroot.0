From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Apr 2015 16:56:40 +0300
Subject: [Buildroot] Versioned symbols in elfutils and uClibc
In-Reply-To: <20150421092802.7aedf522@free-electrons.com>
References: <CAMo8BfLHuMzBaETgnJu-O+osAKw3dQM-XCUa5yEqP__oZwwQFw@mail.gmail.com>
 <20150421092802.7aedf522@free-electrons.com>
Message-ID: <CAMo8BfLWw_+Eja3x9qLZsthWv-CJ14Ddn=Rn0-JS03vAmXJeZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2015 at 10:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Max,
>
> On Tue, 21 Apr 2015 04:30:12 +0300, Max Filippov wrote:
>
>> I'm debugging strange segfault running ltrace for xtensa:
>> it's caused by dwfl_report_elf recursively calling itself, resulting
>> in stack overflow. The symbol dwfl_report_elf is versioned, there
>> are versions ELFUTILS_0.122 and ELFUTILS_0.156, ltrace calls
>> 0.122, but when 0.122 tries to resolve 0.156 it gets back pointer
>> to 0.122. AFAICS uClibc does not support symbol versioning.
>> Any idea what can be done about it?
>
> I guess this is probably a question you should ask on the uClibc
> mailing list rather than the Buildroot one.

I'm asking here because it used to work with buildroot 2014.11,
but does not work now. The difference is in elfutils, back then its
dwfl_report_elf wasn't versioned.

-- 
Thanks.
-- Max
