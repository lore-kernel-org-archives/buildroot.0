From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Sep 2019 23:48:49 +0200
Subject: [Buildroot] [PATCH buildroot-test 00/10] add gitlab-ci jobs to
 the daily-mail
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190905234849.0aeb11b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

On Thu, 29 Aug 2019 15:23:38 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (10):
>   utils/daily-mail: new data: gitlab-ci jobs
>   utils/daily-mail: new gitlab-ci data: defconfigs
>   utils/daily-mail: new gitlab-ci data: runtime tests
>   utils/daily-mail: add defconfig support in developers notifications
>   utils/daily-mail: add runtime tests support in developers
>     notifications
>   utils/daily-mail: prepare the mail formatting to support gitlab-ci
>     results
>   utils/daily-mail: add formatting for defconfig results
>   utils/daily-mail: add formatting for runtime-test results
>   utils/daily-mail: add argument for gitlab-ci related data
>   utils/daily-mail: enable gitlab-ci emails

Thanks for this patch series! I have made a number of changes, and
applied it.

The main changes are:

 - More filtering of pipelines: only failed pipelines are retrieved

 - Earlier filtering of pipelines: we can filter pipelines by branch
   and status before getting the details for each pipeline

 - Removal of the job duration in the e-mails, it is not a very useful
   information IMO

 - Further splitting of some of the patches

So, hopefully this Saturday we should see e-mails about defconfig
failures, since we have at least one still failing on master.

Thanks a lot for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
