From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Wed, 20 May 2020 13:30:36 +0200
Subject: [Buildroot] [PATCH] package/gitlab-runner: new package
In-Reply-To: <87tv0anct6.fsf@grinn-global.com>
References: <20200430130702.2476020-1-m.niestroj@grinn-global.com>
 <CAFvCimWJUZ9fpHEKawRCOWYnajY8-R--CvEzTXrYW+-E5y4AVg@mail.gmail.com>
 <87tv0anct6.fsf@grinn-global.com>
Message-ID: <CAFvCimXCZj=B1qorEZdKhfh4_D5xejKusjbYA=qghP9bgKdSeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 20 mai 2020 ? 12:03, Marcin Niestr?j <m.niestroj@grinn-global.com>
a ?crit :

> Hi J?r?my,
>
> J?r?my ROSEN <jeremy.rosen@smile.fr> writes:
>
> > Hello,
> >
> > I am in the process of testing that and you will probably get my
> tested-by
> > at some point..
> > Two remarks in the mean time...
> > * it seems from https://docs.gitlab.com/runner/configuration/init.html
> >   that gitlab-runner should magically create the systemd file when
> >   installed. Did you test that ?
>
> I haven't. But I had a quick tour over the code that does that. What I
> understood back then was that systemd service was created by
> gitlab-runner runtime. As we are cross-compiling it, then there is no
> possibility to create such systemd service file before assembling final
> image (without compiling for the host PC as well).
>
> Attached is the gitlab-runner service from Debian as an inspiration.
My guess is that there is very little variety and hard-including a service
with buildroot would be fine...



> > * It seems a sane common practice to run gitlab-runner with the --user
> >   option pointing to a dedicated user so the gitlab jobs are not run
> >   as root. You should probably create a user for that and activate
> >   that option by default
>
> I am not 100% sure we want that by default. The use case for me for
> example is to have all system priviledges, as I use gitlab-runner to
> talk to /dev/tty*, /dev/sdX and /dev/sgX devices. Some of them can be
> accessed by a system group, but /dev/sgX for example is only available
> with CAP_SYS_ADMIN.
>
> I understand that for some cases it is better to reduce gitlab-runner
> priviledges. But I would rather leave that for a future improvement,
> when such need arises.
>
> I would disagree with that, let's go or the safe option as the default,
but it's a matter of taste/philosophy
not correctness per se. So do what you think is the best.

I'm still in the process of testing your patch. I can't get it to work yet,
but I suspect the problem is on my end, so i'll get back to you

regards
Jeremy

> >
> > I'll test your patch some more and come back to you
> >
> > Regards
> > Jeremy
> >
>
> --
> Regards,
> Marcin Niestr?j
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200520/451a6e27/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gitlab-runner.service
Type: text/x-dbus-service
Size: 576 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200520/451a6e27/attachment.bin>
