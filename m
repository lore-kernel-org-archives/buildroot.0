From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 9 Mar 2015 12:08:48 -0400
Subject: [Buildroot] [PATCH] wpa_supplicant: install systemd service
	files
In-Reply-To: <20150304213345.6c41d0e8@free-electrons.com>
References: <1425411738-3369-1-git-send-email-mike@mikebwilliams.com>
 <20150304213345.6c41d0e8@free-electrons.com>
Message-ID: <CANPyyuP2hrGF=UwKEY=NbAZDmyXdaVzd_osYvncbZbM+12-vvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 4, 2015 at 3:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Tue,  3 Mar 2015 14:42:18 -0500, Mike Williams wrote:
>
>> +define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
>> +             $(TARGET_DIR)/lib/systemd/system
>
> When using -D, the destination should be a full path, otherwise your
> file will be named $(TARGET_DIR)/lib/systemd/system if
> $(TARGET_DIR)/lib/systemd/system isn't an existing directory.

Fixed in v2.

>
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
>> +             $(TARGET_DIR)/lib/systemd/system
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
>> +             $(TARGET_DIR)/lib/systemd/system
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
>> +             $(TARGET_DIR)/lib/systemd/system
>
> Also, and sorry for being so ignorant about systemd, but most of our
> other packages set up a bunch of symbolic links when install systemd
> unit files. I'm surprised to not see the same thing here. Can you give
> some details about this?

Those symlinks enable starting those services during boot. These
services shouldn't be enabled by default, so no symlinks are
generated.

As an aside, I commented on Gustavo's discussion of our packages
enabling startup by default in this thread:
http://lists.busybox.net/pipermail/buildroot/2015-March/121448.html

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
