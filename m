From: Christian Stewart <christian@paral.in>
Date: Wed, 10 Oct 2018 14:52:50 -0700
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <CA+h8R2pNNN7uS4h5avjoR=qMewPWu8e4zfDiSWzqCueULiQFug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 10, 2018 at 8:48 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/6c26ac3a8aa39abcb5eb390109891790610a759b
> |
> >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/10654bccc3d20ec6d29d371c48dd90cbddb8c4da
> |
> >       x86_64 |       docker-containerd-v1.1.3 | NOK |
> http://autobuild.buildroot.net/results/56b564a27a06792c4854fe983da92d40c0c4708c
> |
>
> /home/naourr/work/instance-3/output/host/lib/go/pkg/tool/linux_amd64/link:
> running
> /home/naourr/work/instance-3/output/host/bin/x86_64-amd-linux-gnu-gcc
> failed: exit status 1
> /tmp/go-build283204336/b001/exe/a.out: final close failed: Invalid
> operation
>
> Christian, what is happening here? Could you have a look?
>

Geoff Levand and I started having a look at this breakage some time ago but
did not find an immediate fix. It's a very obscure error, but I did manage
to find some non-go references:

 - https://lists.gnu.org/archive/html/bug-binutils/2016-04/msg00221.html
 - https://sourceware.org/bugzilla/show_bug.cgi?id=20006
 - http://lists.busybox.net/pipermail/buildroot/2017-August/200570.html

Buildroot Ruby bug # 20006 seems similar.

This is what we have so far on fixing this.

Best,
~ Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181010/8857cfc6/attachment-0001.html>
