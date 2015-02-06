From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Feb 2015 08:58:08 +0100
Subject: [Buildroot] [PATCH v5 04/11] autobuild-run: use **kwargs to
 avoid explicit parameter passthroughs
In-Reply-To: <1418414696-32584-5-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-5-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150206085808.66acc651@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:49 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The current version of autobuild-run has some extensive explicit
> parameter passing, for example:
> 
> - fixup_config needs sysinfo, passed via gen_config, in turn via
>   run_instance, in turn via main.
> - send_results needs username/password settings, passed via
>   run_instance, in turn via main.
> 
> Everytime a leaf function needs an extra parameter (for example coming
> from the arguments or config file), the entire call chain needs to be
> adapted to pass along that parameter.
> 
> This patch introduces the **kwargs dictionary principle, that allows
> implicit parameter passing. A function can accept this dictionary and
> extract parameters from it by name. The dictionary can be passed as a
> whole to a child function, without explicitly enumerating which entries
> in the dictionary are needed in the child.

I must say I find this **kwargs thing a bit weird. Yes indeed, it
avoids passing several parameters to functions. But on the other hand,
it means that you're passing the *entire* context to *all* functions.
Which more or less boils down to using global variables. It means that
it isn't clear looking at the prototype of a function, which parameters
it is taking.

Maybe it's just that I'm not doing enough Python, and I'm thinking too
much C, but I find this **kwargs to not be such a great idea. But oh
well, since this is Python, I guess I should convince myself to use the
Python spirit :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
