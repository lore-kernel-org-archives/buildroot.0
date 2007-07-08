From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 15:11:08 +0200
Subject: [Buildroot] missing expat-dirclean target
In-Reply-To: <0707081504270.3987@somehost>
References: <0707081407520.26961@somehost> <20070708121822.GH4096@aon.at>
	<0707081504270.3987@somehost>
Message-ID: <20070708131108.GL4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 03:07:18PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Sun, 8 Jul 2007, Bernhard Fischer wrote:
>
>> On Sun, Jul 08, 2007 at 02:09:11PM +0200, Cristian Ionescu-Idbohrn wrote:
>> >Index: expat.mk
>> >===================================================================
>> >--- expat.mk	(revision 19026)
>> >+++ expat.mk	(working copy)
>> >@@ -70,6 +70,9 @@
>> > 	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/usr/bin/xmlwf
>>
>> the clean target must wipe installed stuff from the staging-dir. Please
>> fix this, too.
>
>Looks like stuff is removed both from STAGING_DIR and TARGET_DIR.  Is this
>the correct behaviour?

I think removing stuff from both staging_dir and target_dir is the way
to go, yes.

Consider somebody intending to turn off a package. The usual intuitive
way is IMHO to make foo-clean then reconfigure to remove that package.

I'm open to alternative suggestions, of course.

>> this package uses wrong installation pathes, please fix and test while
>> you're at it (i don't use it):
>>
>>                 --includedir=/include \
>> is wrong, whould be /usr/include. Most of these pathes are not needed,
>> just --prefix=/usr should be enough.
>
>Will do.

thanks alot in advance!
