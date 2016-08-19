From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 19 Aug 2016 11:14:30 +0530
Subject: [Buildroot] [PATCH 2/2] logrotate: fix up build error with gcc 6
In-Reply-To: <20160818212125.1cb8e7ae@free-electrons.com>
References: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471539849-3766-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20160818212125.1cb8e7ae@free-electrons.com>
Message-ID: <57B69CBE.2040305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Friday 19 August 2016 12:51 AM, Thomas Petazzoni wrote:
> Hello,
>
> Can this apply without the 3.10.0 bump?

Yes, but this patch fixes only one build error out of two.

We see following two build errors

logrotate.c: In function 'postrotateSingleLog':
logrotate.c:1784:5: error: this 'if' clause does not guard... 
[-Werror=misleading-indentation]
      if (!state->doRotate)
      ^~
logrotate.c:1787:2: note: ...this statement, but the latter is 
misleadingly indented as if it is guarded by the 'if'
   if (!hasErrors && log->flags & LOG_FLAG_TMPFILENAME) {
   ^~
config.c: In function 'strndup':
config.c:87:10: error: nonnull argument 's' compared to NULL 
[-Werror=nonnull-compare]
         if(!s)
           ^
cc1: all warnings being treated as errors
make[2]: *** [config.o] Error 1
make[2]: *** Waiting for unfinished jobs....
cc1: all warnings being treated as errors
make[2]: *** [logrotate.o] Error 1

Another build error is fixed in upstream so PATCH 1/2 does version bump. 
Upstream commit - 
https://github.com/logrotate/logrotate/commit/6a36c105587b07ad14fc937f3ee6e2eb402621a2

>
> Indeed PATCH 2/2 being a bug fix, it would be a candidate for the
> "master" branch, while PATCH 1/2 being a version bump, we can only
> commit it to the "next" branch.

In that case, I will spin v2 of this patch and backport upstream commit 
to fix second build error.

Thanks,
Rahul
