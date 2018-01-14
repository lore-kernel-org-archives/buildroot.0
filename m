From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jan 2018 19:42:27 +0100
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
 <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
Message-ID: <jtksiex3i1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

Am Sun, 14 Jan 2018 19:56:00 +0200 schrieb Stefan Fr?berg:

> Uh...47 compiler/platform combinations? Jeeez...that will take ages with
> my poor comp ...

Maybe not, test-pkg uses pre-built toolchains, just like the autobuilders.

> Where does that test-pkg script output the build failures?

$HOME/test-unbound/{name of compiler/platform combo}/logfile

Some errors are thread-related, maybe you need to check for 
BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_TOOLCHAIN_HAS_THREADS.

Regards, Bernd
