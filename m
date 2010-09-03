From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 3 Sep 2010 09:37:29 -0500
Subject: [Buildroot] About Git through SSH
In-Reply-To: <20100903150459.059d682a@surf>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<201009030730.57559.minimod@morethan.org>
	<20100903150459.059d682a@surf>
Message-ID: <201009030937.31967.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri September 3 2010, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 3 Sep 2010 07:30:54 -0500
> "Michael S. Zick" <minimod@morethan.org> wrote:
> 
> > Yup.
> > Please supply git version number(s).
> 
> Just the normal Git from the latest Ubuntu, i.e:
> 
> $ git --version
> git version 1.7.0.4
> 

Ah, so, there is the difference - Apples and Oranges

I support users back to the oldest, commonly used, git versions -
Where I define that as the version in the current Debian stable release.

So the commentary in the gitolite release still applies to older git versions.
http://packages.debian.org/lenny/git-core

Somewhere between v1.5 and v1.7 they must have added parsing "ssh://" to the git client.

You might want to add a comment in the "Minimum Software Requirements" of Buildroot,
to go along with the addition of the user specified scheme feature for the case of
 "git xxx ssh://..."
style URIs

Might cut down on the end-user puzzlement of: "Why doesn't this work for me?"

Note: I think the change happened at v1.6 but I haven't checked to be certain.

Mike
> > Any additional patches or local changes / customizations to your git
> > client?
> 
> No, nothing. I think as soon as your user has write access to the remote
> location through SSH, git just works.
> 
> However, as I said:
> 
> > > As far as I see, Gitolite introduces per-branch or per-tag
> > > permissions, but plain Git already allows per-repository
> > > permissions. No ?
> 
> Maybe that's what you're looking for and which is not supported by
> standard git.
> 
> Regards,
> 
> Thomas
