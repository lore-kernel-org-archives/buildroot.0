From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 16:14:55 +0200
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <573DC881.2030409@zacarias.com.ar>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
 <20160519160603.3debab78@free-electrons.com>
 <573DC881.2030409@zacarias.com.ar>
Message-ID: <20160519161455.2bacf98f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 11:06:57 -0300, Gustavo Zacarias wrote:

> Not right now since 4.6 is in -next, however it will if the stable 
> headers are bumped to 4.5.5.

Well, your patch 1/2 does:

-	default "4.4.10"	if BR2_KERNEL_HEADERS_4_4
-	default "4.5.4"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.11"	if BR2_KERNEL_HEADERS_4_4
+	default "4.5.5"		if BR2_KERNEL_HEADERS_4_5

So it should fix the thing, right?

However, it means I'd have to rebuild once again the Buildroot external
toolchains, at least the ones that use 4.5 kernel headers, right?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
