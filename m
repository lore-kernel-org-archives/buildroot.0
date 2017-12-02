From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 02 Dec 2017 02:33:23 -0200
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
References: <20171130153458.GA3519@scaer>
Message-ID: <5a222d13e66e2_7f6c199f5601649f@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Nov 30, 2017 at 01:34 PM, Yann E. MORIN wrote:
[snip]
> And even that generates 305+566+230 = 1101 warnings.
> 
> Regards,
> Yann E. MORIN.
> 
> PS. Not sure what the split in three numbers is:
> 
>   $ find package/ boot/ linux/ -type f \
>         \( -name '*.mk' -o -name '*.hash' \
>            -o -name '*.patch' -o -name Config.in \
>         \) -exec ./utils/check-package {} + 2>&1 \
>     |grep 'warnings generated'
>     305 warnings generated
>     566 warnings generated
>     230 warnings generated

find -exec splits it into 3 lines:
  $ find package/ boot/ linux/ -type f \
        \( -name '*.mk' -o -name '*.hash' \
           -o -name '*.patch' -o -name Config.in \
        \) -exec echo {} + | wc -l
  3
Each one of the first two lines is 128KiB long.
  $ xargs --show-limits
  ...
  Size of command buffer we are actually using: 131072

Regards,
Ricardo
