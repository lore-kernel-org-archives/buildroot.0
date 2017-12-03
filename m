From: Roy Arav <roy.arav@shieldiot.io>
Date: Sun, 3 Dec 2017 14:45:11 +0200
Subject: [Buildroot] Enabling AUDIT
Message-ID: <CAM27=5h9qxaXos3sTUOOxFr3MTQUwayK_eEciJkz7C=U1aBmWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to enable AUDIT on my system - buildroot image on Raspberry PI3.
The following packages are enabled: (attached the full .config)

BR2_PACKAGE_AUDIT
BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
BR2_PACKAGE_LIBCAP_NG

And yet I get the following output:

...
         Starting Security Auditing Service...
[   28.205145] auditd[241]: Error - audit support not in kernel
[   28.262083] augenrules[242]: /sbin/augenrules: No rules directory -
/etc/audit/rules.d
[   28.301784] auditd[241]: Cannot open netlink audit socket
[   28.342545] auditd[241]: The audit daemon is exiting.
[   28.382227] auditctl[246]: Error - audit support not in kernel
[   28.411173] auditctl[246]: file /etc/audit/audit.rules doesn't exist,
skipping
[FAILED] Failed to start Security Auditing Service.
See 'systemctl status auditd.service' for details.
...

Looking at netlink.c - I am not really sure that NETLINK_AUDIT is defined.
which is quite strange..


Thanks
Roy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171203/8d9bfffb/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot
Type: application/octet-stream
Size: 80969 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171203/8d9bfffb/attachment.obj>
