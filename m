From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 16:42:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-06-20
In-Reply-To: <57695D8F.4030200@imgtec.com>
References: <20160621063030.C5B79103326@stock.ovh.net>
 <57695D8F.4030200@imgtec.com>
Message-ID: <57696057.8070802@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I just noticed that you were already aware of this problem and
asked the submitter to investigate it.

Regards,

Vincent.

On 21/06/16 16:30, Vicente Olivert Riera wrote:
> Hello Thomas,
> 
> On 21/06/16 07:30, Thomas Petazzoni wrote:
>>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c4e9df261317fbcdb2015522e90d3e210e235c21/
>>      sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4d3c16580c2011a85a6ddb699ac21ed15cbe120d/
>>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/06ed84113867237a84159ee3193a8b0d05caeb03/
>>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/fa461c2ab6826e90f21a2689caef04b0306ef87d/
>>      sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2d1f44a435a2cecdaa1dcdd561a52b1dd8276c23/
>>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/32d871eb563b8c2b25a58255a0e27de572e976be/
> 
> it looks like there is some sort of problem with your host compiler. All
> the above build failures have been produced in your "Free Electrons
> server" autobuilder, and it fails when using the host gcc for this
> snippet of code from the efivar.mk:
> 
> # makeguids is an internal host tool and must be built separately with
> # $(HOST_CC), otherwise it gets cross-built.
> $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
> 	CFLAGS="$(HOST_CFLAGS) -std=c99" \
> 	$(MAKE) -C $(@D)/src makeguids
> 
> The error looks like this:
> 
> cc1: error: unrecognized command line option "-std=gnu11"
> cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
> cc1: error: unrecognized command line option "-flto"
> cc1: error: unrecognized command line option "-std=gnu11"
> cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
> cc1: error: unrecognized command line option "-flto"
> 
> Could you please have a look?
> 
> Regards,
> 
> Vincent.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
