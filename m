From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 15:46:24 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: fix build issue with glibc
In-Reply-To: <1471887117-18135-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471887117-18135-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160827154624.5a6ff38c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 23:01:57 +0530, Rahul Bedarkar wrote:
> With glibc 2.16, we get following build error when building jack2:
> 
>   [193/247] cxx: tests/iodelay.cpp -> build/tests/iodelay.cpp.4.o
>   ../tests/iodelay.cpp:171:43: error: 'UINT32_MAX' was not declared in this scope
>   ../tests/iodelay.cpp:171:55: error: 'UINT32_MAX' was not declared in this scope
>   ../tests/iodelay.cpp:172:44: error: 'UINT32_MAX' was not declared in this scope
>   ../tests/iodelay.cpp:172:56: error: 'UINT32_MAX' was not declared in this scope
> 
> In glibc 2.17 or older version, Header <stdint.h> defines these macros
> for C++ only if explicitly requested by defining __STDC_LIMIT_MACROS.
> 
> We can't use <cstdint> since it requires C++11 standard.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/369/369ce208ffea43dad75ba0a13469159b341e3bf5/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  .../0003-tests-define-__STDC_LIMIT_MACROS.patch    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch

Applied to master, thanks. Please submit your patch to the upstream
jack2 project.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
