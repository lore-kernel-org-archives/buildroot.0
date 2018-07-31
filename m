From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 31 Jul 2018 09:53:34 -0400
Subject: [Buildroot] Random Linux/device tree/GPIO question posted to
 the wrong list...
In-Reply-To: <20180730235109.0fe5f681@windsurf>
References: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
 <20180730235109.0fe5f681@windsurf>
Message-ID: <CAF_dkJAfeaGXejcOkUk8=WMfS6eNbqLjNYPZHaRU1wArb7_G6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2018 at 5:51 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Patrick,
>
> This snippet of Device Tree only declares a pinmux configuration. If
> there is nothing referencing pinctrl_nand_default, then this pinmux
> configuration is not used/applied, and the pins are not "reserved".
>
Hi Thomas,
Thank you for the quick reply.  pinctrl_nand_default _is_ referenced
by the device tree clause for the nand controller:

        nand0: nand at 80000000 {
            nand-bus-width = <8>;
            nand-ecc-mode = "hw";
            nand-on-flash-bbt;
            atmel,has-pmecc;
            atmel,pmecc-cap = <12>;
            atmel,pmecc-sector-size = <512>;
            pinctrl-names = "default";
            pinctrl-0 = <&pinctrl_nand_default &pinctrl_nand_rdy_en>;
            status = "okay";
...

Hence my confusion.  Am I missing something else somewhere?

--wpd
