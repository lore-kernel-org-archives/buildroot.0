From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed, 7 Mar 2018 21:50:38 +0100
Subject: [Buildroot] [PATCH v5 1/4] imx-mkimage: new package
In-Reply-To: <20180307211859.60ebace3@windsurf>
References: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520448738-5794-2-git-send-email-karl.erik.larsson@gmail.com>
 <20180307211859.60ebace3@windsurf>
Message-ID: <CAPP7BN3H6ct7pg7nVgSV1ZnZtficqxD3wDKKZ_cvfZCmCuK0Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-07 21:18 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Wed,  7 Mar 2018 19:52:15 +0100, Erik Larsson wrote:
>> This package add support for imx-mkimage for iMX8M.
>> Currently the only hardware it's tested for.
>>
>> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
>> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
>
> For the record, I already expressed my dislike of this host package
> depending on uboot, linux, and generating images in BINARIES_DIR, and I
> still dislike this approach.
>
> So I am not in favor of applying this patch as it is proposed today.

Yes, I know. But I didn't get any response on my reply. But maybe a
simple misunderstanding from my side, sorry I'm a newbie here.
But as I wrote in my replay the first version did contain a solution
were imx-mkimage package just built mkimage_imx8 tool and installed
it, together with mkimage_fit_atf.sh, into host binaries. See
http://lists.busybox.net/pipermail/buildroot/2018-February/213976.html.

The first version also contained a post-script,
http://lists.busybox.net/pipermail/buildroot/2018-February/213978.html,
which uses mkimage_imx8 and mkimage_fit_atf.sh together with some
other tools. I just realized that I need to double check that PATH
variable so corrty objcopy is used.

Please advice me in which solution is the best.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Best regards,
Erik
