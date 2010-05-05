From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 5 May 2010 22:51:06 +0000 (UTC)
Subject: [Buildroot] [PATCH] customize: fix copy paths
References: <1273097819-8002-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <hrssoq$a34$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-05, luca at lucaceresoli.net <luca@lucaceresoli.net> wrote:

> From: Luca Ceresoli <luca@lucaceresoli.net>
>
> customize.mk used to copy files with a wrong command, resulting in one
> directory level in excess. For example, source/etc/myfile would have
> produced /etc/etc/myfile in the target filesystem instead of /etc/myfile.

Yup:

  https://bugs.busybox.net/show_bug.cgi?id=849
  https://bugs.busybox.net/show_bug.cgi?id=1135

-- 
Grant Edwards               grant.b.edwards        Yow! Thank god!! ... It's
                                  at               HENNY YOUNGMAN!!
                              gmail.com            
