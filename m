From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Mon, 04 Mar 2013 20:25:45 +0200
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130304192156.7bfe23bf@skate>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
 <5134E40D.6@petroprogram.com> <20130304192156.7bfe23bf@skate>
Message-ID: <5134E729.8070708@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4.3.2013 20:21, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Mon, 04 Mar 2013 20:12:29 +0200, Stefan Fr?berg wrote:
>
>> *But* ... (and this is a big but) I have not tested how it reacts to
>> kernel events after boot when you *plug/unplug* devices and if mdev
>> is capable of *running programs/scripts when some event happens*.
> mdev is capable of running programs/scripts when some event happens,
> even after boot time. I've already used this capability to notify an
> application when a USB input device is added/removed from the system,
> or to trigger a system upgrade when a USB key is inserted.

It is? Oh good ! :-)

> However, if an application relies on libudev to get notifications of
> devices appearing/disappearing, or other services, then of course, it
> cannot work with mdev.

Damn... That would mean that network-manager and some other stuff would
need patchin then to
get completely rid of udev...
Real pity.

> Best regards,
>
> Thomas

Regards
Stefan
