From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Sep 2013 09:23:33 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
	rule idempotent
In-Reply-To: <8761u9wu8r.fsf@dell.be.48ers.dk>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761u9wu8r.fsf@dell.be.48ers.dk>
Message-ID: <20130910092333.5a11799f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 09 Sep 2013 23:38:44 +0200, Peter Korsgaard wrote:

>  Thomas> diff --git a/Makefile b/Makefile
>  Thomas> index 09faeba..93fc6ea 100644
>  Thomas> --- a/Makefile
>  Thomas> +++ b/Makefile
>  Thomas> @@ -447,9 +447,13 @@ $(BUILD_DIR)/.root:
>  Thomas>  		--exclude .hg --exclude=CVS --exclude '*~' \
>  Thomas>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>  Thomas>  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>  Thomas> -	@ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
>  Thomas> -	@mkdir -p $(TARGET_DIR)/usr
>  Thomas> -	@ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>  Thomas> +	$(Q)if [ ! -L $(TARGET_DIR)/$(LIB_SYMLINK) ]; then \
>  Thomas> +		ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK) ; \
> 
> Can't you just do ln -sf like we do elsewhere?

ln -sf no, but ln -snf yes. I'll fix up the patch and resend.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
