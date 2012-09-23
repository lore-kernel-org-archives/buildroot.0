From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 23 Sep 2012 13:13:26 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: fix dbus/udev
	configure problem
In-Reply-To: <87haqp9cmq.fsf@macbook.be.48ers.dk>
References: <1348399924-22924-1-git-send-email-spdawson@gmail.com>
 <87haqp9cmq.fsf@macbook.be.48ers.dk>
Message-ID: <CAHt8ZCOBJt3XD9O+kEu6uzO3eHvDt28LC2D83v31W9thX=M51Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay Peter; I'll reverse the logic then.

Simon.

On 23 September 2012 12:55, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
>
>  spdawson> From: Simon Dawson <spdawson@gmail.com>
>
>  spdawson> If both the dbus and udev packages are selected, then the
>  spdawson> configure step for the xserver_xorg-server package fails as
>  spdawson> follows.
>
>  spdawson>   configure: error: Hotplugging through both libudev and dbus/hal not allowed
>
>  spdawson> The configure script no longer allows both the
>  spdawson> --enable-config-dbus and --enable-config-udev options to be
>  spdawson> specified.
>
>  spdawson> This patch changes the xserver_xorg-server makefile to use
>  spdawson> dbus in preference to udev, when both are available.
>
> Thanks, but isn't udev the "preferred" backend nowadays? D-Bus defaults
> to no.
>
> --
> Bye, Peter Korsgaard
