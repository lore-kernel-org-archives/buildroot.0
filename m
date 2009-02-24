From: Andrew Wiley <debio264@gmail.com>
Date: Tue, 24 Feb 2009 07:16:21 -0600
Subject: [Buildroot] [Fwd: Re: I apologize for asking...]
In-Reply-To: <49A3D452.4030606@comcast.net>
References: <49A3D452.4030606@comcast.net>
Message-ID: <ecbbfeda0902240516s532df37ra08ef91cc987fe64@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 24, 2009 at 5:04 AM, Xavian-Anderson Macpherson <
Shingoshi@comcast.net> wrote:

>  Andrew,
> Thanks for writing back. The reason why I didn't try just running "unset
> CFLAGS" is twofold. 1. When I ran "which unset" nothing came come up. That
> being the case, I didn't think it would work. 2. I was really afraid it
> might screw up my system, if it wasn't meant to be run on my system. I was
> thinking this should only apply to the buildroot system. So, now I will try
> it.
>

`unset` isn't a real command, it's built in to your shell. Somehow this
environment variable is getting set, and buildroot wants it cleared. I don't
know if buildroot starts its own shell or what, but this is getting set
somehow somewhere. Because unsetting the variable only affects the shell
you're currently in, it can't screw up your system. If you unset it in one
shell, then launch another, the setting will be back in the new shell.

>
>
> Ok. I just ran the command in a shell. Nothing changes. I have the same
> result as before. I will try moving this into a chroot I've built, and see
> if I get a different result.
>
> I have tested this in a chroot, and I still get the same result. Took a
> long to complete building the dependencies for the chroot. But once it was
> done, nothing changes.
>

I'm guessing that somewhere in a folder (generally /etc/profile.d), your
distribution has a bunch of scripts that are run to set up environment
variables. You may need to go through these scripts and comment out CFLAGS,
but hopefully someone from the Buildroot devs has a better suggestion. I may
be missing something, but I'm pretty sure that when you run `unset` and it
has no effect, it means Buildroot is starting a new shell somewhere, which
is somehow getting that variable back.

Andrew Wiley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090224/aaaf66bf/attachment.htm>
