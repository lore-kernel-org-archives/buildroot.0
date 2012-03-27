From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 00:24:28 +0200
Subject: [Buildroot] GIT :: signing issue
In-Reply-To: <CAPEB33xD5-OZSwNs-uuB1igho1jJHHDJ0i+F=McOn=KqA9P8TA@mail.gmail.com>
References: <CAPEB33xD5-OZSwNs-uuB1igho1jJHHDJ0i+F=McOn=KqA9P8TA@mail.gmail.com>
Message-ID: <201203280024.29103.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 27 March 2012 21:24:53 MERCADIER Johann wrote:
>   my signature do not conform with the licence as my full name should be
> written and not just the initials.
>   So I have modified git config as is:
> ___[ SHELL
> ]____________________________________________________________________________
> $ git repo-config --list
> user.name=Johann MERCADIER
> user.email=johann.mercadier at imerir.com

 This information is used on a commit, not on a send-email.  So you have
to amend your commit(s) first.  A simple

git commit --amend -s

should probably do the trick.  If you have several commits to amend, use

git rebase -i master

and choose 'edit' for all your commits, then amend each of them as above.

 Regards,
 Arnout

 PS If you would start using quilt or topgit, the above doesn't apply
anymore because these tools store the commit messages differently.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
