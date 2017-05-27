From: Ilias Apalodimas <apalos@gmail.com>
Date: Sat, 27 May 2017 10:43:37 +0300
Subject: [Buildroot] keepalived build failures
Message-ID: <CADvJCodt9mua7JUpJeMwLK6gvx--zn62553APPDJ2L9VTLiEBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Regarding these reports
http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5
http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e
http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560

These are all using an external toolchain and linux-3.2 headers.
Keepalived includes linux_ip_set.h when ipset package is enabled,
which conflicts with linux xt_set.h header.

Yann Morin was kind enough to reproduce the build using linux-3.4
headers and the compilation failure went away.

Shall i submit a patch that limits keepalived to linux-headers > 3.2
when ipset is enabled?
Is there a better solution?

Regards
Ilias
