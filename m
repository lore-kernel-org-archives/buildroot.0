From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:50:15 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix ICE on xtensa, 5.x and 6.x,
 PR target/78603
In-Reply-To: <1480462669-19677-1-git-send-email-jcmvbkbc@gmail.com>
References: <1480462669-19677-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161130225015.1c69d468@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 15:37:49 -0800, Max Filippov wrote:
> Zero overhead loop optimization pass may incorrectly put start of the
> loop between a call and its CALL_ARG_LOCATION note, resulting in the
> following build error:
> 
>   ../src/pjlib-test/thread.c: In function 'thread_test':
>   ../src/pjlib-test/thread.c:328:1: internal compiler error: in
>     dwarf2out_var_location, at dwarf2out.c:21846
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d919e1276ce1d39b4b3eb09937927d5959cd69a3/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch | 37 ++++++++++++++++++++++
>  .../gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch | 37 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch
>  create mode 100644 package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
