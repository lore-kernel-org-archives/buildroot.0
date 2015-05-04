From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 22:12:37 +0200
Subject: [Buildroot] [autobuild v2 2/3] autobuild-run: also save CMake
 config log files on package failure
In-Reply-To: <5541613E.80604@mailerd.de>
References: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
 <1430338217-25518-2-git-send-email-s.martin49@gmail.com>
 <5541613E.80604@mailerd.de>
Message-ID: <20150504221237.6920abf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Thu, 30 Apr 2015 00:54:54 +0200, Andr? Erdmann wrote:

> config_files = set(('config.log', ...))
> 
> It's negligible in terms of real time difference (<= 0.0d seconds),
> but for efficiency reasons, don't use a tuple or list when doing
> lookups ("fname in config_files").
> 
> os.walk() might return 100s or 1000s of file names in total,
> and for each fname, you have to through the entire list/tuple
> (until fname found or end of list, whatever comes first).
> Data structures like set/frozenset/dict perform lookups faster (on average).

Can you submit a follow-up patch implementing this suggestion?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
