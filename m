From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:05:05 +0200
Subject: [Buildroot] [PATCH] flatcc: fix build with gcc 8
In-Reply-To: <0cccebf8e88b355751c465a74916eef6edecb090.1528655298.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 10 Jun 2018 21:28:18 +0300")
References: <0cccebf8e88b355751c465a74916eef6edecb090.1528655298.git.baruch@tkos.co.il>
Message-ID: <87zi01ay32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > gcc 8 enables a strncpy() warning. This breaks the build of flatcc that
 > enables -Werror. Add upstream patch fixing the issue.

 > Fixes:
 > http://autobuild.buildroot.net/results/0e3/0e3a959855fad5899db184f7d2c960c89df03672/
 > http://autobuild.buildroot.net/results/d2c/d2c03bc253bdf135b0f31f3d1e6fd33f7d37d64b/
 > http://autobuild.buildroot.net/results/163/1636ec6ddad92add95f42451d941156451c6d936/

 > Cc: Joel Carlson <JoelsonCarl@gmail.com>
 > Cc: Mikkel Fahn?e J?rgensen <mikkel@dvide.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

How about disabling Werror to workaround such issues in the future. From
CMakeLists.txt:

# -Werror is only set for some compiler versions that are believed to
# to not generate any warnings. If the assumption breaks, disable
# this option if the warning is not significant.
option (FLATCC_ALLOW_WERROR "allow -Werror to be configured" ON)

-- 
Bye, Peter Korsgaard
