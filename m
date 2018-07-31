From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jul 2018 07:19:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/opencv3: fix aarch64 build
References: <20180730160836.21016-1-bernd.kuhls@t-online.de>
 <20180730160836.21016-2-bernd.kuhls@t-online.de>
 <20180730235001.429c059e@windsurf>
Message-ID: <43853fxp6j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Mon, 30 Jul 2018 23:50:01 +0200 schrieb Thomas Petazzoni:

> So this fix is already needed with the currently packaged 3.3.0 version
> of OpenCV ?

yes: http://autobuild.buildroot.net/?reason=opencv3-3.3.0

Please note that the aarch64 build errors started on June 9th, 2018.

> If so, why is this fix patch coming *after* the version bump in the
> series ?

OpenCV 3.4.2 is also affected by the problem, because of that I think 
that patch order does not matter. My first try to fix the build error was 
to bump package version, seeing that this did not fix the problem I 
investigated further and found the VFPV3 problem.

> Both 2018.05.x and 2018.02.x are using 3.3.0, so I guess they are
> affected as well. However, this failure doesn't appear for 2018.02.x and
> 2018.05.x in http://autobuild.buildroot.net/?reason=opencv3%
> 
> Do you have an explanation for this ?

The bug was introduced by https://git.buildroot.net/buildroot/commit/
package/opencv3?id=a17402e42d8c996af239cfdb536e74188d6c6245 on June 7th, 
2018. This patch was only committed to the master branch.

Regards, Bernd
