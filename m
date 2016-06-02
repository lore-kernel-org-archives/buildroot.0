From: Jeroen Roovers <jer@airfi.aero>
Date: Thu, 2 Jun 2016 10:24:05 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160602094927.73566578@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <CANCHnQpE9RGUXdVcRob_TjHX4pwfADdsrJ55ZiTs4NkL-UhQQA@mail.gmail.com>
 <20160602094927.73566578@free-electrons.com>
Message-ID: <CANCHnQrOrwNKnhswMO9Et3FFqOFXLem6rp12B+HWRRPOxC6bvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 June 2016 at 09:49, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> What bothers me a bit is that LDFLAGS are not supposed to be passed to
> "ld" directly, but to "gcc". So essentially, we are working-around a
> bug in U-Boot. Though I agree that the workaround is not too big or
> horrible.
>
> But have you tried reporting this problem to upstream U-Boot, and see
> what they say?

No, I did not, because uboot interprets LDFLAGS as linker flags
instead of compiler flags all over the place, so in buildroot the
patch is almost trivial whereas replacing all the linker flags in
uboot with compiler flags would not be. Also, the name of the variable
isn't a bug in uboot per se; GNU make interprets LDFLAGS as compiler
flags but there is nothing canonical about that and uboot obviously
overrides the implicit variable everywhere.


Kind regards,
      jer
