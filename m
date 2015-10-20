From: Gorka Lertxundi <glertxundi@gmail.com>
Date: Tue, 20 Oct 2015 15:30:19 +0200
Subject: [Buildroot] Absolute build paths in rootfs tarball
Message-ID: <CAJCNcEZNAu0pU3pCAhpcKv-a9VqZHG7wg3W+Ko089nVGZhuWjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm experiencing a weird issue, probably because a) i'm new to busybox & b)
i'm doing it wrong. But here it is:

- Using buildroot 2015.08.1.
- I created an external toolchain using crosstool-ng.
- Building it in Travis CI.
- For now, testing my first full-packaged buildroot-based image with mono.

Everything builds up correctly except for one thing, it seems like when
buildroot wants to use the full path it uses the host-based absolute path
(builder path), and not the rootfs-based one.

Probably using this use-case it's much easier to explain:

- Travis CI builds everything in /home/travis
- After everything is built, rootfs.tar contains a mono configuration file
in /etc/mono/config which has references to custom native dll libraries.
- I expect this file would contain relative paths (but that's another
thing) but some of them use an absolute path like this:
  - <dllmap dll="MonoPosixHelper"
target="/home/travis/buildroot/output/host/usr/lib/libMonoPosixHelper.so"
os="!windows" />

Do you known how could I avoid this behaviour, and use rootfs-based
relative paths?

Thanks in advance,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151020/95859ee6/attachment.html>
