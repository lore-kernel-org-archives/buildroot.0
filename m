From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Tue, 6 Mar 2012 10:16:37 +0000
Subject: [Buildroot] [PATCH] backend/pixma_bjnp: Replace index() with
 strchr()
In-Reply-To: <4F54DF86.7000504@imgtec.com>
References: <4F54DF86.7000504@imgtec.com>
Message-ID: <4F55E405.8040606@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2012 03:45 PM, Markos Chandras wrote:

> Hi,
> 
> This patch replaces the obsolete index() function with strchr() in
> sane-backends code. I have also filed a bug upstream
> 
> https://alioth.debian.org/tracker/index.php?func=detail&aid=313563&group_id=30186&atid=410366
> 
> I don't know if you want to include this patch on buildroot before
> upstream does, but it may be useful for people wondering why
> sane-backend does not build on certain systems. The index() and rindex()
> functions are only exported if uClibc is configured with
> UCLIBC_SUSV3_LEGACY_MACROS. This problem has also been discussed in the
> past:
> 
> http://lists.busybox.net/pipermail/buildroot/2007-June/015201.html
> 

This patch is now in sane-backends git repository

http://anonscm.debian.org/gitweb/?p=sane/sane-backends.git;a=commitdiff;h=66fb96d9ad04a901824a0ab14269b525fbbbf7c4

-- 
markos
