From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:22:46 +0200
Subject: [Buildroot] [PATCH 1/1] qt5declarative: backport 'Fix alignment
 issue on ARMv7' patch to 5.9.1
In-Reply-To: <20170731171359.32471-1-petar.koretic@qaap.io>
References: <20170731171359.32471-1-petar.koretic@qaap.io>
Message-ID: <20170731212246.79362bcb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 19:13:59 +0200, Petar Koretic wrote:

> diff --git a/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
> new file mode 100644
> index 0000000000..da68826ccb
> --- /dev/null
> +++ b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
> @@ -0,0 +1,34 @@
> +From 03c2661b1243cc529fc3d8cfa65073f1da420307 Mon Sep 17 00:00:00 2001
> +From: Simon Hausmann <simon.hausmann@qt.io>
> +Date: Thu, 22 Jun 2017 13:34:09 +0200
> +Subject: [PATCH] Fix alignment issue on ARMv7
> +
> +As analyzed in the bug report, it appears that we may get
> +QV4::CompiledData::Function pointers for writing that are not aligned
> +for the 64-bit fields at the beginning.
> +
> +[ChangeLog][QtQml] Fix crash due to misaligned data structures on ARMv7
> +
> +Task-number: QTBUG-61552
> +Change-Id: I6b2c166b725496150c8850475577628ccd811d65
> +Reviewed-by: Erik Verbruggen <erik.verbruggen@qt.io>

You should add your Signed-off-by here, and a link to the upstream bug
report or commit (I see you wrote the task number and change-id, but a
direct link is preferable).

Since anyway the patch was not entirely correct because it should be in
the 5.9.1/ subfolder, can you resend an updated version that takes into
account those small comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
