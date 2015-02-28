From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 20:31:16 +0100
Subject: [Buildroot] [PATCH v5 02/11] autobuild-run: use docopt for
 argument parsing
In-Reply-To: <1418414696-32584-3-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150228203116.526a8cc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:47 +0100, Thomas De Schampheleire wrote:

> +    if args['--config']:
> +        ini_config = load_ini_config(args['--config'])
> +        # merge config/args, priority given to config
> +        args = merge(ini_config, args)

As we discussed, I changed this to:

	args = merge(args, ini_config)

since the command line arguments should have priority over the values
defined in the configuration file, like any other Unix tool does.

However, this doesn't seem to work: since the docopt documentation says
that ninstances default value is 1 when no value is defined, I believe
'args' contains a value of 1 for ninstances, and it doesn't fall back
to using the value defined in the configuration file.

Do you see a way of fixing this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
