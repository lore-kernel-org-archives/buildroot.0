From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Oct 2014 09:19:29 +0100
Subject: [Buildroot] postgreSQL in buildroot
In-Reply-To: <1414586764.228504684@f411.i.mail.ru>
References: <1414586764.228504684@f411.i.mail.ru>
Message-ID: <5451F491.70409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/10/14 13:46, ????????? ?????? wrote:
[snip]
> So, it seems, that postgreSQL works, and create database template with user
> postgres.

 If it works, what exactly is your problem?

 Just making a guess here: do you want this database template to appear in your
root filesystem when you do a 'make'? Then the easiest is to generate it once on
the target, like you did, and then copy it back to the rootfs overlay of your
buildroot setup (see the BR2_ROOTFS_OVERLAY option in the System configuration
menu). I'm not sure, but I guess everything should be in the /var/lib/postgresql
directory.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
