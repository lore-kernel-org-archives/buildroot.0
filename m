From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 23:52:13 +0100
Subject: [Buildroot] [PATCH v5 02/11] autobuild-run: use docopt for
 argument parsing
In-Reply-To: <1418414696-32584-3-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150205235213.7eb39123@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:47 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Using docopt, argument parsing becomes trivial. Adding a new argument is
> a matter of updating the usage text.
> This commit removes the original cumbersome argument handling and uses
> docopt instead. A method is added to import the settings from the
> configuration file in a similar dictionary as the one created by docopt,
> so that both can be merged (giving priority to the configuration file,
> as before).

Actually, in the current implementation, priority is given to the
command line option, and not the configuration file. Like most Unix
tools, I believe.

So to make your implementation behave like the existing one, I believe
I just need to change:

> +    if args['--config']:
> +        ini_config = load_ini_config(args['--config'])
> +        # merge config/args, priority given to config
> +        args = merge(ini_config, args)

to:

	   # merge config/args, priority given to args
	   args = merge(args, ini_config)

No need to resend just for this, I can fixup when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
