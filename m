From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Jan 2015 21:10:41 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: fix host-cmake-package type
In-Reply-To: <1421945596-53762-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1421945596-53762-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <CAHXCMMKQyqYnuhxtXrSGEE9JyF+NYmYspVOC=-LQ33f5qxCerw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 22, 2015 at 5:53 PM, Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
> When trying to compile a host-cmake-package type such as host-cdrkit,
> an error happens in regards to HOSTCC and HOSTCXX not being found.
>
>   /bin/sh: HOSTCC: command not found
>   /bin/sh: HOSTCXX: command not found
>
> This due to the fact that the environment is incorrectly configured by
> having the following:
>
>   -DCMAKE_C_COMPILER=""$(HOSTCC)"" -DCMAKE_CXX_COMPILER=""$(HOSTCXX)""
>
> This is due to having too many dollar signs. The fix is to remove the
> extra dollar sign.
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
