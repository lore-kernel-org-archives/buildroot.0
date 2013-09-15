From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 21:16:47 +0200
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
 <20130915205310.06f8af50@skate>
 <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
Message-ID: <20130915211647.6354ea34@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 15 Sep 2013 15:08:28 -0400, Danomi Manchego wrote:

> That does appeal to me; I think that we can combine the cp and the sed
> lines as well ...
> 
>          $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/'
> $(UBINIZE_CONFIG_FILE_PATH)  >  $(BUILD_DIR)/ubinize.cfg

That won't work. $(SED) expands to sed -e -i, i.e it does the sed
in-place.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
