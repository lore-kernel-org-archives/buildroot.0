From: Will Newton <will.newton@gmail.com>
Date: Sat, 12 Mar 2011 10:50:25 +0000
Subject: [Buildroot] compile espgs 8.15.4 with buildroot
In-Reply-To: <AANLkTin96tM_skmaWcEBDDfBB6Aoi+6s7ZrecspigB9x@mail.gmail.com>
References: <AANLkTin96tM_skmaWcEBDDfBB6Aoi+6s7ZrecspigB9x@mail.gmail.com>
Message-ID: <AANLkTinFrzeD7nnLNVR6yW+2PmE6S5vGR_p2Q5NmLiZH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 12, 2011 at 7:53 AM, bao bui <buiqbao@gmail.com> wrote:
> I am trying to add esp ghost script 8.15.4 to buildroot.
> I got the error:
>>>> espgs 8.15.4 Patching package/espgs
> for file in config.guess config.sub; do for i in $(find
> /home/bao/work/buildroot/output/build/espgs-8.15.4 -name $file); do cp
> package/gnuconfig/$file $i; done; done
> cp: not writing through dangling symlink
> `/home/bao/work/buildroot/output/build/espgs-8.15.4/ijs/config.guess'
> cp: not writing through dangling symlink
> `/home/bao/work/buildroot/output/build/espgs-8.15.4/ijs/config.sub'
> make: ***
> [/home/bao/work/buildroot/output/build/espgs-8.15.4/.stamp_patched] Error 1
>
>
> How to fix it?

Buildroot is trying to update config.sub and config.guess in the espgs
source tree to the most recent version. However, it appears in the
source tree ijs/config.sub and ijs/config.guess are dangling symlinks
(i.e. symlinks to a non-existent file). That's a little strange and
you should investigate the espgs build procedure to find out why that
is the case.
