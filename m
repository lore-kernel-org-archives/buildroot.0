From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Mar 2017 10:07:28 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <20170322091437.7ebd63bf@free-electrons.com>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
 <20170320225250.0a5bd659@free-electrons.com>
 <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
 <20170322091437.7ebd63bf@free-electrons.com>
Message-ID: <8c53efa1-15a4-0220-1aa7-a3e13a71d8e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-17 09:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 22 Mar 2017 00:57:39 +0100, Arnout Vandecappelle wrote:
> 
>>> So are you sure that this feature didn't appear in libtool 2.4 ?  
>>
>>  Yeah, looks like it. E.g. speex has libtool 1.5, and it doesn't have any
>> sysroot support (not in configure, not in ltmain.sh).
>>
>>  Obviously, *this* patch is not affected by it - it certainly doesn't hurt to
>> pass the --with-sysroot configure option. It's only patches 12+13 that we
>> wouldn't be able to remove.
>>
>>  However, considering:
>>
>> - most packages install things in /usr/lib, which is already searched by default;
>>
>> - most packages use libtool 2.4 or later,
>>
>> I think we can take the risk. The autobuilders will discover any issues, which
>> we can fix per package (e.g. with AUTORECONF = YES).
> 
> Since I would prefer to avoid autoreconfiguring many packages, it would
> be useful to know how many packages are still using libtool versions
> earlier than 2.4.

 I'm doing an allyesconfig download and will check the ltmain.sh in all the
tarballs. It will take some time before that finishes.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
