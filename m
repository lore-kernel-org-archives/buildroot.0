From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 23:36:28 +0200
Subject: [Buildroot] [PATCH v10 2/2] Add defconfig for MIPS Creator ci40
In-Reply-To: <20170424052653.8264-1-abhimanyu.v@gmail.com> (Abhimanyu
 Vishwakarma's message of "Mon, 24 Apr 2017 10:56:53 +0530")
References: <20170424052653.8264-1-abhimanyu.v@gmail.com>
Message-ID: <87zif1ilcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Abhimanyu" == Abhimanyu Vishwakarma <abhimanyu.v@gmail.com> writes:

 > From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
 > Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Tested-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

 > ---
 >  Changes v1->v2
 >   - No change
 >  Changes v2->v3 (Suggested by Arnout)
 >   - Remove uImage and add fitImage generation
 >   - Tidy readme.txt
 >   - Tidy ci40_defconfig, remove custom toolchain and add wifi helper packages
 >   Some changes are not done:
 >   - Using git-helper:
 >     - Custom kernel doesnt provide tar file, so it didnt work for me
 >  Changes v3->v4 (Suggested by Arnout)
 >   - Use github helper for getting kernel/u-boot
 >   - rename fitImage.its -> fitImage.its.in to reflect as template file,
 >     remove hardcoded dtb filename
 >   - Find dtb file in output/images directory and use first dtb in fitImage
 >   - Remove image size from genimage.cfg
 >   - Tidy readme.txt and add section to explain how to stop u-boot autoboot,
 >     how to make it persistent, and other grammar
 >  Changes v4->v5 (Suggested by Thomas)
 >   - Use fixed kernel entry addr
 >   - Generate vmlinux.bin.gz from generate vmlinux.bin
 >   - Remove generating uImage (not required for anything now)
 >  Changes v5->v6
 >   - Use kernel generate fitimage
 >   - bump up u-boot version
 >   - Change emailid from imgtec.com -> personal id
 >  Changes v6->v7 (Suggested by Thomas)
 >   - Use genimage.sh script
 >   - Improve and fix grammer in readme.txt
 >  Changes v7->v8 (Suggested by Arnout)
 >   - Use genimage.sh script from POST_IMAGE_SCRIPT
 >   - Use uboot kconfig base config
 >   - Remove dts config from defconfig
 >   - Some other small cleanup
 >   - rebase on master
 >  Changes v8->v9 (Suggested by Arnout)
 >   - Use sh instead of bash where bash feature is not needed
 >   - Use sudo for command run on user PC
 >   - Update bootloader flashing help text in readme.txt
 >  Changes v9->v10
 >   - No changes

Committed, thanks. Thank you for your persistence in getting this
integrated!

-- 
Bye, Peter Korsgaard
