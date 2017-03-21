From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:07:45 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: disable Open POSIX testsuite
In-Reply-To: <1490131280-1379-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490131280-1379-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170321230745.0210c8af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 22:21:20 +0100, Thomas Petazzoni wrote:
> The Open POSIX testsuite builds and installs to the target directory a
> program called 't0' that isn't cross-compiled, which is bad.
> 
> Since the LTP build system is autoconf but not automake based, and the
> Open POSIX testsuite is a sort of sub-project inside it, fixing the
> issue is not trivial.
> 
> Therefore, we simply disable the Open POSIX testsuite entirely. Oddly
> enough, --without-open-posix-testsuite doesn't work due to another bug,
> so we simply have to remove --with-open-posix-testsuite.
> 
> Open POSIX testsuite cross-compilation issue reported at
> https://github.com/linux-test-project/ltp/issues/144.
> 
> Configure script bug reported at
> https://github.com/linux-test-project/ltp/issues/143.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8326ba9eb257dfc92c1ad282ba6d3565e8250def/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
