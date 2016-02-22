From: Romain Izard <romain.izard.pro@gmail.com>
Date: Mon, 22 Feb 2016 09:40:55 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
	installed programs
In-Reply-To: <877fhxaf7l.fsf@dell.be.48ers.dk>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
Message-ID: <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2016-02-21 23:09 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Romain" == Romain Izard <romain.izard.pro@gmail.com> writes:
>
>  > As the recent revisions of coreutils use a single multi-call
>  > executable, it is not possible to reduce the installed size of
>  > coreutils by removing the unused programs. But the list of
>  > installed programs can be passed when configuring the package, and
>  > it is possible ensure that only required programs are embedded into
>  > the multi-call executable.
>
>  > A global configuration option selects either the default set of
>  > programs, or a configurable set. In the latter case, each coreutil
>  > program has its own option.
>
>  > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
>
> Are you really using a setup where this detailed tweaking of coreutils
> is needed?
>
> Coreutils isn't super huge:
>
> ls -lh target/usr/bin/coreutils -rwxr-xr-x 1 peko peko 933K Feb 21
> 23:01 target/usr/bin/coreutils
>
> And if you are using coreutils instead of busybox you are probably not
> very interested in saving every last byte of rootfs size anyway, so
> I'm not sure we should have 500+ lines of Config.in for this.
>

My issue is that I'm updating an existing system, and the application
has expensive scripts that rely on the behaviour of coreutils regarding
some options that busybox does not have. As I cannot easily change those
scripts, my goal is to try to provide the same services with an updated
rootfs. To keep everything (including wifi, bluetooth, glib and a lot
more) in less 10 MiB as it did in the past, removing even 300 KiB from
coreutils is a step in the right direction. And I though it was a better
if is was done in a clean way, instead of the ad-hoc patches I had in
the previous generation

But if you think buildroot does not need it, I won't insist.

Best regards,
-- 
Romain Izard
