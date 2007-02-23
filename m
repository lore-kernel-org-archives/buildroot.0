From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 20:43:53 +0200
Subject: [Buildroot] zcat default
Message-ID: <45DF35E9.4060905@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

BR2_ZCAT defaults to zcat, and it is basically always used to extract 
files with .gz suffix. POSIX zcat [1] is specified to append .Z to 
filenames that don't already have such suffix. This is also the 
behaviour on Mac OS X. Therefore, it would make sense to use gunzip -c 
or gzip -dc as a default instead.

[1] http://www.opengroup.org/onlinepubs/000095399/utilities/zcat.html

-- Heikki Lindholm
