From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 May 2016 22:44:40 +0200
Subject: [Buildroot] [PATCH v5] package/radlib: new package
In-Reply-To: <1461510916.5247.21.camel@intel.com>
References: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
 <1460563603-3748-2-git-send-email-ray.kinsella@intel.com>
 <57195C19.3070307@mind.be> <1461510916.5247.21.camel@intel.com>
Message-ID: <a4b92b7c-5ef9-f00b-48fe-8253afd71c4f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/24/16 17:15, Kinsella, Ray wrote:
> Thanks Arnout,
>
> See inline.
>
> On Fri, 2016-04-22 at 01:02 +0200, Arnout Vandecappelle wrote:
[snip]
>>   I think this should be the first patch; our autoreconf will not be
>> happy
>> without subdir-objects.

  Actually, this was a silly argument: our build will only work with all patches 
applied, of course.

>
> autoreconf does complain without the subdir-objects. The removal of the
> CROSS_COMPILE in the same patch is important as the linker breaks
> without it. It won't even get to linking stage if it can't find the
> various database libraries fixed in the two previous patches.
>
> Suggest a new first patch to fix sudir-objects (patch number 4.), but
> then leave the other patches as they are. So the flow would be.
>
> 1. Fix subdir-objects
> 2. Fix sqlite + postgresql
> 3. Fix mysql
> 4. Fix the linker (CROSS_COMPILE).
>
> What do you think?

  That sounds good. Perhaps 2+3 could be combined, it doesn't matter that much.


[snip]
>>   I'm not really happy with this choice, I'd prefer an automatic
>> selection. But
>> it's true, if both mysql and postgresql are selected it's hard to
>> decide which
>> one should be used...
>
> sent a seperate email on this.
> mysql and postgresql are mutually exclusive.
> sqlite lite can be safely enabled/disable depending on
> BR2_PACKAGE_SQLITE.

  Still, I'd prefer an automatic selection. E.g. if mysql is selected, build 
mysql support, else if pgsql is selected, build pgsql support, else disable both.


[snip]


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
