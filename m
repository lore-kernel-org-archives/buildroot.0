From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 22:21:45 +0100
Subject: [Buildroot] [PATCH 1/1] Main Makefile Have "make savedefconfig"
 show where the file is being written to.
In-Reply-To: <dd0ef897-7b93-4c58-6f6f-a33e33f4e28a@mind.be> (Arnout
 Vandecappelle's message of "Thu, 1 Mar 2018 20:50:30 +0100")
References: <20180227112818.6766-1-chrismcc@gmail.com>
 <dd0ef897-7b93-4c58-6f6f-a33e33f4e28a@mind.be>
Message-ID: <87efl3h4pi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 27-02-18 12:28, Christopher McCrory wrote:
 >> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
 >> ---
 >> Makefile | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/Makefile b/Makefile
 >> index ec39bcdb9c..4ac2435a9c 100644
 >> --- a/Makefile
 >> +++ b/Makefile
 >> @@ -927,6 +927,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 >> --savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 >> $(CONFIG_CONFIG_IN)
 >> @$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 >> +	@echo "Saved to $(DEFCONFIG)"

 >  If BR2_DEFCONFIG is not set, you'll get "Saved to " which is a bit weird. So
 > change into:

 > 	@echo "Saved to $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)"

 >  But now $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) is used 3
 > times, so perhaps it's worth adding a variable for it. I can't think of a good
 > name for it unfortunately.

Perhaps we could just set DEFCONFIG to $(CONFIG_DIR)/defconfig if empty?

-- 
Bye, Peter Korsgaard
