From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:06:15 +0200
Subject: [Buildroot] [PATCH 7/7] fs/squashfs: remove useless chmod
In-Reply-To: <d4b5c7f0315f28e792a014983c78b1fe4958eb9f.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <d4b5c7f0315f28e792a014983c78b1fe4958eb9f.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <20160606230615.2772541c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jun 2016 22:43:44 +0200, Yann E. MORIN wrote:
> When that was added (in 975e30b, fs/squashfs: fix image file

There is no such commit as 975e30b:

~/projets/buildroot (master)$ git show 975e30b
fatal: ambiguous argument '975e30b': unknown revision or path not in
the working tree. Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

> permissions), the reasons were not quite explicit.

I very well remember that mksquashfs had the very annoying default
behavior of making its output file 0444. Like because it was a
read-only filesystem, the images should also be read-only, which is
obviously a bit silly.

Maybe mksquashfs has changed its default behavior since then, but
clearly that's the reason why we were doing this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
