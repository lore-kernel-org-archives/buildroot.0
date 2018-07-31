From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 31 Jul 2018 11:17:40 -0400
Subject: [Buildroot] Random Linux/device tree/GPIO question posted to
 the wrong list...
In-Reply-To: <20180731161756.47cb4d72@windsurf>
References: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
 <20180730235109.0fe5f681@windsurf>
 <CAF_dkJAfeaGXejcOkUk8=WMfS6eNbqLjNYPZHaRU1wArb7_G6w@mail.gmail.com>
 <20180731161756.47cb4d72@windsurf>
Message-ID: <CAF_dkJBELK4AORdFC7dqCE2rF-f59KYCyZjLQAkx5nDG9r7jTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2018 at 10:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Asked internally, and my colleague Maxime Ripard (in Cc) gave some
> explanation about this: it depends on whether the pinctrl driver uses
> the strict mode or not and the Atmel doesn't.
>
> This allows to request a pin as a GPIO even if this pin is already
> muxed as a different functionality. Some details about this are
> available at "GPIO mode pitfalls" in
> https://www.kernel.org/doc/Documentation/driver-api/pinctl.rst (link
> also provided by Maxime).
Hmmm... I might try setting .strict = true in the Atmel driver and
seeing what blows up.  If nothing blows up (or even if it does), then
I'll try harder to understand the differences between the two modes
and the implication on the Atmel driver.

Thanks again.

--wpd
