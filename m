From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 21:40:54 +0200
Subject: [Buildroot] [PATCH 1/2] lvm2: add host variant
In-Reply-To: <d10a8a17-a515-ce9e-95bf-50e32916901e@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Oct 2017 20:32:02 +0200")
References: <20171005150621.19570-1-peter@korsgaard.com>
 <d10a8a17-a515-ce9e-95bf-50e32916901e@mind.be>
Message-ID: <877ew9idrt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05-10-17 17:06, Peter Korsgaard wrote:
 >> This is only for the device-mapper library, so a user selectable
 >> Config.in.host option isn't needed.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 >  I was going to apply, but...

 >> ---
 >> package/lvm2/lvm2.mk | 12 ++++++++++++
 >> 1 file changed, 12 insertions(+)
 >> 
 >> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
 >> index f7f706976f..5783ab08be 100644
 >> --- a/package/lvm2/lvm2.mk
 >> +++ b/package/lvm2/lvm2.mk
 >> @@ -51,4 +51,16 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 >> LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 >> endif
 >> 
 >> +HOST_LVM2_CONF_OPTS = \
 >> +	--enable-write_install \
 >> +	--enable-pkgconfig \

 >  ... this made me think: shouldn't it depend on host-pkgconf? The
 > target package depends on host-pkgconf, even though it doesn't depend
 > on anything else (except optionally readline but that doesn't have a
 > .pc file). It's probably OK but I'd like an explanation just to be
 > sure.

--enable-pkgconfig is about if lvm2 should install .pc files, not if it
should use pkg-config to find dependencies. I had missed the
host-pkgconf dependency on the target variant (because of the +=).
The device-mapper library doesn't strictly need pkg-config, but yeah, it
makes sense to keep in sync with the target version.

I'll add it when applying, thanks!

-- 
Bye, Peter Korsgaard
