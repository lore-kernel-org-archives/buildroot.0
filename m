From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:18:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/m4: fix build with glibc 2.34
In-Reply-To: <20210418114253.2068962-1-fontaine.fabrice@gmail.com>
References: <20210418114253.2068962-1-fontaine.fabrice@gmail.com>
Message-ID: <20210419221841.113dfa12@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 13:42:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> m4 fails to build with glibc 2.34 because SIGSTKSZ is now a run-time
> variable since
> https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=6c57d320484988e87e446e2e60ce42816bf51d53
> 
> So backport an upstream patch from gnulib, see:
> https://lists.gnu.org/archive/html/bug-m4/2021-03/msg00015.html
> 
> An other option would have been to apply patch from
> https://lists.gnu.org/archive/html/bug-m4/2021-03/msg00024.html
> but no feedback was received on this patch
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=13721
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../m4/0003-c-stack-stop-using-SIGSTKSZ.patch | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 package/m4/0003-c-stack-stop-using-SIGSTKSZ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
