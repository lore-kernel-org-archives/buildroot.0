From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 17:07:21 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
References: <50FACA8F.1040503@mind.be>
 <1368541851-31089-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130514170721.622fc086@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 14 May 2013 16:30:50 +0200, J?r?me Pouiller wrote:

> -$(BUILD_DIR)/.root:
> +$(STAMP_DIR)/skeleton-target-installed:
>  	mkdir -p $(TARGET_DIR)
>  	rsync -a \
>  		--exclude .empty --exclude .svn --exclude .git \
>  		--exclude .hg --exclude=CVS --exclude '*~' \
>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> +	mkdir -p $(STAMP_DIR)
>  	touch $@

I'm generally ok with the idea, but I don't like this mkdir. There is
already a mkdir that creates the stamp file directory, in the main
Makefile.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
