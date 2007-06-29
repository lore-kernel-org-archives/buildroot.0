From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 Jun 2007 09:46:45 +0200
Subject: [Buildroot] syslinux.mk & bzip2 errors, modification
In-Reply-To: <1497cb6d0706282337g19372f54t3275752462df147e@mail.gmail.com>
References: <1497cb6d0706282337g19372f54t3275752462df147e@mail.gmail.com>
Message-ID: <20070629074645.GB8033@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 29, 2007 at 02:37:18PM +0800, Lee JJ wrote:
>Sorry , this may already appear somewhere else
>PLS forgive to bother you
>
>1
>buildroot/target/x86/syslinux/syslinux.mk
>
>SYSLINUX_SITE=http://www.kernel.org/pub/linux/utils/boot/syslinux/Old<---Old
>now the web director change to "Old"

Does version 3.51 work for you?
>
>2.
>cp /root/buildroot/build_i686/bzip2-1.0.3/bzlib.h
>/root/buildroot/build_i686/staging_dir/include/
>cp: cannot create regular file
>`/root/buildroot/build_i686/staging_dir/include/bzlib.h': No such file or
>directory
>
>buildroot/build_i686/staging_dir/"include/" <--- do not know where is the
>script error
>have to create the "include" directory by hand

This is most likely coming from old sources or an old build.
svn up
rm -rf build_* toolchain_* && make
and it should be fixed.
