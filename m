From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 28 Feb 2020 07:21:55 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20200227234905.44125454@windsurf.home>
References: <20200227093138.523B887666@whitealder.osuosl.org>
 <20200227234905.44125454@windsurf.home>
Message-ID: <CAEyMn7aCCOi9eExSJ8=kbPwWy_bWujoXN5JMv4tHt=O-nihgJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas ,Sergio and all,

> >     arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/46c5cf068cf9ea50e53491870d9dbf3f134c8c22 |
>
> /home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.2.1/../../../../arc-buildroot-linux-uclibc/bin/ld: ../src/.libs/libgdiplus.so: undefined reference to `GifQuantizeBuffer'
>
> This is *not* a static linking issue.

This is an issue coming with a newer giflib version
(https://github.com/mono/libgdiplus/pull/575).
Gitlib has remove the code used by libgdiplus version in buildroot.
But in version 6.x of libgdiplus the commit
https://github.com/mono/libgdiplus/commit/1c028b7087b27e62fff6dcf8e3240ce2b1a4ce7a
included the missing fucntion from giflib.


There are 2 options:
1) update libgdiplus to 6.x in buildroot (I dont know if it is
possible with little effort)
2) backport the fix commit (unfortunatly the commit does not apply to
the version used by buildroot)

What do you think?

--
Heiko
