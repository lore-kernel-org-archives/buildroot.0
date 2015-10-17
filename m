From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 22:22:08 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user
	table files
In-Reply-To: <20151017143433.GD3717@free.fr> (Yann E. MORIN's message of "Sat, 
 17 Oct 2015 16:34:33 +0200")
References: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
 <20151017143433.GD3717@free.fr>
Message-ID: <87a8rhz1n3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2015-10-16 16:50 +0200, Peter Korsgaard spake thusly:
 >> The format of the users table files is non trivial, so it is sometimes handy
 >> to add comments explaining the syntax (or simply the reason for the user)
 >> inline in the files.
 >> 
 >> Support comment lines prefixed with '#' similar to shell / makedevs files and strip
 >> those lines before passing to the mkusers script.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> fs/common.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/fs/common.mk b/fs/common.mk
 >> index 528e194..7110bc7 100644
 >> --- a/fs/common.mk
 >> +++ b/fs/common.mk
 >> @@ -87,7 +87,7 @@ endif
 >> echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 >> endif
 >> ifneq ($$(ROOTFS_USERS_TABLES),)
 >> -	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 >> +	sed '/^#/d' $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)

 > Thomas and I both think it should be done in the script itself.
 > I'll do it. ;-)

Ok, fine by me. Again, I'm not particular in favour of one approach over
the other - Doing it like this was just simpler as it is a trivial
oneliner.

-- 
Venlig hilsen,
Peter Korsgaard 
