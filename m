From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 02:42:03 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <20150605205841.GB3641@free.fr>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605205841.GB3641@free.fr>
Message-ID: <20150606024203.6651cc1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 5 Jun 2015 22:58:41 +0200, Yann E. MORIN wrote:

> >  ifeq ($(BR2_TARGET_GRUB_SPLASH),)
> 
> I know this was pre-existing code, but we usually prefer positive logic.
> Do you think you might arrange to fix the logic in this test with
> anotehr patch? ;-)

Isn't that already positive logic?

"if BR2_TARGET_GRUB_SPLASH is disabled"

The other solution is:

ifneq ($(BR2_TARGET_GRUB_SPLASH),y)

which is "if not BR2_TARGET_GRUB_SPLASH is enabled"

which looks worse.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
