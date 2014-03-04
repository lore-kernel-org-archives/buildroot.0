From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 22:52:34 +0100
Subject: [Buildroot] [PATCH v5 2/4] Makefile: export PATH including the
 Buildroot host bindirs
In-Reply-To: <53160821.9080907@mind.be>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
 <1393703951-7059-3-git-send-email-s.martin49@gmail.com>
 <53160821.9080907@mind.be>
Message-ID: <20140304225234.164382f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 04 Mar 2014 18:06:41 +0100, Arnout Vandecappelle wrote:
> On 01/03/14 20:59, Samuel Martin wrote:
> > This patch exports the PATH variable containing the factorized content
> > of TARGET_PATH and HOST_PATH (because they were fairly similar).
> > 
> > TARGET_PATH and HOST_PATH are now set using only the PATH variable.
> > 
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
>  Looks good to me.
> 
>  Except... I'm having second thoughts about the principle of this patch.
> When debugging failing builds, I often copy&paste the build command line
> if I want to drill down to the details of the error. But if PATH is
> exported (and TARGET_PATH is removed, in 4/4), it is no longer visible on
> the command line... So I have to remember to set it myself...

True. I also do that very often.

I personally dislike exporting the PATH globally, as it means that
we're "magically" passing some stuff into the commands we are running,
which are not explicit when looking at the commands being executed.

>  A workaround would be to add a 'make shell' target, that drops you into
> an interactive shell. I don't really like it very much, but it would
> solve other issues with exported variables.

Not a big fan either :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
