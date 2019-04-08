From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  8 Apr 2019 00:22:52 -0300
Subject: [Buildroot] [PATCH v4 0/3] .gitlab-ci.yml: rework and add trigger
 per job
In-Reply-To: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
Message-ID: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Besides the current subsets of jobs that can be triggered by pushing temporary
branches with special names:
 - all defconfigs: /.*-defconfigs$/
 - all runtime tests: /.*-runtime-tests$/
This series allows the user of GitLab pipeline to trigger some interesting
subsets of jobs by pushing temporary branches with names that match regexps:
 - one defconfig: /.*-defconfig_name$/
 - one test case: /.*-test_case_name$/
Pushing a tag still triggers all jobs.

Patch 1 reorders the template so similar keys stay together, making the
maintenance easier.
Patch 2 could be merged to patch 3, but for the sake of easier review/testing I
had split them.
Patches 1 and 2 do not change any functionality.

Finally patch 3 actually adds the per defconfig and per runtime test triggers.

Changes v3 -> v4:
 - remove patch 2 that switch to using the new "include" keyword. That patch
   started from a suggestion from Arnout that I misunderstood. That patch does
   not really need to be in this series, so let's switch to using "include" in
   a separate patch or series.

Regards,
Ricardo

Ricardo Martincoski (3):
  .gitlab-ci.yml: reorder jobs
  .gitlab-ci.yml: prepare to reuse scripts
  .gitlab-ci.yml: add trigger per job

 .gitlab-ci.yml    | 90 ++++++++++++++++++++++++++++++++---------------
 .gitlab-ci.yml.in | 90 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 122 insertions(+), 58 deletions(-)

-- 
2.17.1
