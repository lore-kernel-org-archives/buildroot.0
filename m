From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 13 Jan 2019 20:54:20 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-01-12
In-Reply-To: <20190113070028.D7DD3209C2@mail.bootlin.com>
References: <20190113070028.D7DD3209C2@mail.bootlin.com>
Message-ID: <CAFOYHZDq3hCZYd_NgN-nFdk9+J==1Tmsx=cNTCs7TdKB3deMRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 13, 2019 at 8:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2019-01-12, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>          arm |               syslog-ng-3.19.1 | http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333
>

The problem is this

lib/signal-handler.c:30:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>

Which seems to be new in 3.19.1. I suspect (but have not yet
confirmed) that dlfcn.h is not available because the build in question
defines BR2_STATIC_LIBS. But syslog-ng has had a plugin architecture
for a while so I'm not sure static linking even makes sense for it.
