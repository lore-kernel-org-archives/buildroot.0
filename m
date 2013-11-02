From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Nov 2013 19:01:34 +0100
Subject: [Buildroot] [PATCHv2] dhcpcd: needs MMU
In-Reply-To: <1383400021-16905-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383400021-16905-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKJdu3KcA_LXtwpE_Mj=DdYFN9NFX1nB4qjorG4QSacpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/2 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> dhcpcd fails to build on non-MMU platforms, even with the
> --disable-fork option:
>
>   bind.o: In function `_daemonise':
>   bind.c:(.text+0x62): undefined reference to `_fork'
>   collect2: ld returned 1 exit status
>
> Therefore, we make dhcpcd depend on MMU support, and remove the
> non-MMU condition in the .mk file. More recent versions of dhcpcd do
> support non-MMU properly, but this commit intends to be only a fix.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/27da748b/attachment-0001.html>
