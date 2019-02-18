From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 18 Feb 2019 19:02:24 +0100
Subject: [Buildroot] Runtime test issues
In-Reply-To: <20190213222533.35cac79e@windsurf>
References: <20190213222533.35cac79e@windsurf>
Message-ID: <CAB0FRsticHy9FC5md08XVERv2rppQaXcU1yngQBcBvp++5L73g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 13 f?vr. 2019 ? 22:25, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello,
>
> Fran?ois, Ricardo, Yann: you are in Cc because some of the runtime test
> cases you added have some issues.
>
> Fran?ois, the following tests are failing:
>
>  - tests.package.test_perl_dbd_mysql.TestPerlDBDmysql
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295305
>
>  - tests.package.test_prosody.TestProsodyLuajit
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295315
>
>  - tests.package.test_prosody.TestProsodyLua51
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314
>
>
The problem with prosody comes from LuaExpat, see
https://github.com/tomasguisasola/luaexpat/issues/3
I will send a patch soon.

Fran?ois

Ricardo, the following test is failing:
>
>  - tests.download.test_git.TestGitRefs
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269
>
> Yann, the following tests are failing:
>
>  - tests.init.test_systemd.TestInitSystemSystemdRoFull
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295290
>
>  - tests.init.test_systemd.TestInitSystemSystemdRwFull
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295293
>
>  - tests.init.test_systemd.TestInitSystemSystemdRoNetworkd
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295292
>
>  - tests.init.test_systemd.TestInitSystemSystemdRwNetworkd
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295295
>
> Could you have a look at those test failures ?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190218/51533b6a/attachment.html>
