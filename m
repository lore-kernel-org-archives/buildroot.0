From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Wed, 20 May 2020 12:03:17 +0200
Subject: [Buildroot] [PATCH] package/gitlab-runner: new package
In-Reply-To: <CAFvCimWJUZ9fpHEKawRCOWYnajY8-R--CvEzTXrYW+-E5y4AVg@mail.gmail.com>
References: <20200430130702.2476020-1-m.niestroj@grinn-global.com>
 <CAFvCimWJUZ9fpHEKawRCOWYnajY8-R--CvEzTXrYW+-E5y4AVg@mail.gmail.com>
Message-ID: <87tv0anct6.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?my,

J?r?my ROSEN <jeremy.rosen@smile.fr> writes:

> Hello,
>
> I am in the process of testing that and you will probably get my tested-by
> at some point..
> Two remarks in the mean time...
> * it seems from https://docs.gitlab.com/runner/configuration/init.html
>   that gitlab-runner should magically create the systemd file when
>   installed. Did you test that ?

I haven't. But I had a quick tour over the code that does that. What I
understood back then was that systemd service was created by
gitlab-runner runtime. As we are cross-compiling it, then there is no
possibility to create such systemd service file before assembling final
image (without compiling for the host PC as well).

> * It seems a sane common practice to run gitlab-runner with the --user
>   option pointing to a dedicated user so the gitlab jobs are not run
>   as root. You should probably create a user for that and activate
>   that option by default

I am not 100% sure we want that by default. The use case for me for
example is to have all system priviledges, as I use gitlab-runner to
talk to /dev/tty*, /dev/sdX and /dev/sgX devices. Some of them can be
accessed by a system group, but /dev/sgX for example is only available
with CAP_SYS_ADMIN.

I understand that for some cases it is better to reduce gitlab-runner
priviledges. But I would rather leave that for a future improvement,
when such need arises.

>
> I'll test your patch some more and come back to you
>
> Regards
> Jeremy
>

-- 
Regards,
Marcin Niestr?j
