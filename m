From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 16:35:06 -0700
Subject: [Buildroot] [PATCH v11 1/2] package/btrfs-progs: install to
	staging directory
In-Reply-To: <20160724234816.63c8bff9@free-electrons.com>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <20160724234816.63c8bff9@free-electrons.com>
Message-ID: <CA+h8R2oeq=eauq+jLQ01Js02zTcsQ7=bzQV7Xkb6cy+C1EtdMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 24, 2016 at 2:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> So it seems like a btrfs-progs patch is needed to make this whole thing
> work properly :-/

A few short term solutions are:

 - Remove btrfs support from docker-engine temporarily until a fix is
made to btrfs-progs
 - Source the headers from $(TARGET_DIR) as before temporarily,
resorting to bad practice
 - Copy the headers from $(TARGET_DIR) to $(STAGING_DIR) in a
post-build hook of btrfs-progs.

Would any of these options be acceptable to you?

Thanks!
Christian
