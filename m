From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 00:58:40 +0000 (UTC)
Subject: [Buildroot] [Bug 71] ./wchar.h:41:12: error: empty filename in
	#include
In-Reply-To: <bug-71-163@https.bugs.busybox.net/>
References: <bug-71-163@https.bugs.busybox.net/>
Message-ID: <20090304005840.5B9E976462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71





--- Comment #2 from Paul Jones <paul.jones@iwtech.com.au>  2009-03-04 00:58:39 UTC ---
Created an attachment (id=101)
 --> (https://bugs.busybox.net/attachment.cgi?id=101)
.config from menuconfig

wchar.h is as follows:


#ifndef _GL_WCHAR_H
#define _GL_WCHAR_H

/* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
   <wchar.h>.
   BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
   included before <wchar.h>.  */
#include <stddef.h>
#include <stdio.h>
#include <time.h>

/* Include the original <wchar.h>.  */
#include ""

#endif /* _GL_WCHAR_H */


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
