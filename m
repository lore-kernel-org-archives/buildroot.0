From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Mon, 10 Aug 2015 13:45:31 -0400
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <20150810144403.08c28fb4@free-electrons.com>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
 <20150808124445.79092e05@free-electrons.com>
 <CAFXXi0mu73=5UC6=n60uNZd=eUb16ns6vtxMH756MGuTDRhvFg@mail.gmail.com>
 <20150810144403.08c28fb4@free-electrons.com>
Message-ID: <CAFXXi0=tRTD13CMOZ7Y7j1+5VLq6Q54s3pWtgecqDTSKQ-JY4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 August 2015 at 08:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Simon Marchi,
>
> On Sun, 9 Aug 2015 23:11:03 -0400, Simon Marchi wrote:
>> On 8 August 2015 at 06:44, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Could you report the problem to the upstream ola project and see what
>> > they say? Also, they have a 0.9.7 release, maybe you want to try it?
>>
>> I discussed it a bit on their IRC channel, it seems like the right fix
>> will be to move the implementations to the .cpp files.
>>
>> I filed a bug: https://github.com/OpenLightingProject/ola/issues/880
>
> Shouldn't we simply remove -fvisibility-inlines-hidden ?

Do you mean remove it as a patch in the buildroot package, or upstream?

I asked in the bug report if removing the switch upstream would be a
possibility, how much impact it has on runtime performance (startup
time).

>> The 0.9.7 release does not change anything about that problem, but we
>> could still bump the version. I am preparing a patch to cleanup the
>> plugin management of the package, if it hasn't been bump by the time I
>> send my patch, I'll do it then.
>
> Sure, but that's going to be material for after 2015.08. What I was
> looking for right now for 2015.08 is a fix for the build issue.

As an immediate fix, the patch I sent works. Although it only moves
the problematic method. It would be possible for another method to
break with another combination of compiler/platform.

Removing the switch for the buildroot package would probably work as
well (I am testing right now) and would prevent other similar breaks.
Would you like me to send a patch immediately that does that instead?

Thanks,

Simon
