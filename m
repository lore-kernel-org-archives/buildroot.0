From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 23:00:20 +0200
Subject: [Buildroot] [PATCH] package/fail2ban: fix fail2ban-python
 symlink
In-Reply-To: <20201005055809.24044-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 5 Oct 2020 07:58:08 +0200")
References: <20201005055809.24044-1-peter@korsgaard.com>
Message-ID: <87y2kddcez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes (reproducible):
 > http://autobuild.buildroot.net/results/50f/50f199bfe06d054cc6770760e73ac0de594a0670/diffoscope-results.txt

 > Fail2ban installs the fail2ban-python symlink pointing to the host python
 > intepreter used to run setup.py, which is naturally not valid at runtime and
 > breaks the reproducible tests as shown in the diffoscope results:

 > ? -lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-1/host/bin/python
 > ? +lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-2/host/bin/python

 > As a workaround, update the symlink after installation to point to the
 > correct target python.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
