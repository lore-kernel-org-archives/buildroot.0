From: Martin Bark <martin@barkynet.com>
Date: Mon, 7 Mar 2016 10:38:50 +0000
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix not installing to the
	target
In-Reply-To: <20160304212223.63aae6a5@free-electrons.com>
References: <1457111795-7214-1-git-send-email-martin@barkynet.com>
 <20160304212223.63aae6a5@free-electrons.com>
Message-ID: <CAFGQKxdDA8eJVamZYmubkij8JHh-8W+2YY-0o-p-G_FbSOWwqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 4 March 2016 at 20:22, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Martin Bark,
>
> On Fri,  4 Mar 2016 17:16:35 +0000, Martin Bark wrote:
>
>> -KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
>> -
>>  $(eval $(autotools-package))
>> +
>> +KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
>
> I know this solution is also used in the util-linux package, but in
> fact I don't really like it. Can you try using
>
> KBD_MAKE_ENV = \
>         MKINSTALLDIRS=...
>
> (before the eval of autotools-package) ?

I've made the change you suggested, see
http://patchwork.ozlabs.org/patch/592898/

Thanks

Martin

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
