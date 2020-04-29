From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2020 23:42:44 +0200
Subject: [Buildroot] [git commit] support/testing: test_python_django:
 use the timeout_multiplier value
In-Reply-To: <20200412095520.318758E5C2@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Apr 2020 12:08:51 +0200")
References: <20200412095520.318758E5C2@busybox.osuosl.org>
Message-ID: <87wo5y6ka3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3e6b97e09e1b275ad177fde8efcc5c57ec8ecb79
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As reported by our gitlab runtime test [1] and on the mailing list
 > [2], the test_python_django is failing due to django server taking a
 > lot of time to start. Since the django server is started in background
 > through pexpect, we can't easily wait for the last startup line:

 > "January 01, 1970 - 00:00:41

 > Django version 3.0.4, using settings 'testsite.settings'

 > Starting development server at http://0.0.0.0:1234/

 > Quit the server with CONTROL-C."

 > In the failing gitlab job, we don't see such lines.

 > If we increase a lot the timout, the test passes.

 > Use timeout_multiplier introduced by [3] in order to adjust the
 > timeout.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222

 > Tested:
 > https://gitlab.com/kubu93/buildroot/-/jobs/507458355

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222
 > [2] http://lists.busybox.net/pipermail/buildroot/2020-April/279598.html
 > [3] 6e45e33f27d5ae6fa0ab5aad3f032d886a886037

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
