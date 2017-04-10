From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 10:22:29 +0200
Subject: [Buildroot] [PATCH/autobuild 2/8] autobuild-run: add '-d,
 --debug' option
In-Reply-To: <20170409205128.11560-2-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-2-arnout@mind.be>
Message-ID: <20170410102229.05f6fe68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Apr 2017 22:51:22 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> -    kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
> +    if kwargs['debug']:
> +        kwargs['log'] = sys.stdout
> +    else:
> +        kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
>      log_write(kwargs['log'], "INFO: instance started")

How does this works when you have several instances running in
parallel?

Everything gets mixed up on stdout?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
