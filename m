From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Dec 2017 18:33:43 +0100
Subject: [Buildroot] Enabling AUDIT
In-Reply-To: <CAM27=5h9qxaXos3sTUOOxFr3MTQUwayK_eEciJkz7C=U1aBmWQ@mail.gmail.com>
References: <CAM27=5h9qxaXos3sTUOOxFr3MTQUwayK_eEciJkz7C=U1aBmWQ@mail.gmail.com>
Message-ID: <b0b53c2e-32ec-bf5b-42d0-b85426ee80a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-12-17 13:45, Roy Arav wrote:
> Hi,
> 
> I am trying to enable AUDIT on my system - buildroot image on Raspberry PI3.
> The following packages are enabled: (attached the full .config)
> 
> BR2_PACKAGE_AUDIT
> BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
> BR2_PACKAGE_LIBCAP_NG
> 
> And yet I get the following output:
> 
> ...
> ? ? ? ? ?Starting Security Auditing Service...
> [? ?28.205145] auditd[241]: Error - audit support not in kernel

 Just to be sure: do you have AUDIT enabled in your kernel config?

 Regards,
 Arnout

> [? ?28.262083] augenrules[242]: /sbin/augenrules: No rules directory -
> /etc/audit/rules.d
> [? ?28.301784] auditd[241]: Cannot open netlink audit socket
> [? ?28.342545] auditd[241]: The audit daemon is exiting.
> [? ?28.382227] auditctl[246]: Error - audit support not in kernel
> [? ?28.411173] auditctl[246]: file /etc/audit/audit.rules doesn't exist, skipping
> [FAILED] Failed to start Security Auditing Service.
> See 'systemctl status auditd.service' for details.
> ...
> 
> Looking at netlink.c - I am not really sure that?NETLINK_AUDIT is defined.
> which is quite strange..
> 
> 
> Thanks
> Roy
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
