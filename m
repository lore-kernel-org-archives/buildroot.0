From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:42:44 +0200
Subject: [Buildroot] [PATCH 1/3] support/testing: show messages in a
 more readable format
In-Reply-To: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
References: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20170510234244.0c7c76d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 23:33:44 +0200, Luca Ceresoli wrote:
> Currently messages from run-tests are quite unpleasant:
> 
> [br-tests/TestPostScripts/2017-05-09 15:51:57] Building
> [br-tests/TestPostScripts/2017-05-09 15:52:23] Building done
> [br-tests/TestPostScripts/2017-05-09 15:52:23] Cleaning up
> .[br-tests/TestNoTimezone/2017-05-09 15:52:23] Starting
> [br-tests/TestNoTimezone/2017-05-09 15:52:23] Building
> [br-tests/TestNoTimezone/2017-05-09 15:53:17] Building done
> [br-tests/TestNoTimezone/2017-05-09 15:53:22] Cleaning up
> .[br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:53:22] Starting
> [br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:53:22] Building
> [br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:54:33] Building done
> [br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:54:37] Cleaning up
> [...]
> 
> Change them in a more readable way by removing the date and using a
> columnar style:
> 
> 15:12:22 TestPostScripts                          Starting
> 15:12:25 TestPostScripts                          Building
> 15:12:48 TestPostScripts                          Building done
> 15:12:48 TestPostScripts                          Cleaning up
> .15:12:48 TestNoTimezone                           Starting
> 15:12:54 TestNoTimezone                           Building
> 15:13:44 TestNoTimezone                           Building done
> 15:13:49 TestNoTimezone                           Cleaning up
> .15:13:49 TestGlibcNonDefaultLimitedTimezone       Starting
> 15:14:00 TestGlibcNonDefaultLimitedTimezone       Building
> 15:14:56 TestGlibcNonDefaultLimitedTimezone       Building done
> 15:15:01 TestGlibcNonDefaultLimitedTimezone       Cleaning up
> [...]
> 
> Note the '.' and other characters presented by nose2 are still
> printed. They are not affected by this change.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/testing/infra/basetest.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
