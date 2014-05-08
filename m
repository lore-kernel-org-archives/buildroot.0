From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 8 May 2014 18:55:06 -0500
Subject: [Buildroot] [git commit] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <20140508200413.789DA9CB12@busybox.osuosl.org>
References: <20140508200413.789DA9CB12@busybox.osuosl.org>
Message-ID: <OF1318F845.0A53FD4C-ON86257CD2.00817C9E-86257CD2.0083637C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Peter Korsgaard <peter@korsgaard.com> wrote on 05/08/2014 03:00:47 PM:
 
> commit: http://git.buildroot.net/buildroot/commit/?
> id=ac93fabb66de0a2acb703b9079bfeed2f9d2cd45
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Add PRE_*_HOOKS to all the different steps through which a package may 
go.
> 
> This will help avoid using POST_*_HOOKS to do tasks that should be done
> in the PRE_*_HOOKS of the next step.
> Otherwise, when the user would do a make foo-re<step>, this would not do
> what was really intented, the POST_*_HOOK of the preceding step not
> being executed.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> [ThomasDS: rebase, add images hooks to manual]

An interesting note is that the <pkg>_INSTALL_IMAGES_CMDS is undocumented 
step in the Buildroot manual. I only just recently (yesterday) discovered 
that this option was available to a "generic-package" and had to do some 
greping through the source code to confirm that it existed.

I will submit a patch to add this step to the documentation.

> Signed-off-by: Thomas De Schampheleire 
<thomas.de.schampheleire@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

[..]

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140508/cd2180f7/attachment.html>
