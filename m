From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 31 Dec 2014 00:18:17 +0100
Subject: [Buildroot] [PATCH v2] dnsmasq: install DBus configuration file
In-Reply-To: <20141230224419.5288c872@free-electrons.com>
References: <1419972927-25825-1-git-send-email-yegorslists@googlemail.com>
 <20141230224419.5288c872@free-electrons.com>
Message-ID: <CAGm1_kuhs2U1RsvYV9D6qD6XxZEHUON_qE-ERsoj3ge8GaEt9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 30, 2014 at 10:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Tue, 30 Dec 2014 21:55:27 +0100, Yegor Yefremov wrote:
>
>> +ifeq ($(BR2_PACKAGE_DBUS),y)
>> +define DNSMASQ_INSTALL_DBUS
>> +     $(INSTALL) -D $(@D)/dbus/dnsmasq.conf \
>> +             $(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
>
> Sorry, should have said that on the previous iteration: please add -m
> 0644 to the $(INSTALL) invocation.

Should I apply these changes to wpa_supplicant too? I borrowed the code there.

Yegor
