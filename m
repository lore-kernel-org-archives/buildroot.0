From: Ryan Barnett <ryan.barnett@collins.com>
Date: Fri, 12 Mar 2021 13:51:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/bash: fix seventh patch
In-Reply-To: <20210312070803.768698-1-fontaine.fabrice@gmail.com>
References: <20210312070803.768698-1-fontaine.fabrice@gmail.com>
Message-ID: <CAMQcK5KJD-_76z2ztdyLd5Hj3tV2myJE-hk7q_PLT_EsFULR-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 12, 2021 at 1:11 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since bump to version 5.1 in commit
> 9e778b044c949d165207150cc9e79fdcfbafcb9d, seventh patch wrongly defines
> wcdequote_pathname as static which will result in the following build
> failure:
>
> smatch.c:(.text+0x22f0): undefined reference to `wcdequote_pathname'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/d83f5d260dccd38984ec6fdb340835ca928bb687
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-glob-fix-dequote_pathname-vs.-udequote_pathname.patch | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Thanks for the patch as the building of bash on master is currently broken...

Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Thanks,
-Ryan
