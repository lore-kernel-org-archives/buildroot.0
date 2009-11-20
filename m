From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Nov 2009 15:22:26 +0100
Subject: [Buildroot] [git commit master] Makefile: cleanup *clean targets
In-Reply-To: <200911200809.17924.minimod@morethan.org> (Michael S. Zick's
	message of "Fri\, 20 Nov 2009 08\:08\:57 -0600")
References: <20091120133712.77E5277783@busybox.osuosl.org>
	<200911200809.17924.minimod@morethan.org>
Message-ID: <87r5rtgtst.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 >> As discussed on the list, fixup the *clean targets, so we now have:
 >> 

 Michael> a newbee here, I missed that discussion -

The original thread is here:

http://lists.busybox.net/pipermail/buildroot/2009-October/029707.html

 >> -dirclean: $(TARGETS_DIRCLEAN)
 >> -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 >> -

 Michael> If "dirclean" is now dead. . .
 Michael> Shouldn't the form:
 Michael> make PackageName-dirclean also die?

Well, perhaps long term it should - But that would involve touching all
packages, not something I would want to do this close to the release. I
plan on getting 2009.11-rc1 out this weekend.

 Michael> What is catching my eye is section of the makefile about:
 Michael> TARGETS_CLEAN:
 Michael> TARGETS_SOURCE:
 Michael> TARGETS_DIRCLEAN:
 Michael> TARGETS_ALL:

 Michael> Please keep in mind I missed out on the discussion and
 Michael> also have very limited knowledge of this build system.

Those are still used to mark them phony and ensuring all enabled
packages gets built.

-- 
Bye, Peter Korsgaard
