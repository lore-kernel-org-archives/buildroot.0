From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Aug 2014 15:43:40 +0200
Subject: [Buildroot] [PATCH 5/6] toolchainfile.cmake.in: do not force
 the CMAKE_{C, CXX}_FLAGS to the cache
In-Reply-To: <1408113551-29932-6-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
 <1408113551-29932-6-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LWQ7QvhA7Hag-29KLxSN5YkWvLSN1AbnvnhyLCWxsrkow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 15, 2014 at 4:39 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Fix #7280 [1]
>
> When FORCE option is passed to the set command, the variable is
> added/updated in the CMake cache every single time CMake process this
> command.

the FORCE option
processes

>
> Because the toochainfile.cmake prepends architecture/toolchain flags to

toolchainfile.cmake

> the CMAKE_{C,CXX}_FLAGS, this makes the CFLAGS being updated in the
> generated Makefiles each time ones reconfigures its project. So it

one

> forces the compilation of everything, even when nothing has changed.
>
> [1] https://bugs.busybox.net/show_bug.cgi?id=7280
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(tested the SimpleApp reproduction scenario described in the bug report)
