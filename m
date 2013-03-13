From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 20:38:28 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <84EA0F7435E5F64C9B660453645DB90497AE6FBC34@DSW350.wattens.swarovski.com>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
 <513FB6CF.1070301@mind.be>
 <84EA0F7435E5F64C9B660453645DB90497AE6FBC34@DSW350.wattens.swarovski.com>
Message-ID: <5140D5B4.3060903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 09:47, Spielmann Werner wrote:
> I'm using Ubuntu 10.04 LTS Server.
>
> You can find the output of the preprocessed code here:http://pastebin.com/XnT1wzLK

  OK, so neither HAVE_TERMIOS_H nor HAVE_TERMIO_H is defined by 
configure, while both should exist on an Ubuntu system with libc6-dev 
(and I think you need libc6-dev to build kconfig, so you must have it).

  Can you do a sanity check that /usr/include/termios.h exists? If it 
doesn't, your Ubuntu installation is broken. If it does, then something 
is going wrong in the configure script. Can you pastebin the config.log file?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
