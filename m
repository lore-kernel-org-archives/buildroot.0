From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Nov 2013 18:59:50 +0100
Subject: [Buildroot] [PATCH 2/2] libcap: fix static link
In-Reply-To: <1383328047-28945-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383328047-28945-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+fX66CtsTjiM8KwgNDsz53QGKBH4Y2w8-e4xUtCEETCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> With BR2_PREFER_STATIC_LINK, libcap fails to build:
>
>
> http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/build-end.log
>
> This is due to the fact that it still tries to build a shared
> library. This commit fixes that by adding a patch that makes libcap
> provide install-shared/install-static targets. We also now only build
> the $(@D)/libcap subdirectory, so removing the build of the progs
> subdirectory is no longer needed.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/0359c586/attachment.html>
