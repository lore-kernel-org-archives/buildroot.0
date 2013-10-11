From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 11 Oct 2013 16:41:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-10
In-Reply-To: <CAAXf6LWPcf3LSouCznvD_R=s33OL2SyidjFSob20k-PRGczWzg@mail.gmail.com>
References: <20131011063009.335B352C1A0@lolut.humanoidz.org>
 <CAKAx1chC4oz0iJRed6_koLNiMR=HhOSF_K__DYGhvGZXa2UrNw@mail.gmail.com>
 <CAAXf6LWPcf3LSouCznvD_R=s33OL2SyidjFSob20k-PRGczWzg@mail.gmail.com>
Message-ID: <CAKAx1cjVdSnoTTzpQkP7DkYcLXNEL2ir23VhtAe_1zJXnfgHQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 11, 2013 at 4:30 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Lionel,
>
> On Fri, Oct 11, 2013 at 9:59 AM, Lionel Orry <lionel.orry@gmail.com> wrote:
>
>>>       sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/bc36e051e06f596c2fafdd3cc3745bb34b73ace3/
>>
>> I suspect the failed build above (ruby / sh4a) can be solved by either
>> using a more recent gcc version (which one is used ? I can't know from
>> the logs...), or to get maximum compliance over all gcc versions, use
>> '-O2' instead of '-Os' in CFLAGS. But I don't know the best way to
>> change the optimisation in ruby.mk so I cannot cook a patch for
>> this...
>>
>> This suggestion is the result of several investigations about the
>> "pcrel too far" issue, none of them being directly related to the ruby
>> source code but most of the time, the solution was to ease the
>> optimisation a little.
>>
>
> Thanks for this suggestion.
> Based on this, I was able to fix the build error using:
>
> RUBY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O2"
>
>
> Now my question: would you like to send a patch for this, or would you
> like me to do it?

You can do the patch if you have time for it (well it's a git
one-liner now, right?), thanks in advance, I just used google a few
minutes I don't need credit for that :D

>
> Best regards,
> Thomas

BR,
Lionel
