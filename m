From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 31 Oct 2011 09:52:46 -0500
Subject: [Buildroot] [Bug 4429] buildroot 2011.08 does not build on
	Ubuntu 11.10
In-Reply-To: <20111031140530.94A078F3E2@busybox.osuosl.org>
References: <bug-4429-163@https.bugs.busybox.net/>
 <20111031140530.94A078F3E2@busybox.osuosl.org>
Message-ID: <201110310952.48797.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon October 31 2011, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=4429
> 
> --- Comment #3 from Robert Berger <busybox@reliableembeddedsystems.com> 2011-10-31 14:05:30 UTC ---
> When I'm __not__ running screen or byubo, but, just ssh to a machine:
> 
> echo $SHELL
> /bin/bash
> 
> it compiles.
> 
> ---------------------------
> 
> When I'm running byubo (and bash)
> 
> echo $SHELL
> /bin/bash
> 
> it breaks with the funny errors from above.
> 

Check the environment(s) in each case, like:
set | less
and compare them.

Here, on various different installations, I can
see a lot of differences.
Each of ssh/screen/byobu modifies and 'filters'
environment settings in their own way.

You might find something modified in the environment
settings that is causing the problems.

Also take note about file ownership(s) not being what
you might expect in some uses of byobu that is mentioned
in their documentation.

Mike
