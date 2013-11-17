From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Nov 2013 09:04:53 +0100
Subject: [Buildroot] [PATCH] wayland: disable on avr32
In-Reply-To: <8761rrzc95.fsf@dell.be.48ers.dk>
References: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LVJmTG0j1UqkeBbu0dY2j-1HFk+PZRuLkn7tNPd-Sic6Q@mail.gmail.com>
 <8761rrzc95.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWaKmnX3H4BxJSR2JkoV35H-NLkQ8NMffmaz5etsfTFxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 17, 2013 at 9:03 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  >> config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
>  >> bool "wayland"
>  >> +       depends on !BR2_avr32 # wayland
>  >> depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
>  >> select BR2_PACKAGE_WAYLAND
>  >> help
>
>  > It seems that several gstreamer plugins lack the necessary comments,
>  > e.g. for thread support.
>
> Yes. Do notice that gstreamer itself needs threads, so it doesn't really
> matter much.

This then boils down to the question whether we replicate the
dependencies/and comments in such case or not. There is another thread
where this action was asked, I'll bump it in a second, then we can
have the discussion there...

Best regards,
Thomas
