From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 28 Oct 2008 07:47:01 +0100
Subject: [Buildroot] [PATCH] Avoid make distclean to remove packages
	fromrootfs
In-Reply-To: <20081028010442.GA27610@cloud.net.au>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
	<COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
	<e4c675870810271342l7cb8d57eo824d1238bcf18ab3@mail.gmail.com>
	<20081027204927.GF14184@mx.loc>
	<e4c675870810271411j60951480x90de0d4520abcb75@mail.gmail.com>
	<20081028010442.GA27610@cloud.net.au>
Message-ID: <e4c675870810272347i7a91fc6ds4cd56a26dad643fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/28 Hamish Moffatt <hamish@cloud.net.au>:
> On Mon, Oct 27, 2008 at 10:11:12PM +0100, Roberto A. Foglietta wrote:
>> clean remove a lot of things not only the stamps
>>
>> clean: $(TARGETS_CLEAN)
>>       rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
>> $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
>>
>> a) you want reinstall things in root because they have been corrupted
>> without loosing your customization on scripts/configurations:
>
> You shouldn't edit anything in $(TARGET_DIR) yourself - edit the
> source, then rebuild.

Yes and no.
Yes you are right once I know what I want to do on the source.
No, you are not right if I have to play with rootfs until I decide.


>
> However, there does need to be a way to copy the target_skeleton over
> the root directory again in case you've edited files (startup scripts,
> passwd file, fstab etc). And you might not want to copy this over an
> existing $(TARGET_DIR), because then you might lose changes made
> by packages.
>
> I didn't understand your softclean and rootclean targets though. Here's
> what I have added to my own tree:
>

my 'softclean' is an internal target in order to do 'install' target.

> root-clean:
>        rm -rf $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps $(TARGET_DIR)
>
>

ok, so it seems to me that: install and rootclean could be two
acceptable targets to add.

here you are a newer version of the patch

+	@echo '  rootclean		- delete all rootfs content

+	@echo '  install		- (re)install rootfs but not skeleton if it exists'


Cheers,
-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile-r23778.patch3
Type: application/octet-stream
Size: 2568 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081028/4492baf1/attachment.obj 
