From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 11 Nov 2014 16:26:04 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
In-Reply-To: <CAHkwnC9pwAmFxuah1SonEhtOqHcg90ZiyN1AutJ04cYXM6sABA@mail.gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
 <20141106182725.450971c9@free-electrons.com>
 <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
 <20141106185330.659d572f@free-electrons.com>
 <CAHkwnC9pwAmFxuah1SonEhtOqHcg90ZiyN1AutJ04cYXM6sABA@mail.gmail.com>
Message-ID: <CAHkwnC_yWXg17d_qupe8A6EqzW55BFAVLTA4SQ7Nn+2H7UaAww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 6, 2014 at 7:03 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> On Thu, Nov 6, 2014 at 6:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Thu, 6 Nov 2014 18:35:32 +0100, Fabio Porcedda wrote:
>>
>>> > When I look at patches 2 and 3, I must say I dislike the fact that in
>>> > one case (svn), silencing is handled in pkg-download.mk when defining
>>> > the SVN variable, while in the other case (git), it's handled in the
>>> > git-specific helper script.
>>>
>>> I would like to do the same for git but it does not work because:
>>>   git -q clone <url>
>>> does not work, but
>>>   git  clone -q <url>
>>> works, so adding the "-q" in the script is the only option.
>>>
>>> Do you have any better idea?
>>
>> Yes: handle the svn case in the download helper as well. This way,
>> we're consistent between svn and git. And maybe wget should be handled
>> this way as well.
>
> Even the HG and SCP variables contain the "-q" option so with this
> patch there are a total of four variables.
>
>> Yann can comment on this on whether my proposal is fine for him.


Yann do you have any opinion about this?

BR
-- 
Fabio Porcedda
