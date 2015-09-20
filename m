From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Sun, 20 Sep 2015 22:43:54 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <20150920151157.7dc9b021@free-electrons.com>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <20150920151157.7dc9b021@free-electrons.com>
Message-ID: <55FF1A8A.5030507@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout, and all,

Le 20/09/2015 15:11, Thomas Petazzoni a ?crit :
> Following the discussion you had with Arnout, and your own report that
> this patch was breaking things in the Busybox and Linux kernel build, I
> marked this patch as "Changes Requested" in patchwork.
>
> Will you work on a new iteration of this patch?

Yes, I've started to work on a new iteration. It is working fine with 
CMake, autotools, and Kbuild packages (I keep on exporting 
KBUILD_VERBOSE as suggested by Arnout).

I still have to:

- modify qt.mk because it currently enables verbose mode if VERBOSE is 
defined and not empty, but my modification implies that VERBOSE may be 
equal to 0, and it should not enable verbose mode in that case!...
- check that no other package .mk file is using VERBOSE variable.
- write clear comments and commit message.

Sorry for the delay, but I've got only very occasional free time to 
spend on it.


-- 
C?dric
