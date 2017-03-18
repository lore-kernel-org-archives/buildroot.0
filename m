From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:27:05 +0100
Subject: [Buildroot] [PATCH 1/1] Fix permissions on /dev/pts/ptmx for
 PTY allocation with systemd
In-Reply-To: <35a6c994-5279-4823-8864-be52f6f925ef@cesnet.cz>
References: <35a6c994-5279-4823-8864-be52f6f925ef@cesnet.cz>
Message-ID: <20170318152705.711b8bea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Mar 2017 17:02:54 +0100, Jan Kundr?t wrote:
> (This is my first patch to buildroot, please feel free to pester me if you 
> prefer a different coding style or if you have some commit message 
> suggestions.)
> 
> Without this patch, it is not possible to allocate PTYs when a generated 
> rootfs image with a recent glibc and systemd is launched as a container  on 
> an RHEL7 system via machinectl/systemd-nspawn. The container boots, but 
> `machinectl login mycontainer` fails. The culprit is /dev/pts/ptmx with 
> 0000 perms.

Thanks a lot! I've applied your patch, after fixing the few issues
noticed by Arnout: adjusted the commit title, removed "personal"
comments from the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
