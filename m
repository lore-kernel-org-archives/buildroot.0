From: =?UTF-8?Q?No=C3=A9_Rubinstein?= <noe.rubinstein@gmail.com>
Date: Thu, 30 Jul 2015 16:56:34 +0200
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: fix hybrid image support
In-Reply-To: <20150730165052.1eea5a29@free-electrons.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
 <20150730165052.1eea5a29@free-electrons.com>
Message-ID: <CAOccFZCnm3yrooc7uwiAphQz9SEzFtmMkUwCyv3z6EY_OknRSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 30, 2015 at 4:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Can you resubmit with the && thing ? It is not needed: make will
> abort automatically if genisoimage fails.

The issue is syntactic: ROOTFS_ISO9660_CMD is used in this line in common.mk:

    echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)

Therefore it can not contain any newline. This would be fixed by using
the file function in GNU make
<https://www.gnu.org/software/make/manual/html_node/File-Function.html>
but it would not work with GNU make 3.81.
-- 
No? Rubinstein.
