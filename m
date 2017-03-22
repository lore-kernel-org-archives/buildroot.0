From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Mar 2017 12:19:03 +0100
Subject: [Buildroot] [PATCH v5 12/19] infra-libtool: no longer prepend
 STAGING_DIR to libdir
In-Reply-To: <2604949.Y0oF46Lp5o@sagittae>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-13-git-send-email-jezz@sysmic.org>
 <6be103f5-9589-53a9-eab9-2c3edd52cd38@mind.be> <2604949.Y0oF46Lp5o@sagittae>
Message-ID: <7b6b58ac-05ba-1848-8ea0-a23f8300940e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-17 11:21, J?r?me Pouiller wrote:
> Hello Anrout,
> 
> On Saturday 18 March 2017 16:37:31 CET Arnout Vandecappelle wrote:
>>  Hi Jerome,
>>
>> On 20-12-16 14:46, J?r?me Pouiller wrote:
>>> Since `$lt_sysroot' is now correctly filled, it is no more necessary to patch
>>> `.la' files. Indeed, if $libdir point to `/usr/lib', libtool will also search
>>> in `$(lt_sysroot)/usr/lib'
>>
>>  Unfortunately, not all packages that use libtool also use automake.
> 
> You mean autoconf? Do you have an example of this?

 No, I mean automake. If it's not using autoconf that it shouldn't even be an
autotools-package, and we don't apply the libtool patches.

 IIUC, the --with-sysroot option is going to be substituted in the Makefiles
with an extra option to libtool. However, if a package is not using automake, it
is possible that that extra option doesn't get propagated. I think.


 Regards,
 Arnout

> 
>>  So some packages may die because of this.
>>
>>  That said, we should probably just fix these individual packages.
> 
> yes, I think it very unusual.
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
