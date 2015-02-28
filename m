From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 20:29:09 +0100
Subject: [Buildroot] [PATCH v5 03/11] autobuild-run: add option
 --make-opts for custom Buildroot options
In-Reply-To: <1418414696-32584-4-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150228202909.3b5ce127@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:48 +0100, Thomas De Schampheleire wrote:

> +    cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
> +            "-C", srcdir, "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs] \
> +          + make_opts.split()

This breaks badly when no make_opts are passed:

Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/process.py", line 232, in _bootstrap
    self.run()
  File "/usr/lib/python2.6/multiprocessing/process.py", line 88, in run
    self._target(*self._args, **self._kwargs)
  File "./autobuild-run", line 660, in run_instance
    ret = do_build(**kwargs)
  File "./autobuild-run", line 471, in do_build
    + kwargs['make_opts'].split()
AttributeError: 'NoneType' object has no attribute 'split'

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
