From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 23:46:57 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130918184035.24b2c345@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be> <20130917203726.5b02fe08@skate>
 <52394EEA.4000603@mind.be> <20130918175655.3f3a8466@skate>
 <5239CF12.6040308@mind.be> <20130918184035.24b2c345@skate>
Message-ID: <523A1F51.1090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 18:40, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 18 Sep 2013 18:04:34 +0200, Arnout Vandecappelle wrote:
>
>>> Right, that's one way of seeing things, indeed. It sounds a bit
>>> convoluted to me, though. When a package A needs a specific feature
>>> from package B (such as gudev), I believe it makes sense for
>>> package B to provide a sub-option that package A can select, rather
>>> than package A having intimate knowledge of the dependencies needed
>>> by package B to enable whatever feature package A needs to have
>>> from package B.
>>
>>    Makes sense, but we probably already have tons of these already. If
>> gudev would have been added in the normal way instead of introducing
>> the all_extras option, then the implementors of network-manager and
>> udisks wouldn't even have noticed that udev had to be compiled in a
>> specific way: since these tools already select libglib2, udev would
>> have been compiled with gudev support.
>
> True.
>
>>    Really, the all-extras is historical accident because a long time
>> ago udev's configure had an EXTRAS=... option in its build commands.
>
> Right. But the extras have more dependencies that just glib2: it also
> depends on hwdata and on acl. Will glib2 be sufficient to get gudev
> built, for use by udisks? Maybe.

  For eudev this doesn't seem to be the case anymore. Or else the patch 
was wrong :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
