From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jun 2010 08:54:32 +0200
Subject: [Buildroot] [git commit master] file: bump version and migrate
	to autotargets
In-Reply-To: <20100609083520.09d5f9b2@surf> (Thomas Petazzoni's message of
	"Wed, 9 Jun 2010 08:35:20 +0200")
References: <20100608220138.82FF1909FC@busybox.osuosl.org>
	<20100609083520.09d5f9b2@surf>
Message-ID: <87pr00hf13.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Tue, 8 Jun 2010 23:32:40 +0200
 Thomas> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

 >> +$(FILE_TARGET_UNINSTALL):
 >> +	$(call MESSAGE,"Uninstalling")
 >> +	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
 >> +	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
 >> +	rm -f $(FILE_TARGET_INSTALL_TARGET) $(FILE_HOOK_POST_INSTALL)

 Thomas> Ah, I didn't catch this at the review phase. I'd like to get rid of
 Thomas> these ? old style ? way of overloading operations. You can do the same
 Thomas> in a new style way with:

 Thomas> define FILE_UNINSTALL_TARGET_CMDS
 Thomas> 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
 Thomas> 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
 Thomas> endef

Fixed, thanks.

-- 
Bye, Peter Korsgaard
