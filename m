From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 23:33:30 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: .gitlab-ci.yml: fail when
 listing tests fail
In-Reply-To: <20181021100303.18431-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 21 Oct 2018 11:03:02 +0100")
References: <20181021100303.18431-1-arnout@mind.be>
Message-ID: <87lg6r3ryt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > To update the .gitlab-ci.yml file, we run run-tests -l to list all the
 > tests and post-process the output in a format suitable for
 > .gitlab-ci.yml. However, in a pipeline, it is the last command that
 > gives the return value. In addition, we have to redirect stderr of
 > run-tests -l because nose2 prints the tests on stderr, not stdout. Thus,
 > when run-tests -l fails, the update of .gitlab-ci.yml silently succeeds
 > but no tests are included in the .gitlab-ci.yml.

 > To fix this, set tho pipefail option. This is bash-specific, but our

s/tho/the/

Committed, thanks.

-- 
Bye, Peter Korsgaard
