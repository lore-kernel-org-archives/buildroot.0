From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Fri, 13 Nov 2020 11:10:44 -0600
Subject: [Buildroot] Proper Out-of-tree Devicetree Source
In-Reply-To: <298f9cd98b159b2020a96e4473c367ba959f6cf4.camel@calian.com>
References: <CAE_FxYsuX33=WuESanaB01YkD_DU=z+Q1hYr=Tp0kiXgHGtt4Q@mail.gmail.com>
 <CA+fik51jHvB4POdaGEJ+Ru2K6Yt1xmepibr3WGUaGQAYkiG55g@mail.gmail.com>
 <298f9cd98b159b2020a96e4473c367ba959f6cf4.camel@calian.com>
Message-ID: <CA+fik53EkrGWWcOCU3oWDL2bkxKes_euHoek35mCvv=DCWkWpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 12, 2020 at 4:28 PM Robert Hancock
<robert.hancock@calian.com> wrote:
>
> In general U-Boot needs some level of board-specific support for things
> like memory initialization, so I believe usually one would patch U-Boot
> to add in that support and the reference to that board's .dts files at
> the same time.
>
> Specifying a custom .dts for Linux makes more sense as the kernel build
> itself can be generic, but there is not really such a thing as a
> generic U-Boot build across boards unless they are very similar.
>

At least in our case they are very similar. We have a platform based
on the ZynqMP SoC, and the U-Boot ZynqMP code is almost all common,
configuration is handled by U-Boot KConfig, U-Boot env file, and
Xilinx's ps7/psu init. The only thing I am patching onto U-Boot is the
dts.

Buildroot already has an option to copy the dts into U-Boot. And we do
that as the dts uses the common zynqmp dtsi from U-Boot. Adding
support to build the dts is the only missing piece for us to not need
to patch U-Boot.
