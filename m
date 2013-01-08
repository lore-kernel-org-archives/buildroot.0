From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 23:51:41 +0100
Subject: [Buildroot] [git commit] pthread-stubs: rename to
	xlib_libpthread-stubs
In-Reply-To: <20130108232920.6676165c@skate>
References: <20130105124707.668AD9A64B@busybox.osuosl.org>
 <50EC9186.7050802@mind.be> <20130108232920.6676165c@skate>
Message-ID: <50ECA2FD.5020208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/13 23:29, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 08 Jan 2013 22:37:10 +0100, Arnout Vandecappelle wrote:
>
>> - There would be a comment that this is a legacy option from 2011.11;
>
> Ok, so, something like:
>
> #
> # Legacy options from 2012.11
> #

ACK

>
>> - The BR2_LEGACY_CHECK_2012_11 is updated to BR2_LEGACY_CHECK_2013_02 so
>> that it is re-enabled (but this can be done just prior to the release, of
>> course).
>
> I am not sure to fully understand the idea in Config.in.legacy. What
> happens if someone upgrades from 2012.08 to 2013.02 (i.e, skips the
> 2012.11 version) ?

  When an old .config contains a legacy symbol, you can easily get rid of 
it by de-selecting the "Check for legacy options" menuconfig. But of 
course, it will stay de-selected the next time you upgrade buildroot and 
so there will be no more checks for legacy options...  To work around 
that, we should change the name of the menuconfig symbol with every 
release. It doesn't really matter what name we give it, as long as it 
changes.

  If someone upgrades from 2012.11 to 2015.11, it will still be a 
different symbol so it will default to y again.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
