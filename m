From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 10:02:48 +0100
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
 files
In-Reply-To: <87o9ydrdep.fsf@dell.be.48ers.dk>
References: <o7araj$clq$1@blaine.gmane.org>
 <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
 <o7cvgb$209$1@blaine.gmane.org> <o7d0l8$c5k$1@blaine.gmane.org>
 <87o9ydrdep.fsf@dell.be.48ers.dk>
Message-ID: <20170208100248.5fa0965d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Feb 2017 20:47:42 +0100, Peter Korsgaard wrote:

>  > Is it just the .patch files found in the package directory that are
>  > skipped in the [FOO_SITE_METHOD = local] case?  Or are all patches
>  > skipped (also skipping those specified by FOO_PATCH and
>  > BR2_GLOBAL_PATCH_DIR)?  
> 
> All patches, it skips directly to to the configure step.

Just to clarify things:

 * For all site methods (except local/OVERRIDE_SRCDIR), the steps
   through which a package go are:

   source -> extract -> patch -> configure -> build -> install

 * For the local site method and OVERRIDE_SRCDIR, the steps through
   which a package go are:

   rsync -> configure -> build -> install

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
