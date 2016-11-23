From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 23 Nov 2016 09:47:13 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161123093550.43e574f3@free-electrons.com>
References: <20161122212534.GA3529@free.fr>
 <20161123093550.43e574f3@free-electrons.com>
Message-ID: <CAGduivyZ1-RWO3V0Y6jx1fkO34QapP6tCm0niJsEAXxwSJe3AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have experienced the same problem as Jerome on some machines, in my
cases I haven't noticed that it was the striped files but it's pretty
hard to reproduce.

The issues is that random files gets random rights on random machines,
ideal scenario.

On Wed, Nov 23, 2016 at 9:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 22 Nov 2016 22:25:34 +0100, Yann E. MORIN wrote:
>
>> Alternatively, we can revert back to using fakeroot for this release, at
>> the expense of breaking (already previously broken) setups with SELinux
>> on the host.
>
> I am more and more thinking that this is what we should do. Not only
> pseudo still has issues, but even once all issues will be fixed, it is
> a much much more complicated and annoying solution than fakeroot:
Here's my 2 cents from someone planning to use the next release to
build a product:
If the community decide to keep pseudo, I will keep my patches that
revert them until everything's fixed (I am willing to do test, I do
not have time to investigate though). There's too much issues too
close to the release deadline and I don't really care about SELinux
(as I said my opinion is from my professional point of view, I
perfectly understand why it's an issues and it should be addressed
from the BR point of view).
>
>  - It requires additional dependencies (host-sqlite, host-attr)
>
>  - It requires a complicated setup, with a daemon, that you need to
>    manually start and stop (because the internal pseudo mechanism to
>    start/stop the daemon doesn't work properly)
>
> So I really believe we should revert to fakeroot, and investigate what
> this SELinux problem is exactly. Looking more at the original bug at
> https://bugzilla.redhat.com/show_bug.cgi?id=1238802, what is the actual
> problem for us? Why do we care about preserving the SELinux labels of
> files within the fakeroot environment? We don't support SELinux, and
> even if we did, most likely the SELinux labels that exist on the host
> machine would not make sense for the target filesystem.
>
> So is the real problem with fakeroot on Fedora related to SELinux?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
