From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Tue, 29 Sep 2020 10:40:56 +0200
Subject: [Buildroot] [PATCH v2 10/14] package/systemd: invoke
 systemd-tmpfilesd on final image
In-Reply-To: <CAFSsvmpMCdLauay7LC=T87=bnSwM0KbMCHs7p5771R05iDhbSw@mail.gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-11-nolange79@gmail.com>
 <CAFvCimWYc_MpYbpvi3rB+uwWpK4EB5Er7DUG7U=eF0bQfK5pXA@mail.gmail.com>
 <CADYdroNfW0eO3NV0eJgWQtwBndqDmHDoE7-YF6gnHQYViqE8eQ@mail.gmail.com>
 <CAFSsvmqN0oe4+KvZ1sCCHmGSM_WV7nQPeUjBdhN19craLMU=6A@mail.gmail.com>
 <CADYdroPT872R2eVvHssAshk0pzGbb_guko5C723qOWVXtCNQew@mail.gmail.com>
 <CAFSsvmpMCdLauay7LC=T87=bnSwM0KbMCHs7p5771R05iDhbSw@mail.gmail.com>
Message-ID: <CAFvCimWnVKHVF4u4dAmJUE8SWN3v4C8ko=qdj-DVzEuAvgv1ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agreed, he seems to have trouble grasping the embedded use-case...
(I am monitoring this PR too...)

The only thing I can say is "Hang on there, Norbert" these kind of things
take an unfortunate amount of time, but the systemd project tends to not
forget patches... even after a long time asleep.

Le lun. 28 sept. 2020 ? 22:27, Adam Duskett <aduskett@gmail.com> a ?crit :

> On Mon, Sep 28, 2020 at 12:00 PM Norbert Lange <nolange79@gmail.com>
> wrote:
> >
> >
> >
> > Am Montag, 28. September 2020 schrieb Adam Duskett <aduskett@gmail.com>:
> >>
> >>
> >>
> >> On Mon, Jun 15, 2020 at 7:59 AM Norbert Lange <nolange79@gmail.com>
> wrote:
> >>>
> >>>
> >>>
> >>> Am Mo., 15. Juni 2020 um 16:32 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >>>>
> >>>> I wonder how that would work with lines that contain %b (boot id)
> >>>> and %m (machine-id)
> >>>> my educated guest would be that it would create files with the host's
> >>>> boot-id/machine-id. Thus leaking the host's information. This is not
> >>>> good, especially the machine-id of the host which is confidential
> >>>> information (not crypto-grade, but still shouldn't be leaked)
> >>>>
> >>>>
> >>>> if systemd-tmpile supports that correctly (maybe skipping all %b %m
> >>>> when --root is used) it's all fine. But I don't remember seeing that.
> >>>>
> >>>> does it ?
> >>>
> >>>
> >>> The default config files don't create files with machine-id, and %b is
> not replaced at all AFAIR.
> >>> But I believe you are right that systemd-tmpfiles picks up the host
> machine-id and would replace it.
> >>> Good catch, need to check.
> >>
> >>
> >>>
> >>>  FYI, this issue is being worked on:
> >>> https://github.com/systemd/systemd/pull/16187
> >
> >
> > That PR is from a guy with an username matching my initials. Weird ;)
> >
> Crazy coincidence!
>
> > I seem to be unable to get simple questions about the how unanswered
> (until pushes that raises issues that I wanted to solve before spending
> time coding, testing and adhering to coding guidelines).
> >
> > Now I am thinking, that maybe a small separate tool supporting the
> systemd-tmpfiles, systemd-sysusers and busybox makeusers "setup
> functionality" might get done faster and might allow the config to be used.
> >
> > I'm not motivated to face this head on for a while, at any rate.
> >
> To be fair, I did test your PR (updated to work with 246.5) and it
> works perfectly. It's a shame it's so difficult to get Pottering
> to respond to these things.
>
>
> Adam
> > Norbert
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200929/3765cd81/attachment.html>
