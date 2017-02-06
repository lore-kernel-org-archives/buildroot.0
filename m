From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 6 Feb 2017 18:19:16 +0000 (UTC)
Subject: [Buildroot] Odd comment in openntpd/Config.in
References: <o7aan0$qvb$1@blaine.gmane.org>
 <20170206181317.i3gc4336rm7u2lkd@tarshish>
Message-ID: <o7aen3$mj0$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-06, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Grant,
>
> On Mon, Feb 06, 2017 at 05:10:56PM +0000, Grant Edwards wrote:
>> In https://git.busybox.net/buildroot/tree/package/openntpd/Config.in:
>> 
>> config BR2_PACKAGE_OPENNTPD
>>        bool "openntpd"
>>        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>        [...]
>> 
>> comment "openntpd needs a toolchain w/ NPTL"
>>         [...]
>>         depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>> 
>> Is the "!" in the comment is a typo?
>
> We want to show the comment only when the toolchain has no NPTL support. So 
> the "!" makes perfect sense to me.

Ah.  That's because you didn't misread it and think that the "depends
on" line was part of the comment itself and not the option that
controls when the comment is displayed.

-- 
Grant Edwards               grant.b.edwards        Yow! Psychoanalysis??
                                  at               I thought this was a nude
                              gmail.com            rap session!!!
