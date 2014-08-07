From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 12:16:54 +0200
Subject: [Buildroot] [PATCH V2] gdb: allow building on AArch64 systems
In-Reply-To: <20140807100915.GM23355@tarshish>
References: <1407314534-5536-1-git-send-email-alex.bennee@linaro.org>
 <20140806194603.3a56a5e5@free-electrons.com>
 <87sil8k4sg.fsf@linaro.org>
 <20140807120031.0c82d985@free-electrons.com>
 <20140807100915.GM23355@tarshish>
Message-ID: <20140807121654.258166b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 7 Aug 2014 13:09:15 +0300, Baruch Siach wrote:

> > We're using pwclient, which downloads the patch from patchwork and
> > applies it with "git am".
> > 
> > There's basically no chance for your local commit used to generate the
> > patch to have the same SHA1 as the commit integrated in the official
> > repository. Your commit applies on commit A, but it ends up applied on
> > top of commit B. And since the SHA1 of the parent commit is part of
> > what defines the next commit and therefore it's SHA1, there's no chance
> > for your commit to have the same SHA1 in the official repo as in your
> > local repo with the workflow we have.
> > 
> > SHA1 would be preserved if we were taking pull requests and merging
> > those pull requests without rebasing them. But basically, by using "git
> > am", we're rebasing all patches on top of the latest master when
> > applying them, which changes their SHA1.
> 
> Alex was asking about author name, not commit ID. Compare:
> 
> Author: Alex Benn?e <alex.bennee@linaro.org>
> 
> Author: alex.bennee at linaro.org <alex.bennee@linaro.org>
> 
> I should note that the sign-off line preserves the name correctly.

Ah yes. Then, seems possibly like a patchwork issue, since from
patchwork point of view, the author is alex.bennee at linaro.org. See
http://patchwork.ozlabs.org/patch/376942/. However, it does seem to
handle non-ASCII characters in author names if you look at
http://patchwork.ozlabs.org/patch/377013/.
http://patchwork.ozlabs.org/patch/371846/ is another example.

If you look at
http://patchwork.ozlabs.org/project/buildroot/list/?state=*, you'll see
that Alex's patch is the only case in recent times where the e-mail was
used instead of the author name.

Not sure what happened.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
