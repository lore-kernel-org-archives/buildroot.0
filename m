From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jul 2018 09:57:58 +0000
Subject: [Buildroot] [Bug 11141] WF111 package no longer availabe
In-Reply-To: <bug-11141-163@https.bugs.busybox.net/>
References: <bug-11141-163@https.bugs.busybox.net/>
Message-ID: <bug-11141-163-X0fHO85HTm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11141

--- Comment #2 from Geert <geert@my-clay.com> ---
Hello Peter,

First of all, thank you for your assistance. It is highly appreciated.

We are using the armv7-a variant, that is not availible on the Buildroot
sources:
/usr/bin/make -j1 O=/home/geert/buildroot/output HOSTCC="/usr/bin/gcc"
HOSTCXX="/usr/bin/g++" silentoldconfig
make[1]: Entering directory '/home/geert/buildroot'
make[1]: Leaving directory '/home/geert/buildroot'
>>> wf111 5-2-2-r3 Downloading
PATH="/home/geert/buildroot/output/host/bin:/home/geert/buildroot/output/host/sbin:/home/geert/bin:/home/geert/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/path/to/the/directory"
BR2_DL_DIR="/home/geert/buildroot/dl"
BUILD_DIR=/home/geert/buildroot/output/build O=/home/geert/buildroot/output
flock /home/geert/buildroot/dl/wf111/ support/download/dl-wrapper -c '5-2-2-r3'
-d '/home/geert/buildroot/dl/wf111' -D '/home/geert/buildroot/dl' -f
'wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz' -H 'package/wf111//wf111.hash' -n
'wf111-5-2-2-r3' -N 'wf111' -o
'/home/geert/buildroot/dl/wf111/wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz'  -u
https+https://www.silabs.com/documents/login/software -u
http\|urlencode+http://sources.buildroot.net/wf111 -u
http\|urlencode+http://sources.buildroot.net  -- 
--2018-07-10 11:50:50-- 
https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz
Resolving www.silabs.com (www.silabs.com)... 172.227.80.68
Connecting to www.silabs.com (www.silabs.com)|172.227.80.68|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-10 11:50:50 ERROR 404: Not Found.

--2018-07-10 11:50:50-- 
http://sources.buildroot.net/wf111/wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.167.48,
104.27.166.48, 2400:cb00:2048:1::681b:a630, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.167.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-10 11:50:51 ERROR 404: Not Found.

--2018-07-10 11:50:51-- 
http://sources.buildroot.net/wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48,
104.27.167.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-10 11:50:51 ERROR 404: Not Found.

package/pkg-generic.mk:135: recipe for target
'/home/geert/buildroot/output/build/wf111-5-2-2-r3/.stamp_downloaded' failed
make: *** [/home/geert/buildroot/output/build/wf111-5-2-2-r3/.stamp_downloaded]
Error 1

Further more silabs makes a mess with these releases. You are right that they
did not release a v4 for x86. 

Having the mechanism to protect against ARP broadcast messages (from 5.2.2-v4)
is a  pre for us.

Note that they did not only update the version number, but also the format...
from "wf111-linux-driver-5-2-2-r3-armv7-a.tar.gz"
to:  "wf111-linux-driver_5.2.2-r4_armv7-a.tar.gz" (dots between version and 2x
_)

There are the release notes from Silabs:
Changes: 5.2.2-r4 Compared to 5.2.2-r3
Date: May 21, 2018
Changes
? Added a mechanism to protect against a replayed ARP broadcast message. To
protect against Key Reinstallation Attacks (KRACK)
in a 4-way handshake, it is required to use at least wpa_supplicant v2.6 with
applied patches from https://w1.fi/security/2017-1/.
Limitations
? Same as in 5.2.2.
Known Issues
? Same as in 5.2.2.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
