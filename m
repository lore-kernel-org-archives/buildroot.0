From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 28 Feb 2021 19:47:36 +0000
Subject: [Buildroot] [Bug 13466] creation of bridge interface via interfaces
 does not work
In-Reply-To: <bug-13466-163@https.bugs.busybox.net/>
References: <bug-13466-163@https.bugs.busybox.net/>
Message-ID: <bug-13466-163-uxYM7RqAky@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13466

--- Comment #2 from Frank Wunderlich <frank-w@public-files.de> ---
hi, i've added bridge-utils.sh and ifupdown.sh to /lib/bridge-utils (like it's
done in rules of package) including sylinks in /etc/network/if-pre-up.d and
if-post-down.d

# ls -l /lib/bridge-utils/                                                      
total 16                                                                        
-rwxr-xr-x    1 root     root          1621 Feb 18 14:57 bridge-utils.sh        
-rwxr-xr-x    1 root     root          5307 Feb 18 14:57 ifupdown.sh

# ls -l /etc/network/if-post-down.d/bridge                                      
lrwxrwxrwx    1 root     root            29 Feb 28 17:51
/etc/network/if-post-down.d/bridge -> /lib/bridge-utils/ifupdown.sh             
# ls -l /etc/network/if-pre-up.d/bridge                                         
lrwxrwxrwx    1 root     root            29 Feb 28 17:51
/etc/network/if-pre-up.d/bridge -> /lib/bridge-utils/ifupdown.sh                
# 

and added BR2_PACKAGE_IFUPDOWN to my config...

but it seems not working, i guess the hooks are not picked up by anything

-- 
You are receiving this mail because:
You are on the CC list for the bug.
