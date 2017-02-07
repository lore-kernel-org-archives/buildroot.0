From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2017 17:18:04 +0000 (UTC)
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
	files
References: <o7araj$clq$1@blaine.gmane.org>
 <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
Message-ID: <o7cvgb$209$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-07, Arnout Vandecappelle <arnout@mind.be> wrote:

>> After comparing build trees that worked with build trees that failed,
>> I finallythat setting SITE_METHOD = LOCAL prevents the application of
>> the .patch files present in the package directory. 
>
> It does. The technical reason for that is that SITE_METHOD = local
> is implemented using _OVERRIDE_SRCDIR, and for that we don't want to
> apply patches because the typical use case is to build some
> different version to which the patches wouldn't apply anyway.
>
> Also, when you set SITE_METHOD = local, there should be no reason to
> apply patches because you can just as well apply them in your custom
> tarball.

Can SITE_METHOD = local be used with a custom tarball?  My
understanding from the docs is that it requires an unpacked source
directory tree [in which, as you said, one can easily apply whatever
patches are required].

I agree that for the unpacked source directory tree use case, not
appying patches makes the most sense.

>  Indeed, it should be documented. Care to send a patch?

Will do.

-- 
Grant Edwards               grant.b.edwards        Yow! Somewhere in Tenafly,
                                  at               New Jersey, a chiropractor
                              gmail.com            is viewing "Leave it to
                                                   Beaver"!
