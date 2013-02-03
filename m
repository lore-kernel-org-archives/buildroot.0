From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 00:12:42 +0100
Subject: [Buildroot] [PATCH] neard: fix missing nfc.h header
In-Reply-To: <1359898643-24467-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359898643-24467-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <510EEEEA.2040208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/13 14:37, Thomas Petazzoni wrote:
> ++#ifdef HAVE_LINUX_NFC_H
> + #include <linux/nfc.h>
> ++#else
> ++#include "../src/linux-nfc.h"
> ++#endif

  Wouldn't it be simpler to move the header to include/stub/linux/nfc.h 
and add include/stub to the include path?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
