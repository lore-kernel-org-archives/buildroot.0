From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:13:44 +0200
Subject: [Buildroot] [PATCH] package/fail2ban: fix fail2ban-python
 symlink
In-Reply-To: <20201005055809.24044-1-peter@korsgaard.com>
References: <20201005055809.24044-1-peter@korsgaard.com>
Message-ID: <20201008221344.1543e09d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 07:58:08 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes (reproducible):
> http://autobuild.buildroot.net/results/50f/50f199bfe06d054cc6770760e73ac0de594a0670/diffoscope-results.txt
> 
> Fail2ban installs the fail2ban-python symlink pointing to the host python
> intepreter used to run setup.py, which is naturally not valid at runtime and
> breaks the reproducible tests as shown in the diffoscope results:
> 
> ? -lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-1/host/bin/python
> ? +lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-2/host/bin/python
> 
> As a workaround, update the symlink after installation to point to the
> correct target python.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/fail2ban/fail2ban.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

It would have been nicer to have something supported by upstream
fail2ban. I guess like me you looked at the setup.py logic, and
realized that it was too convoluted to find a reasonably simple fix?

So applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
