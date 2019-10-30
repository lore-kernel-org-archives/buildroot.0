From: lpdev at cordier.org <lpdev@cordier.org>
Date: Wed, 30 Oct 2019 18:45:24 +0100 (CET)
Subject: [Buildroot] systemd: /var/tmp missing from skeleton
Message-ID: <ea-mime-5db9cc34-d28-2ff4d362@www-2.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,



Just spotted an issue with the systemd package (note: I'm currently working on buildroot 2019.08.1 tag). Some services on my build are not started properly such as systemd-hostnamed.service, systemd-resolved.service and systemd-timesyncd.service.



Some debugging unveiled that all these services are depending on /var/tmp existence (they all have the "PrivateTmp=yes" in their unit). Without this folder on the target filesystem, services will return "Failed to run 'start' task: No such file or directory".



In order to fix that issue and submit a patch, I would like to be sure I did not miss a config in buildroot. I think the fix should take place in SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS located in package/skeleton-init-systemd.mk. Am I right?



Thanks,



Louis-Paul CORDIER


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191030/575935d3/attachment.html>
