From: John Stile <john@stilen.com>
Date: Fri, 28 Jun 2013 17:47:16 -0700
Subject: [Buildroot] how does buildroot avoid requireing root?
Message-ID: <1372466836.28302.157.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am confused about how buildroot creates busybox.

There are notes that one must ensure that busybox setuid root.

Performing this operation must be performed as root:
   chown 0.0 /bin/busybox; chmod 4755 /bin/busybox

Yet when I use buildroot I never become root.

How does buildroot accomplish this?

In output/build/busybox-1.18.5 I see applets/install.sh calls:
  install -m 755 busybox $prefix/bin/busybox || exit 1

but I don't see how this becomes setuid?

On my embedded system, I see:
-rwsr-xr-x    1 root     root        605876 Jun 28  2013 /bin/busybox*
