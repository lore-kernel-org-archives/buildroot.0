From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 13:21:19 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140703132119.014619c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 29 Jun 2014 21:35:37 +0200, Eric Le Bihan wrote:

> +SYSTEMD_CONF_ENV = \
> +	ac_cv_path_KMOD=/usr/bin/kmod

I just got a report from "nroach44" on IRC (Cc'ed to this e-mail) that
this chunk is actually also needed with systemd 213. From the IRC
discussions:

13:16 < NRoach44> kmod is being put in /usr/bin
13:17 < NRoach44> when systemd trys to run it from /bin
13:18 < kos_tom> with which version of systemd are you seeing this kmod issue?
13:18 < NRoach44> 213

So I obviously pointed "nroach44" to your 214 systemd bump patch, but I
believe that since the kmod issue exists with systemd 213, the chunk
above should probably be part of a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
