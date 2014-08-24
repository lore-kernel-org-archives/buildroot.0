From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 24 Aug 2014 20:31:59 +0200
Subject: [Buildroot] [PATCH] package/infra: fix downloading versions
 with a slash
In-Reply-To: <CAAXf6LV5v9FebJY=H2mR71ZiUZCZMp43tg6ooDMmuGp8LWF6FQ@mail.gmail.com>
References: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LV5v9FebJY=H2mR71ZiUZCZMp43tg6ooDMmuGp8LWF6FQ@mail.gmail.com>
Message-ID: <CAAXf6LWKGZ1n0Unv9rtSx9t=tqFmN_WyjBf4Bx+QbTXbWymBZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 21, 2014 at 4:45 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Tue, Aug 19, 2014 at 7:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Since cset 54456cc (infra: consistently use double dollar signs...), it
>> is no longer possible to download versions with a slash in it, because
>> the _DL_VERSION variable is second-expanded, but the _VERSION variable
>> is immediately-expanded to have '/' substitued with '_'.
>>
>> So, _DL_VERSION is only expanded at the time it is evaluated, and by
>> that time, we've lost the slashes in _VERSION.
>>
>> Make the _DL_VERSION variables immediately-evaluated.
>>
>> Fixes:
>>     https://bugs.busybox.net/show_bug.cgi?id=7328
>>
>> Reported-by:  Vincent Stehl? <vincent.stehle@freescale.com>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc:  Vincent Stehl? <vincent.stehle@freescale.com>
>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> (tested by temporary setting DTC_VERSION to 'refs/tags/v1.4.0' as
> proposed in the bug report)
>

This patch should be applied to master, according to me.

Best regards,
Thomas
