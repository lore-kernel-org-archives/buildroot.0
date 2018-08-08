From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 8 Aug 2018 15:51:37 -0400
Subject: [Buildroot] Setting BLUEZ5_UTILS_AUTORECONF=YES outside of
 bluez5_utls.mk
In-Reply-To: <CAF_dkJB_UGTGs+MU7Pco2ViXZg4at1-KHAbA8gUv2LKht2fgdg@mail.gmail.com>
References: <CAF_dkJB_UGTGs+MU7Pco2ViXZg4at1-KHAbA8gUv2LKht2fgdg@mail.gmail.com>
Message-ID: <CAF_dkJAeTBh8iC1Tmbrdojpd6avvbdFQT4M0J5cP706Z2Z9Wkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 7, 2018 at 3:52 PM I <wpdster@gmail.com> wrote:
> Is it possible to set BLUEZ5_UTILS_AUTORECONF=YES outside of bluez5_utils.mk?

I tried the following approach, and it worked.  I am curious to get
some feedback regarding this, or perhaps a better way to do this:

I have a custom package, FOO, with a foo.mk.  Inside foo.mk, I placed

ifeq ($(BR2_PACKAGE_FOO),y)
BLUEZ5_UTILS_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
endif

I will always include FOO in my build, so it seems that when I do
this, I will always force bluz5-utils to run its autoreconf.

Is there a better way I could do this?

--wpd
