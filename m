From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Thu, 29 Mar 2012 00:03:19 +0100
Subject: [Buildroot] GIT :: signing issue
In-Reply-To: <201203280024.29103.arnout@mind.be>
References: <CAPEB33xD5-OZSwNs-uuB1igho1jJHHDJ0i+F=McOn=KqA9P8TA@mail.gmail.com>
 <201203280024.29103.arnout@mind.be>
Message-ID: <CAPEB33zrz+RWOs5diqxt1KFUQCPLkCxzji59a63skwzEkKO4Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
  thanks Alexandre: I got nothing into this file related to these intials
             Arnout:     I do apply an "amend" command and did a rebase to
be sure that all others patchs will be correctly signed. After the commit I
had to do I could see that singing took the good value!

Change of the signing value using the real name
Signed-off-by: Johann MERCADIER <johann.mercadier@imerir.com>

So it worked out!
Thanks, I guess that now is everything fine and in conformity with what it
is required.
Hope that my next patch will be a bit less "painfull" at least I have all
the tools to manage it?...

Bye!



On 27 March 2012 23:24, Arnout Vandecappelle <arnout@mind.be> wrote:

> On Tuesday 27 March 2012 21:24:53 MERCADIER Johann wrote:
> >   my signature do not conform with the licence as my full name should be
> > written and not just the initials.
> >   So I have modified git config as is:
> > ___[ SHELL
> >
> ]____________________________________________________________________________
> > $ git repo-config --list
> > user.name=Johann MERCADIER
> > user.email=johann.mercadier at imerir.com
>
>  This information is used on a commit, not on a send-email.  So you have
> to amend your commit(s) first.  A simple
>
> git commit --amend -s
>
> should probably do the trick.  If you have several commits to amend, use
>
> git rebase -i master
>
> and choose 'edit' for all your commits, then amend each of them as above.
>
>  Regards,
>  Arnout
>
>  PS If you would start using quilt or topgit, the above doesn't apply
> anymore because these tools store the commit messages differently.
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120329/5de18d9d/attachment.html>
