From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Wed, 2 Jul 2014 13:40:36 +0200
Subject: [Buildroot] [PATCH v3] u-boot: allow to pass a custom
	configuration file
In-Reply-To: <20140611221618.5b224a1e@free-electrons.com>
References: <1399904527-8159-1-git-send-email-eric.jarrige@armadeus.org>
 <20140611221618.5b224a1e@free-electrons.com>
Message-ID: <484D683A-086E-4D19-9D93-922A1450D8DA@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11 juin 2014, at 22:16, Thomas Petazzoni wrote:

> 
> Dear Eric Jarrige,
> 
> On Mon, 12 May 2014 16:22:07 +0200, Eric Jarrige wrote:
>> Add an option BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE that makes it possible
>> to override the configuration options in the board header file. This
>> avoids the need for manipulating the board header file with sed hacks
>> like is currently done for the BR2_TARGET_UBOOT_NETWORK settings.
>> 
>> Note that this option does not make it possible to add a new board to
>> U-Boot. That still has to be done by patching the source.
>> 
>> Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
> 
> We just had a discussion on IRC with Peter Korsgaard, and he also
> doesn't like much this solution:
> 
> 22:16 < Jacmet> kos_tom: I also don't like 348092
> 
> He hasn't expressed the details on IRC, but I believe he shares similar
> concerns to mine, i.e:
> 
> """
> I must say I'm still unconvinced by this patch. In U-Boot, the
> configuration is completely mixed with the definition of the board, and
> defining a board does not only require adding a file in
> include/configs/, but also adding an entry in boards.cfg.
> 
> Therefore, I really believe that people willing to customize their
> U-Boot board or configuration should instead carry a patch against
> U-Boot instead of using this non-standard solution.
> """
> 
> Of course, if Peter has different/other reasons, I'm sure he will
> give more details in this thread.
> 
> As a consequence, I'm marking the patch as Rejected in patchwork.
> 
> Thanks,

Thanks for your feedback.

Regards,
Eric
