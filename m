From: Daniel Bristot de Oliveira <daniel@bristot.eti.br>
Date: Sun, 05 Jul 2009 21:31:14 -0300
Subject: [Buildroot] /var/lock/subsys/nfslock: No such file or directory
Message-ID: <4A5145D2.1010206@bristot.eti.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I build the buildroot 2009.05 with the package "nfs-utils", and when the 
system boot, the init script show me "No such file or directory" to 
create the lock file.

----
Starting network management services: snmpd.
Starting NFS statd: touch: /var/lock/subsys/nfslock: No such file or 
directory
done
Starting NFS services: done
Starting NFS daemon: done
Starting NFS mountd: Cannot register service: RPC: Unable to receive; 
errno = Connection refused
done
touch: /var/lock/subsys/nfs: No such file or directory
---

To workaround I create the directory: /var/lock/subsys/ on $(TARGET_DIR).

Best regards
-- 
Daniel Bristot de Oliveira
http://bristot.eti.br
