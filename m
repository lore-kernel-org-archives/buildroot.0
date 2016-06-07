From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jun 2016 14:51:39 +0200
Subject: [Buildroot] [PATCH 7/7] fs/squashfs: remove useless chmod
In-Reply-To: <20160606211658.GA3706@free.fr> (Yann E. MORIN's message of "Mon, 
 6 Jun 2016 23:16:58 +0200")
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <d4b5c7f0315f28e792a014983c78b1fe4958eb9f.1465245732.git.yann.morin.1998@free.fr>
 <20160606230615.2772541c@free-electrons.com>
 <20160606211658.GA3706@free.fr>
Message-ID: <87mvmxf9gk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Maybe mksquashfs has changed its default behavior since then, but
 >> clearly that's the reason why we were doing this.

 > At least, that's not what I can see here...

No, it seems to use sensible permissions nowadays:

strace -e open mksquashfs /tmp/blah /tmp/test.squashfs
..
open("/tmp/test.squashfs", O_RDWR|O_CREAT|O_TRUNC, 0644) = 3
open("/sys/devices/system/cpu/online", O_RDONLY|O_CLOEXEC) = 4
Parallel mksquashfs: Using 4 processors
Creating 4.0 filesystem on /tmp/test.squashfs, block size 131072.

-- 
Bye, Peter Korsgaard
