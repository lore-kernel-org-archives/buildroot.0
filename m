From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 4 Dec 2012 10:10:25 +0100
Subject: [Buildroot] How to handle modularity in buildroot?
In-Reply-To: <201212041249.14541.manningc2@actrix.gen.nz>
References: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
 <201212041249.14541.manningc2@actrix.gen.nz>
Message-ID: <CAEYzJUE5qDZ5gnbymVtnLBVCXzUEiJjzK0tjbtm+0sU5yCUf-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 December 2012 00:49, Charles Manning <cdhmanning@gmail.com> wrote:
[...]
> I think that with defconfig, I would be able to make defconfig, then tweak the
> config to get a variant. But now if I change the base config, I then have to
> go through the process again for the variant.
>
> What I would like is the ability to have:
> * A base package
> * Production rootfs = base + production files.
> * Development rootfs = base  + development files.
>
> Then a change to the base package automatically flows through the production +
> development rootfs.
>
>
> Is there a way to accomplish that?

I don't know if it's possible to do that right now, but in principle
this is just a merge of a base config and an addon config. Say, if
there was an include directive in config files you'd be done. Maybe
you could try to create this merged config file by hand and see if
it's something that can be automated later?

1. make a (base) defconfig
2. make N new defconfigs with various extra options and call them addonN_config
3. remove the symbols found in the base config from all addonN_config files

Then, before the build, you do something like "cat base_config
addonN_config > config".

Best regards,
Bj?rn Forsman
