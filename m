From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 12 Feb 2016 14:40:06 +0100
Subject: [Buildroot] [PATCH] Makefile: Fix overlay overwriting everything
In-Reply-To: <878u2qq3xa.fsf@dell.be.48ers.dk>
References: <1455119908-21976-1-git-send-email-maxime.hadjinlian@gmail.com>
 <56BB98E1.4070008@mind.be> <878u2qq3xa.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivxc948j1Ly5HP+YFvP8Wihys-gUfRJroqq_=DC0c=R1_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all

On Thu, Feb 11, 2016 at 11:26 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>>> Solution:
>  >> Telling rsync to treat symlinked dir on the receiver side as directory
>  >> allow users to be blissfully ignorant of that problem.
>
>  >  I'm not so sure of this one... It makes it impossible to override the symlinks
>  > in the skeleton in the overlay. Say, you want to populate /var/spool with some
>  > directories so it becomes useable.
>
>  >  That said, it's probably better in that case to override the skeleton directly,
>  > so that package installation can pick up the new directory.
>
>  >  Still, you _are_ breaking a valid use case with this patch.
>
>  >  What do the others think?
>
> I'm also not really happy about it either. Another potential issue is if
> the build machine is so old that rsync doesn't support --keep-dirlinks,
> but according to:
>
> https://download.samba.org/pub/unpacked/rsync/OLDNEWS
>
> This was added in 2.6.3 (Sep 2004), so I guess even RHEL5 and similar
> should have it.
So that's not really an issue then, is it ?

What do you think about the idea of doing rsync twice ? That should
solve every use case pretty nicely I think.
>
> --
> Bye, Peter Korsgaard
