From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 28 Sep 2020 13:27:18 -0700
Subject: [Buildroot] [PATCH v2 10/14] package/systemd: invoke
 systemd-tmpfilesd on final image
In-Reply-To: <CADYdroPT872R2eVvHssAshk0pzGbb_guko5C723qOWVXtCNQew@mail.gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-11-nolange79@gmail.com>
 <CAFvCimWYc_MpYbpvi3rB+uwWpK4EB5Er7DUG7U=eF0bQfK5pXA@mail.gmail.com>
 <CADYdroNfW0eO3NV0eJgWQtwBndqDmHDoE7-YF6gnHQYViqE8eQ@mail.gmail.com>
 <CAFSsvmqN0oe4+KvZ1sCCHmGSM_WV7nQPeUjBdhN19craLMU=6A@mail.gmail.com>
 <CADYdroPT872R2eVvHssAshk0pzGbb_guko5C723qOWVXtCNQew@mail.gmail.com>
Message-ID: <CAFSsvmpMCdLauay7LC=T87=bnSwM0KbMCHs7p5771R05iDhbSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 28, 2020 at 12:00 PM Norbert Lange <nolange79@gmail.com> wrote:
>
>
>
> Am Montag, 28. September 2020 schrieb Adam Duskett <aduskett@gmail.com>:
>>
>>
>>
>> On Mon, Jun 15, 2020 at 7:59 AM Norbert Lange <nolange79@gmail.com> wrote:
>>>
>>>
>>>
>>> Am Mo., 15. Juni 2020 um 16:32 Uhr schrieb J?r?my ROSEN <jeremy.rosen@smile.fr>:
>>>>
>>>> I wonder how that would work with lines that contain %b (boot id)
>>>> and %m (machine-id)
>>>> my educated guest would be that it would create files with the host's
>>>> boot-id/machine-id. Thus leaking the host's information. This is not
>>>> good, especially the machine-id of the host which is confidential
>>>> information (not crypto-grade, but still shouldn't be leaked)
>>>>
>>>>
>>>> if systemd-tmpile supports that correctly (maybe skipping all %b %m
>>>> when --root is used) it's all fine. But I don't remember seeing that.
>>>>
>>>> does it ?
>>>
>>>
>>> The default config files don't create files with machine-id, and %b is not replaced at all AFAIR.
>>> But I believe you are right that systemd-tmpfiles picks up the host machine-id and would replace it.
>>> Good catch, need to check.
>>
>>
>>>
>>>  FYI, this issue is being worked on:
>>> https://github.com/systemd/systemd/pull/16187
>
>
> That PR is from a guy with an username matching my initials. Weird ;)
>
Crazy coincidence!

> I seem to be unable to get simple questions about the how unanswered (until pushes that raises issues that I wanted to solve before spending time coding, testing and adhering to coding guidelines).
>
> Now I am thinking, that maybe a small separate tool supporting the systemd-tmpfiles, systemd-sysusers and busybox makeusers "setup functionality" might get done faster and might allow the config to be used.
>
> I'm not motivated to face this head on for a while, at any rate.
>
To be fair, I did test your PR (updated to work with 246.5) and it
works perfectly. It's a shame it's so difficult to get Pottering
to respond to these things.


Adam
> Norbert
