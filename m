From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 18:19:29 -0300
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
Message-ID: <56CE1E61.7000008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/16 05:40, Romain Izard wrote:

> My issue is that I'm updating an existing system, and the application
> has expensive scripts that rely on the behaviour of coreutils regarding
> some options that busybox does not have. As I cannot easily change those
> scripts, my goal is to try to provide the same services with an updated
> rootfs. To keep everything (including wifi, bluetooth, glib and a lot
> more) in less 10 MiB as it did in the past, removing even 300 KiB from
> coreutils is a step in the right direction. And I though it was a better
> if is was done in a clean way, instead of the ad-hoc patches I had in
> the previous generation
>
> But if you think buildroot does not need it, I won't insist.
>
> Best regards,

Hi Romain.
How about adding a more lightweight option to the coreutils package to 
disable the single-binary mode?
That way if all you want is 1-2 binaries you can purge the rest from a 
post-build script to save space, if you want more then single-binary 
mode makes sense to kill code duplication.
Regards.
