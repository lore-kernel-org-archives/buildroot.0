From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 09:03:02 +0100
Subject: [Buildroot] [PATCH] wayland: disable on avr32
In-Reply-To: <CAAXf6LVJmTG0j1UqkeBbu0dY2j-1HFk+PZRuLkn7tNPd-Sic6Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 17 Nov 2013 09:01:25
 +0100")
References: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LVJmTG0j1UqkeBbu0dY2j-1HFk+PZRuLkn7tNPd-Sic6Q@mail.gmail.com>
Message-ID: <8761rrzc95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 >> bool "wayland"
 >> +       depends on !BR2_avr32 # wayland
 >> depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 >> select BR2_PACKAGE_WAYLAND
 >> help

 > It seems that several gstreamer plugins lack the necessary comments,
 > e.g. for thread support.

Yes. Do notice that gstreamer itself needs threads, so it doesn't really
matter much.

-- 
Bye, Peter Korsgaard
