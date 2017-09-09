From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sat, 9 Sep 2017 22:26:19 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <20170908133156.10357-1-ps.report@gmx.net>
References: <20170908133156.10357-1-ps.report@gmx.net>
Message-ID: <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas and Peter,

> Changes v2 -> v3:
>   - add _GETTEXTIZE (instead of Makefile.in.in patch, suggested by Thomas Petazzoni)
>
> Changes v1 ->v2:
>  - add _AUTORECONF (suggested by Peter Korsgaard)

Re-running gettextize just to make autoreconf work is a bit overkill;
gettextize is something that the package maintainer runs to get the
i18n setup ready and among other things it may update gnulib imported
files in unexpected ways. I'd bet that letting just autopoint work as
expected (as a step part of autoreconf) would be way more than enough
here (i.e. no _GETTEXTIZE needed), but that step is currently disabled
in buildroot by default since some years ago.

See for reference this patch I sent last month, that makes autopoint
work again during autoreconf:
http://lists.busybox.net/pipermail/buildroot/2017-August/200941.html

-- 
Aleksander
https://aleksander.es
