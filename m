From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Fri, 5 Jul 2019 16:11:03 +0200
Subject: [Buildroot] [Question]: Using openresolv with udhcpc?
Message-ID: <CABhNV21PKmbijs74jBOGXF=igujdxYmh_toK7imeq+GDxNnKuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I just discovered openresolv, and I'm trying to get resolvconf to work
with udhcpc

Has anyone done that? What is the recommended approach?
This silly little thing seems to work, if I also add resolvconf scripts to
/etc/network/if-up.d and /etc/network/if-down.d/

$ head -20   /usr/share/udhcpc/default.script.d/resolvconf
#!/bin/bash

# Make udhcpc changes to resolv.conf readable for resolvconf

[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
RESOLV_DIR=/var/run/resolvconf/interfaces/

case "$1" in
    renew|bound)
        mkdir -p $RESOLV_DIR
        grep $interface /etc/resolv.conf | sed -e "s/#.*//"   >
$RESOLV_DIR/$interface.udhcpc
        ;;
esac

exit 0
-- 
Regards
Einar J?n
