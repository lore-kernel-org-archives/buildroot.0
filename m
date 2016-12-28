From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 10:21:26 +0100
Subject: [Buildroot] [PATCH] fs/tar: make --no-recursion effective
In-Reply-To: <a5d19ac14d835abbc645fef67aad61ce48e247b9.1482860523.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 27 Dec 2016 19:42:03 +0200")
References: <a5d19ac14d835abbc645fef67aad61ce48e247b9.1482860523.git.baruch@tkos.co.il>
Message-ID: <87o9zwbe95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The tar --no-recursion option is position sensitive. It only affects following
 > file listing options. Move --no-recursion before the -T option to make it
 > effective. This fixes duplication of entries in the generated rootfs.tar
 > archive.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I got a bit confused by this, as the manual explicitly shows the -T -
--no-recursion sequence:

https://www.gnu.org/software/tar/manual/html_section/tar_54.html

But indeed, tar -tvf output/images/rootfs.tar | grep '/usr/$' had 2 hits
before, and not after applying this patch - So committed, thanks!

-- 
Bye, Peter Korsgaard
