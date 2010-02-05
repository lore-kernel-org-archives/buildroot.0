From: Tony Mozi <spooflinux@hotmail.fr>
Date: Fri, 5 Feb 2010 17:01:32 +0100
Subject: [Buildroot] remove 'buildroot login' for cross compilation
 linux for an ARM
In-Reply-To: <4d28d4b51002050238m99ac60ay2d2a0b42b90c4ce@mail.gmail.com>
References: <SNT129-W71192B9563D39A50DCE52B9540@phx.gbl>,
	<4d28d4b51002050238m99ac60ay2d2a0b42b90c4ce@mail.gmail.com>
Message-ID: <SNT129-W397AC20ABCC4B50BE11A7AB9540@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear,
It's ok but I don't understand really this modification?
Can you explan me?
Is it possible to modify the '/  #' by another thing when the linux start?
BR

Date: Fri, 5 Feb 2010 11:38:49 +0100
Subject: Re: [Buildroot] remove 'buildroot login' for cross compilation linux 	for an ARM
From: llandwerlin@gmail.com
To: spooflinux at hotmail.fr
CC: buildroot at uclibc.org

Something like that :

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index f77f969..44f78f2 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -21,7 +21,7 @@ target-generic-issue:

        echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
 target-generic-getty:
-       $(SED) '/# GENERIC_SERIAL$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \

+       $(SED) '/# GENERIC_SERIAL$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/bin/sh #~' \
                $(TARGET_DIR)/etc/inittab
 
 ifneq ($(TARGET_GENERIC_HOSTNAME),)



On Fri, Feb 5, 2010 at 11:31 AM, Tony Mozi <spooflinux@hotmail.fr> wrote:











Hi all,
I make the cross compilation of Linux-2.6.22.2 for an ARM9.
When I start my board, I have this message :

Welcome to Buildroot                                                            
buildroot login:


Concerning the login, it's root, but it's possible to remove this step? (to start the board whitout login).

BR
 		 	   		  
Vous cherchez l'int?grale des clips de Michael Jackson ? Bing ! Trouvez !


_______________________________________________

buildroot mailing list

buildroot at busybox.net

http://lists.busybox.net/mailman/listinfo/buildroot

 		 	   		  
_________________________________________________________________
Tchattez en direct en en vid?o avec vos amis !  
http://www.windowslive.fr/messenger/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100205/bbd58b53/attachment.htm>
