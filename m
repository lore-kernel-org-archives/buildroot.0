From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Jul 2017 17:57:51 +0200
Subject: [Buildroot] img layout
In-Reply-To: <trinity-87e7b58a-c039-4b11-8d40-18e2768a46c0-1500634784758@3capp-mailcom-bs02>
 (daggs@gmx.com's message of "Fri, 21 Jul 2017 12:59:44 +0200")
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
 <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
 <87vammoyqg.fsf@dell.be.48ers.dk>
 <trinity-87e7b58a-c039-4b11-8d40-18e2768a46c0-1500634784758@3capp-mailcom-bs02>
Message-ID: <87r2x9pytc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 >> That looks very similar to the logic we already have in
 >> board/hardkernel/odroid2c2/post-image.sh, isn't that working for you?
 >> 
 >> -- 
 >> Bye, Peter Korsgaard

 > the original script won't work because it doesn't needs to address the signed bins because they are included.
 > it uses a uboot 2005 based git fork that already includes it. without
 > adding the signed bins, the system will not boot.

Ehh, ok - That I get, but the lines you pasted before are pretty similar to what
we're already doing.

Looking at board/amlogic/odroid-c2/README in u-boot it looks like we
need to package the hardkernel host utilities and binary ATF builds - Or
perhaps we can use Andreas' meson-tools for (some of) the tasks:

https://github.com/afaerber/meson-tools

And then postprocess u-boot.bin with them and add it to the sdcard.img
like we do today.

-- 
Bye, Peter Korsgaard
