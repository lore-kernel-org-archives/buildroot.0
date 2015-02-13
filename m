From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 13 Feb 2015 01:00:25 +0100
Subject: [Buildroot] getting X running
In-Reply-To: <XnsA43EE3D19F27FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <C860A811EEF34E4793E67D45FD390387@JohanW7>
 <XnsA43DB7FEFEB42berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <455E5DD938E3483BB9C2E4DC9C85E122@JohanW7>
 <XnsA43EE3D19F27FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <A589D7D52672493DA4222DA37CAEC69D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Bernd Kuhls
Verzonden: woensdag 11 februari 2015 22:24
Aan: buildroot at uclibc.org
Onderwerp: Re: [Buildroot] getting X running

"Sagaert Johan" <sagaert.johan@skynet.be> wrote in news:455E5DD938E3483BB9C2E4DC9C85E122 at JohanW7:

> I am not sore if I need to export anything else than DISPLAY=0.0

Hi,

what about this?

export DISPLAY=:0

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


Dear Bernd;


# export DISPLAY=:0
# X&
# gtk-demo

When starting X, the screen gets cleared.(splash boot image is cleared.)

Gtk-demo does not yield a warning any more with DISPLAY=:0, but noting happens..

After 3 minutes :
For a brief moment a white rectangle appears and then this error on the console.

(EE) Segmentation fault at address 0x0
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
Can't deallocate console 2 Device or resource busy
gtk-demo: Fatal IO error 2 (No such file or directory) on X server :0.
#

Seems X is bailing out for some reason.

I am not sure if I am missing some critical files in /etc
There are no files in /var/log that could give me any hints.

Kind Regards, Johan

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150213/71979575/attachment.bin>
