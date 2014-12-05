From: =?iso-8859-1?Q?C=E9dric?= HEYMAN <c.heyman@til-technologies.fr>
Date: Fri, 05 Dec 2014 13:11:12 +0100
Subject: [Buildroot] Float error on SAMA5D3 Xplained using nodejs
Message-ID: <WC20141205121112.0100A6@til-technologies.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Trying to use nodejs's npm (built with buildroot 2014.11) on SAMA5D3 
Xplained returns following error : 'ERROR: Binary compiled with 
-mfloat-abi=hard but without -DUSE_EABI_HARDFLOAT'

Looking in nodejs.mk shows that : 
'....
NODEJS_CPU = arm
# V8 needs to know what floating point ABI the target is using.  There's 
also
# a 'hard' option which we're not exposing here at the moment, because
# buildroot itself doesn't really support it at present.
ifeq ($(BR2_SOFT_FLOAT),y)
NODEJS_ARM_FP = soft
else
NODEJS_ARM_FP = softfp
endif
....'

It seems there is no support for 'hard' floating point for now.

To solve that, I intend to force '-DUSE_EABI_HARDFLOAT' in nodejs 
compilation package, but I don't know the way to do that; any advice ?

Another way to solve the problem could be to use 'soft' or 'softfp' floating 
point strategy but menuconfig does not propose this tuning, maybe...

Regards,
  	
C?dric HEYMAN
Ing?nieur en D?veloppement embarqu?

T?l : 04.42.37.17.10| Fax : 04.42.24.28.98
Si?ge social : 350 rue de la Lauzi?re - Parc du Golf B?t 43 - CS 60481 - 
13592 AIX-EN-PROVENCE CEDEX 3



<font face="Tahoma" size="1" color="#575F5E">
<a href="http://www.til-technologies.fr/bandeau_signature/redirection.html" target="_blank">
<img src="http://www.til-technologies.fr/bandeau_signature/bandeau.jpg" width="600" height="80" border="0" alt="Plus d'actualit?s sur www.til-technologies.fr" />
</a>
<br>
Les informations pr?c?dentes peuvent ?tre confidentielles ou privil?gi?es. Si vous n'?tes pas le destinataire pr?vu de ce mail, veuillez en notifier l'exp?diteur en r?pondant ? ce message puis supprimez-en toute trace de vos syst?mes.
</font>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141205/3bd701ab/attachment.html>
