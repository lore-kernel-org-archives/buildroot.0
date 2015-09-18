From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Sep 2015 16:00:36 +0200
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <20150918094102.10d6c65e@free-electrons.com>
References: <20150916221636.039df52b@free-electrons.com>
 <55FB3E49.5050606@mind.be> <20150918094102.10d6c65e@free-electrons.com>
Message-ID: <55FC1904.9080407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-09-15 09:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Sep 2015 00:27:21 +0200, Arnout Vandecappelle wrote:
[snip]
>>  Another option is that we add a different flag to indicate the dependency on
>> libintl:
>>
>> config BR2_PACKAGE_GETTEXT_WITH_LIBINTL
>> 	bool
>> 	default y
>> 	depends on BR2_PACKAGE_GETTEXT
>> 	depends on BR2_STATIC_LIBS
> 
> Why this depends on BR2_STATIC_LIBS ? Linking against libintl is also
> needed in dynamic linking scenarios.

 My bad, I just thought it was one of these cases where explicit linking was
only needed for static.


 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
