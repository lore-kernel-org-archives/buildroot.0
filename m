From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 21:59:51 +0100
Subject: [Buildroot] [PATCH] package/tmux: fix build
In-Reply-To: <1486311686-24971-1-git-send-email-yann.morin.1998@free.fr>
References: <1486311686-24971-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170205215951.554fe94a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Feb 2017 17:21:26 +0100, Yann E. MORIN wrote:
> The bump to the latest libevent version exposed a latent bug in tmux,
> which tries to re-define a variable exposed by the C library.
> 
> This breaks with uClibc-ng wihch defines it const char*, while glibc and
> musl define it as non-const.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/31d/31d37c95b40d297b90a6181ec79c42ee1e2e5090/
>     http://autobuild.buildroot.org/results/ccc/ccc9d2e995ba1eaf19f6b325b0af5ebeb8066e7f/
>     http://autobuild.buildroot.org/results/8a2/8a28d43bd0c079c1b49b61b0c6ef7de79eda0549/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  ...t-re-define-program_invocation_short_name.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/tmux/0001-compat-don-t-re-define-program_invocation_short_name.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
