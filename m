From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 09:47:12 +0200
Subject: [Buildroot] [PATCH v11 1/2] package/btrfs-progs: install to
 staging directory
In-Reply-To: <CA+h8R2oeq=eauq+jLQ01Js02zTcsQ7=bzQV7Xkb6cy+C1EtdMQ@mail.gmail.com>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <20160724234816.63c8bff9@free-electrons.com>
 <CA+h8R2oeq=eauq+jLQ01Js02zTcsQ7=bzQV7Xkb6cy+C1EtdMQ@mail.gmail.com>
Message-ID: <20160725094712.33146612@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:35:06 -0700, Christian Stewart wrote:

>  - Remove btrfs support from docker-engine temporarily until a fix is
> made to btrfs-progs
>  - Source the headers from $(TARGET_DIR) as before temporarily,
> resorting to bad practice
>  - Copy the headers from $(TARGET_DIR) to $(STAGING_DIR) in a
> post-build hook of btrfs-progs.
> 
> Would any of these options be acceptable to you?

Not really no. The good solution is:

 - Patch the btrfs-progs Makefile to support installing the headers and
   static library

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
