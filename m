From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:00:36 +0200
Subject: [Buildroot] [PATCH] package/util-linux: revert logic regarding
 pam_selinux module
In-Reply-To: <20190914170922.26874-1-unixmania@gmail.com>
References: <20190914170922.26874-1-unixmania@gmail.com>
Message-ID: <20190915160036.5a86509e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Sat, 14 Sep 2019 14:09:22 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Leave pam_selinux enabled by default in su.pam and remove it from the
> /etc/pam.d/su and /etc/pam.d/su-l files if libselinux is not selected.
> 
> This prevents leaving a misleading line, even commented, referencing a
> PAM module that does not exist.

Just to make sure I understand: the motivation for this patch is just
to avoid the pam_selinux.so lines that remain present (but commented)
in the file when SELinux support is disabled ?

I.e, it is just cosmetic, but functional, correct ?

(This is not a criticism of the proposal, just an attempt to make sure
I'm not missing the point.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
