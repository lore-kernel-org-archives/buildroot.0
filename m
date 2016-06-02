From: Jeroen Roovers <jer@airfi.aero>
Date: Thu, 2 Jun 2016 09:41:29 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160601232654.07800a9b@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
Message-ID: <CANCHnQpE9RGUXdVcRob_TjHX4pwfADdsrJ55ZiTs4NkL-UhQQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 June 2016 at 23:26, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>  5/ [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
>     http://patchwork.ozlabs.org/patch/581438/
>
>     U-Boot uses LDFLAGS directly with the linker, with fails if you
>     pass some -Wl,xyz options in BR2_TARGET_LDFLAGS. Do we care about
>     fixing this issue? On the other hand, the fix is easy.

I care about this. :)

It's useful to be able to globally use ld options like --as-needed,
and I found only uboot breaking (as it's the only package that
interprets LDFLAGS differently).

Alternatively, I could of course locally carry the patch indefinitely.

Kind regards,
     jer
