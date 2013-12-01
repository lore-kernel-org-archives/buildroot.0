From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Dec 2013 23:29:11 +0100
Subject: [Buildroot] [PATCH 1/1] inadyn: remove the source variable and
	fix download URL
In-Reply-To: <1385935685-6966-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Sun, 1 Dec 2013 23:08:05 +0100")
References: <1385935685-6966-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <874n6surwo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Github seems to provide only ziped and gziped files.
 > $ file inadyn-1.98.1.tar.bz2
 > inadyn-1.98.1.tar.bz2: gzip compressed data, from Unix

Hm, that's now what I'm seeing here:

>>> inadyn 1.98.1 Downloading
--2013-12-01 23:18:31--  https://github.com/downloads/troglobit/inadyn/inadyn-1.98.1.tar.bz2
Resolving github.com (github.com)... 192.30.252.131
Connecting to github.com (github.com)|192.30.252.131|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://cloud.github.com/downloads/troglobit/inadyn/inadyn-1.98.1.tar.bz2 [following]
--2013-12-01 23:18:32--  http://cloud.github.com/downloads/troglobit/inadyn/inadyn-1.98.1.tar.bz2
Resolving cloud.github.com (cloud.github.com)... 54.230.130.23, 54.230.131.183, 54.240.184.13, ...
Connecting to cloud.github.com (cloud.github.com)|54.230.130.23|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 51409 (50K) [.bz2]
Saving to: `/home/peko/source/buildroot/dl/inadyn-1.98.1.tar.bz2.tmp'

100%[======================================>] 51,409      48.8K/s   in 1.0s

2013-12-01 23:18:34 (48.8 KB/s) - `/home/peko/source/buildroot/dl/inadyn-1.98.1.tar.bz2.tmp' saved [51409/51409]

>>> inadyn 1.98.1 Extracting
bzcat /home/peko/source/buildroot/dl/inadyn-1.98.1.tar.bz2 | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/inadyn-1.98.1  -xf -
>>> inadyn 1.98.1 Patching

file dl/inadyn-1.98.1.tar.bz2
dl/inadyn-1.98.1.tar.bz2: bzip2 compressed data, block size = 900k

-- 
Bye, Peter Korsgaard
