From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 18:47:34 +0200
Subject: [Buildroot] [PATCH 2/4] package/mke2img: use mkfs to generate
	rootfs image
In-Reply-To: <cc40741b-4d68-9c3d-0b72-aa70a7b01e8e@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
 <1490372432-879-2-git-send-email-sebastien.szymanski@armadeus.com>
 <ec6c517a-18a2-e6c3-a35e-4c794dad7aaa@mind.be>
 <cc40741b-4d68-9c3d-0b72-aa70a7b01e8e@armadeus.com>
Message-ID: <5d26ebc8-5a26-f94c-5e04-5c9fe4c1e7e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 09:54, S?bastien Szymanski wrote:
> I think the user should be able to select the flags he wants. Should I
> add a string symbol (i.e, BR2_TARGET_ROOTFS_EXT2_OPTIONS) that is passed
> directly to mkfs or a bool symbol just for the 64bit flag (i.e,
> BR2_TARGET_ROOTFS_EXT2_O_64BIT) ?

 bool option doesn't make much sense IMO. String option is better, and for me
it's OK to default it to ^64bit.

 I would then take this patch without the ^64bit, and add the
BR2_TARGET_ROOTFS_EXT2_FEATURES option in a later patch. (Note that it should be
called _FEATURES, since the man page refers to it as features.) It may be a good
idea BTW to include a reference to the man page in the help text:

	  For more information about the features which can be set, see
	  the manual page ext4(5).

(taken from the mke2fs man page).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
