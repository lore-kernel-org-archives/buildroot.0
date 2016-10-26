From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 26 Oct 2016 10:00:26 +0200
Subject: [Buildroot] [PATCH 1/1] perl: update config.{sub,
 guess} using autotools hook
In-Reply-To: <20161025233652.46faa126@free-electrons.com>
References: <1477430469-17537-1-git-send-email-nunes.erico@gmail.com>
 <20161025233652.46faa126@free-electrons.com>
Message-ID: <CAB0FRst3D_BVVXOPfunCfL8BSMxK=e0prmf7B0yrbwVie0T-GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-10-25 23:36 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Tue, 25 Oct 2016 23:21:09 +0200, Erico Nunes wrote:
>> perl may fail to build on newer host architectures such as aarch64 due
>> to its inability to guess the host architecture to build 'miniperl',
>> which is built during the process. An error message looks like this:
>>
>>   Configuring build-time miniperl for unknown
>>   ERROR: No $target defined (?!)
>>   ERROR: configure --mode=buildmini failed
>>
>> This happens because the config.sub and config.guess files from perl are
>> not modified and may become outdated.
>> These files are normally updated automatically by a Buildroot hook for
>> autotools packages, to avoid problems like these.
>> Although perl uses the config.sub and config.guess files, it is not a
>> strict autotools package, so it is not defined as an "autotools-package"
>> in Buildroot and so it doesn't inherit the hook.
>> This commit makes perl borrow the hook from the autotools infrastructure
>> so that it can build on newer build architectures.
>> This has been tested by building it on an aarch64 host machine.
>>
>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>
> Please use the get-developers script when sending patches, so that the
> appropriate developers are CC'ed. In this case, Fran?ois should have
> been CC'ed.
>
> Fran?ois, can you have a look at Erico's patch? See
> https://patchwork.ozlabs.org/patch/686713/.
>

This hook updates `cnf/config.sub` and `cnf/config.guess`, 2 files
which come from perl-cross (not from perl).
So, the title of the patch could be improved by :
    [1/1] perl: update cnf/config.{sub, guess} using autotools hook

Acked-by: Francois Perrad <francois.perrad@gadz.org>

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
