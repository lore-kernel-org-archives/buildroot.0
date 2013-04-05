From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 5 Apr 2013 13:17:54 +0100
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <20130405141247.67149ee7@skate>
References: <20130405141247.67149ee7@skate>
Message-ID: <CAG2jQ8iCYNPGcT=frmjx-zJtkFyKceCWi9csbEtj8BQk1_3Nqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  * ltp-testsuite on arm
>    http://autobuild.buildroot.org/results/86b598b885e2db57f651a722c87be26f5fee956b/build-end.log

Hi Thomas,

LTP will try to link to libcap if it is present, but until some time
ago, libcap did not link against libattr which is required in order
for
these symbols to be exported. This was recently fixed in buildroot[1].
So in order for this problem to go away, you need both libcap and attr
in your buildroot config.

http://git.buildroot.net/buildroot/commit/package/libcap/libcap.mk?id=1bf3d6f8cf3a2dca9ce1c6f3e68b077724f21db6
