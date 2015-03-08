From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:52:13 +0100
Subject: [Buildroot] [PATCH 09/16] package/minidlna: improve systemd
 support
In-Reply-To: <1421684056-5266-10-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-10-git-send-email-maxtram95@gmail.com>
Message-ID: <20150308225213.79eb3468@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:09 +0200, Maxim Mikityanskiy wrote:
> Support running minidlna in system-wide mode using systemd:
> 
> 1. Set --with-db-path and --with-log-path configure options to make
> default minidlna directories comply with FHS.
> 
> 2. Install suitable minidlna.conf for system-wide mode.
> 
> 3. Install sysctl.d config file to increase inotify watches count.
> 
> 4. Install tmpfiles.d config file to mkdir and chmod necessary
> directories for minidlna running in system-wide mode.
> 
> 5. Install sysusers.d config file to create minidlna user when using
> systemd.
> 
> 6. Install minidlna.service for systemd.
> 
> Note: User=minidlna should be set in minidlna.service, not in
> minidlna.conf, because minidlna is unable to drop privileges correctly
> by itself: it does not get any privileges provided by groups of minidlna
> user. Systemd drops privileges correctly in that case.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

I applied another patch adding a systemd service file for minidlna.
Could you rebase this patch on top of the latest Buildroot Git tree?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
