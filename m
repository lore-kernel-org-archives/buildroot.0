From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 18:51:06 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <87fw02vpqe.fsf@dell.be.48ers.dk>
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
 <871ubv9bk0.fsf@dell.be.48ers.dk> <51378135.6070006@mind.be>
 <87fw02vpqe.fsf@dell.be.48ers.dk>
Message-ID: <20130311185106.5ea959a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 10 Mar 2013 23:45:13 +0100, Peter Korsgaard wrote:

> Ok, but it will atleast change the current behaviour, which people might
> rely on..
> 
> What do others say?

If the per-package out-of-tree stuff is merged, then in most cases,
it will no longer be needed to do this rsync, except for packages that
don't support out-of-tree build.

As far as the actual code goes, I would find it ok that the .git/.svn
stuff is not copied. It's pretty big, and 'breaks' only this very
specific 'commit ID' thing, so I would tend to agree with Thomas's
patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
