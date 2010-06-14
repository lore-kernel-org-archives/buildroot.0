From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 14 Jun 2010 12:10:15 +0200
Subject: [Buildroot] PATCH [1/1] fix  building QT with uclibc 0.9.31
In-Reply-To: <87bpbef1un.fsf@macbook.be.48ers.dk>
Message-ID: <4E257B4130C8484E8CF9FF02387EAF61@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Peter

Did you build the JavaScriptCore and Multimedia module ?

I had a build error : pthread_getattr_np is not defined in uclibc,
there was a workaround for uclibc 0.9.30.x but not for 0.9.31.

Snippet from the patch.

 #if __UCLIBC_MAJOR__ == 0 && \
     (__UCLIBC_MINOR__ < 9 || \
-    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 30))
+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 31))
 #define UCLIBC_USE_PROC_SELF_MAPS 1
 #include <stdio_ext.h>

 

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: maandag 14 juni 2010 10:36
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: PATCH [1/1] fix building QT with uclibc 0.9.31

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> diff -rupN
buildroot-2010.05/package/qt/qt-4.6.2-pthread_getattr_np.patch

What does this fix? I've build qt-4.6.2 several times with uclibc 0.9.31 /
gcc 4.4.4 without problems?

--
Bye, Peter Korsgaard
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-4.6.2-pthread_getattr_np.patch
Type: application/octet-stream
Size: 3819 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100614/b970cfeb/attachment.obj>
