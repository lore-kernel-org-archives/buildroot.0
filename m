From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 6 Nov 2014 18:50:34 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
In-Reply-To: <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
 <20141106182725.450971c9@free-electrons.com>
 <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
Message-ID: <CAHkwnC9Kzm5s64LStQjsPsG84xtWva542w9jSGr2Hz9TYtyZ=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 6, 2014 at 6:35 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> On Thu, Nov 6, 2014 at 6:27 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Thu,  6 Nov 2014 10:13:34 +0100, Fabio Porcedda wrote:
>>> This patch set improves silent builds.
>>>
>>> Silent builds are nice when top-level parallel make is being used to
>>> reduce the output clutter.
>>>
>>> The change logs are in each patch.
>>>
>>> Best regards
>>> Fabio Porcedda (3):
>>>   Makefile: improve detection of make "-s" flag
>>>   pkg-download: silence the svn download helper if it is a silent build
>>>   support/download: silence git if it is a silence build
>>
>> When I look at patches 2 and 3, I must say I dislike the fact that in
>> one case (svn), silencing is handled in pkg-download.mk when defining
>> the SVN variable, while in the other case (git), it's handled in the
>> git-specific helper script.
>
> I would like to do the same for git but it does not work because:
>   git -q clone <url>
> does not work, but
>   git  clone -q <url>
> works, so adding the "-q" in the script is the only option.
>
> Do you have any better idea?

I've forgotten to add Yann in CC.

BR
-- 
Fabio Porcedda
