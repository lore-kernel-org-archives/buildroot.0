From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 15:43:07 +0100
Subject: [Buildroot] [PATCH 4/5] package: use <pkg>_CONFIG_SCRIPTS in
 packages that used special handling
In-Reply-To: <1360192218-30930-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360192218-30930-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLGofgEMvxikEWNV7sqZBLYoKxMiEzXE4mAaG+Yt55RbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/2/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> The packages changed by this commit were not only changing prefix= and
> exec_prefix= during their <foo>-config fixups, they were also changing
> includedir= and/or libdir=. So, they could not be directly converted
> to the new <pkg>_CONFIG_SCRIPTS infrastructure.
>
> However, a careful analysis of their default <foo>-config shows that
> includedir= and libdir= is defined relatively to either ${prefix} and
> ${exec_prefix}. Therefore, the manual fixing of includedir= and
> libdir= is useless, and fixing prefix= and exec_prefix=, as done by
> the <pkg>_CONFIG_SCRIPTS mechanism is sufficient.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


-- 
Samuel
