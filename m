From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 10 Dec 2016 22:11:35 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: remove uClibc
 (legacy) workaround
In-Reply-To: <20161210213129.701fdacf@free-electrons.com>
References: <1481385046-5643-1-git-send-email-romain.naour@gmail.com>
 <20161210213129.701fdacf@free-electrons.com>
Message-ID: <24ae3f96-a7b7-9a66-dba5-5f512b8736ad@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 10/12/2016 ? 21:31, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 10 Dec 2016 16:50:46 +0100, Romain Naour wrote:
>> Buildroot doesn't support uClibc (legacy) since 2016.02 release, so
>> this workaround is not needed anymore.
> 
> BR2_TOOLCHAIN_USES_UCLIBC=y when uClibc-ng is used, I'm sure you now
> that. Is this problem fixed in uClibc-ng? If so, it would be good to
> mention that in the commit log, because right now, the wording of the
> commit log is somewhat confusing in that regard.

This workaround was added for uClibc <= 0.9.33.2 by commit [1].
This issue has been fixed long time ago in uClibc-ng for powerpc, sparc and
xtensa [2].

Nowadays, enlightenment can't be selected for xtensa ans sparc due to luajit
dependency from the efl stack. So this part of enlightenment.mk is outdated.

Also, I think that the alsa-lib dependency could be reworked since there is a
--enable/disable-mixer option for alsa E module.

Ok, let me improve the commit log with these explanations :)

Best regards,
Romain

[1]
https://git.buildroot.net/buildroot/commit/?id=37acd25ee1376de5734415ac60be16991ee6d150

[2]
https://git.buildroot.net/buildroot/commit/?id=0b056944f5878304f51af3e9edb6d596f24fc370

> 
> Thanks,
> 
> Thomas
> 
