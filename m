From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 21:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] lego: ev3: use mainline kernel
In-Reply-To: <41fbf82c-5eab-e25b-1529-29230794e8b5@lechnology.com> (David
 Lechner's message of "Wed, 17 May 2017 10:28:12 -0500")
References: <1494890483-11249-1-git-send-email-david@lechnology.com>
 <878tlw8qsd.fsf@dell.be.48ers.dk>
 <41fbf82c-5eab-e25b-1529-29230794e8b5@lechnology.com>
Message-ID: <87bmqr5kmm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Lechner <david@lechnology.com> writes:

Hi,

 >> I guess this change isn't strictly needed because of the symlink, but
 >> OK.

 > The symlink is something that I meant to ask about but forgot. I made
 > the symlink so that the file name in the FAT partition is correct when
 > creating an SD card image. I was wondering if there might be a better
 > way to rename the file using the genimage tool.

Looking at the source code, you CAN do it using the file argument
(instead of files):

image boot.vfat {
	vfat {
		file uImage {
		     image = "uImage.da850-lego-ev3"
		}
	}
	size = 16M
}

The file section title (uImage) is the name the file will have inside
the fat filesystem, and image is the source name.

If this is really more readable than the symlink or not I don't know.

 > No reason. I will send another patch to update.

Great, thanks!

-- 
Bye, Peter Korsgaard
