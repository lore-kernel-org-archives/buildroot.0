From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Mon, 1 Nov 2010 12:04:51 +0200
Subject: [Buildroot] Wrong DST flag
Message-ID: <AANLkTi=0G-3NsBbb0gw9UcWhENKLhw-A0LWqjuweLfDG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've noticed that my target based on buildroot shows incorrect time.
The issue is caused by wrong DST flag. The `date +%Z` still shows that
it is summer time now but time supposed to be switched to standard
time on October 31 at 3 a.m. (according to Russian rules)

# cat /etc/TZ
MSK-3MSD
# date +%z
+0400
# date +%Z
MSD
# date
Mon Nov  1 13:55:09 MSD 2010

I'm using uClibc-0.9.31, busybox-1.17.0, buildroot-20100715.

-- 
Viktar Palstsiuk
