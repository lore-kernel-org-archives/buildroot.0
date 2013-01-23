From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 23 Jan 2013 18:31:16 +0200
Subject: [Buildroot] Squashfs boot
In-Reply-To: <20130123171848.370ef451@skate>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com>
 <CAN_xxrVD=Tq=ekME-jdHKRzyUwXk0PMocQX9mrxxcgjZQ8SYqA@mail.gmail.com>
 <50FED12F.4050209@petroprogram.com> <20130123165719.2d62382c@skate>
 <51000A62.9090309@petroprogram.com> <20130123171848.370ef451@skate>
Message-ID: <51001054.1000901@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.1.2013 18:18, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Wed, 23 Jan 2013 18:05:54 +0200, Stefan Fr?berg wrote:
>
>> No.
>> What I meant was, that if he is going to make it *without* buildroot
>> (that is, if he can't get buildroot generated squashfs root to boot).
>> *Then* he has to make his own init stuff to mount those /tmp
>> and /var/log.
> Ok. But then if Buildroot has a bug, let's fix the bug instead of
> trying to work-around it, no?

Sure. But like I said I haven't (yet) done that whole root squashfs so I
can only guess work
what could be wrong with it. (too old squashfs-utils, wrong kernle
version, maybe missing kernel option?)

>> And my own solution is overly complex because I want the ability to
>> write to squashfs, even if just temporarily.
>> That's why I use initramfs + squashfs + unionfs
> Indeed. You could still boot the root filesystem from squashfs, and
> then mount a tmpfs and do the unionfs thing. There's no real need to
> split usr/ in a squashfs in order to achieve this, I think.
>
> Best regards,
>
> Thomas

Can I write to /usr with buildroot squashfs ?

Stefan
