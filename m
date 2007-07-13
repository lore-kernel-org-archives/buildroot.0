From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 13 Jul 2007 12:37:19 +0200
Subject: [Buildroot] [PATCH] Critical typo in /Makefile
In-Reply-To: <f0528b5b0707130259n6132e765x28010199a1552451@mail.gmail.com>
References: <f0528b5b0707130259n6132e765x28010199a1552451@mail.gmail.com>
Message-ID: <200707131237.19594.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 13 July 2007 11:59, Julien Letessier wrote:
> Unless I'm missing something, this is a type and it breaks everything
> (in particular by adding 2 spaces at the end of $(PROJECT))

Yep, I agree. In fact, the # ")) sequence is needed to fix syntax
hightlighting in at least vi.
Looks like we were not so quite close on the solution...

Thus the following should be better:

Index: Makefile
===================================================================
--- Makefile    (revision 19080)
+++ Makefile    (working copy)
@@ -156,9 +156,12 @@
 TARGETS:=uclibc
 endif

-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
+# "))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
+# "))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
+# "))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
