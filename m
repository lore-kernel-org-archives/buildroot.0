From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <nrubinstein@aldebaran.com>
Date: Mon, 19 Jan 2015 20:52:57 +0100
Subject: [Buildroot] [PATCH 3/3] docs/manual/beyond-buildroot: building and
	testing live-CDs
In-Reply-To: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <1421697177-12995-3-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 docs/manual/beyond-buildroot.txt | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index b8b1973..d5d7089 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -35,3 +35,29 @@ you should be aware of:
 
 * Buildroot does not currently provide +host-qemu+ and +binfmt+
   correctly built and set for that kind of use.
+
+==== Live-CD
+
+To build a live-CD image, enable _iso image_ in the _Filesystem images_ menu.
+(This works only on x86 and x86_64.)
+
+You can build a live-CD image with either ISOLINUX or Grub as a bootloader,
+but only ISOLINUX supports using this image with a live-USB drive.
+
+You can test your live-CD image using QEMU:
+
+-------------------
+qemu-system-i386 -cdrom output/images/rootfs.iso9660
+-------------------
+
+Or use it as a hard-drive image if it is an hybrid ISO:
+
+-------------------
+qemu-system-i386 -hda output/images/rootfs.iso9660
+-------------------
+
+It can be easily flashed to an USB drive with +dd+:
+
+-------------------
+dd if=output/images/rootfs.iso9660 of=/dev/sdb
+-------------------
-- 
2.1.4

Please ignore the below footer, which is of course irrelevant to this patch.

-- 




*This email and any attachment thereto are confidential and intended solely 
for the use of the individual or entity to whom they are addressed.If you 
are not the intended recipient, please be advised that disclosing, copying, 
distributing or taking any action in reliance on the contents of this email 
is strictly prohibited. In such case, please immediately advise the sender, 
and delete all copies and attachment from your system.This email shall not 
be construed and is not tantamount to an offer, an acceptance of offer, or 
an agreement by Aldebaran Robotics on any discussion or contractual 
document whatsoever. No employee or agent is authorized to represent or 
bind Aldebaran Robotics to third parties by email, or act on behalf of 
Aldebaran Robotics by email, without express written confirmation by 
Aldebaran Robotics? duly authorized representatives.*
------------------------------

*Ce message ?lectronique et ?ventuelles pi?ces jointes sont confidentiels, 
et exclusivement destin?s ? la personne ou l'entit? ? qui ils sont 
adress?s.*

*Si vous n'?tes pas le destinataire vis?, vous ?tes pri? de ne pas 
divulguer, copier, distribuer ou prendre toute d?cision sur la foi de ce 
message ?lectronique. Merci d'en aviser imm?diatement l'exp?diteur et de 
supprimer toutes les copies et ?ventuelles pi?ces jointes de votre syst?me.*

*Ce message ?lectronique n'?quivaut pas ? une offre, ? une acceptation 
d?offre, ou ? un accord d'Aldebaran Robotics sur toute discussion ou 
document contractuel quel qu?il soit, et ne peut ?tre interpr?t? comme tel. 
Aucun employ? ou agent d?Aldebaran Robotics n'est autoris? ? repr?senter ou 
? engager la soci?t? par email, ou ? agir au nom et pour le compte de la 
soci?t? par email, sans qu?une confirmation ?crite soit donn?e par le 
repr?sentant l?gal d?Aldebaran Robotics ou par toute autre personne ayant 
re?u d?l?gation de pouvoir appropri?e.*
