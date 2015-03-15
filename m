From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:34:48 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
In-Reply-To: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150315143448.72b386dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:45 +0100, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (11):
>   scripts: add python module docopt
>   autobuild-run: use docopt for argument parsing
>   autobuild-run: add option --make-opts for custom Buildroot options
>   autobuild-run: use **kwargs to avoid explicit parameter passthroughs
>   autobuild-run: check-requirements does not need to know the login
>     details
>   autobuild-run: set LC_ALL=C to not use locale settings of host machine
>   autobuild-run: improve the logic to generate build-end.log
>   autobuild-run: save config.log files for failed package
>   autobuild-run: extend TODO list
>   autobuild-run: kill all children on SIGTERM
>   autobuild-run: catch KeyboardInterrupt in the same way as SIGTERM

I've applied your patch series. A few comments, though:

 1/ I also applied your two follow-up patches
    http://patchwork.ozlabs.org/patch/444865/ and
    http://patchwork.ozlabs.org/patch/444866/. As requested in the
    commit log, the second patch was squashed into the patch adding the
    support for killing subprocesses.

 2/ I had to rework patch http://patchwork.ozlabs.org/patch/444866/
    because subprocess.check_output() doesn't exist in Python 2.6. So
    I've used a different construct.

 3/ Killing all subprocesses apparently still doesn't work completely
    correctly, I got the backtrace of the attached file once when
    interrupting the autobuild-run script with Ctrl+C, on a system that
    uses Python 2.6. And the child processes (timeout processes) were
    still running.

Thanks a lot, and sorry for the huge delay!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: backtrace.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150315/4339d329/attachment.txt>
