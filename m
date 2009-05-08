From: Daniel Mack <daniel@caiaq.de>
Date: Fri, 8 May 2009 13:03:28 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
Message-ID: <20090508110328.GB20205@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 08, 2009 at 07:56:25AM -0300, Thiago A. Corr?a wrote:
> On Fri, May 8, 2009 at 6:48 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> > ?Thiago> Ok, after an hour of wrestling with git and it's man pages, I
> > ?Thiago> think I got it right :) I was even able to split the kernel
> > ?Thiago> update commit.
> >
> > Heh, was git rebase -i that bad?
> 
> Just adding the signoff was easy... commit --amend -s did the trick,
> the problem was me trying to split the other commit. 

That's exactly what git rebase -i is for. Mark the commit you like to
split as 'edit' (instead of 'pick') and quit the editor. git will stop
the rebase at this point and let you do more commits. When you're done
splitting things up, run git rebase --continue.

There's a nice video cast about that here:

  http://gitcasts.com/posts/rebasing

Daniel
