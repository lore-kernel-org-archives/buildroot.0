From: Joshua Jackson <jjackson@vortech.net>
Date: Tue, 6 Mar 2012 16:31:11 -0500
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <871up5o277.fsf@macbook.be.48ers.dk>
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
 <871up5o277.fsf@macbook.be.48ers.dk>
Message-ID: <CADxd2g-03LW9NUQv_rdp6ieRuzsJ1yz-tGBxsAEr=ucUk_RYpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It gets auto-built with the selection of the autoconf / automake
packages... I'm not sure if it is 100% required, but I do know that if
you are building a system that you plan to use to compile other
software, some flavor of perl is often needed by the config scripts.

I bumped into this issue when attempting to create a system image with
all of the necessary development tools for me to compile software for
the embedded system I am working on... I know it can simply be
cross-compiled, but being able to create a virtual appliance or chroot
tree for people to build software for the target system in is handy.

Josh

On Tue, Mar 6, 2012 at 4:21 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
> ?Arnout> It misses -lm when compiling miniperl
> ?Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Committed, thanks.
>
> ?Arnout> ---
> ?Arnout> This is actually a quite old perl version, and it's not even converted
> ?Arnout> to GENTARGETS. ?Should we deprecate it?
>
> Well, I think getting rid of it would be a pity, but I don't personally
> use perl so if nobody else is using it? Gustavoz?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
