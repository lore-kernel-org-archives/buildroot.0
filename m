From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Jul 2015 00:32:59 +0200
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <20150716231142.6486d101@free-electrons.com>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
 <20150716231142.6486d101@free-electrons.com>
Message-ID: <55A8311B.30503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/16/15 23:11, Thomas Petazzoni wrote:
> Dear Ed Swierk,
> 
> On Thu, 16 Jul 2015 13:58:49 -0700, Ed Swierk wrote:
>> This patch updates the polarssl package to build the current mbed 1.3.x
>> release.
>>
>> It also prefixes the generated binaries with mbed_, to avoid names that
>> overlap with other packages (like sha1sum) or that are generic and
>> confusing (like selftest or hello).
>>
>> Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
>> ---
>>  package/polarssl/0001-no-test-suite.patch          | 27 ----------------------
>>  ...he-standard-CMake-flag-to-drive-the-share.patch | 18 +++++++--------
>>  package/polarssl/polarssl.hash                     |  4 ++--
>>  package/polarssl/polarssl.mk                       | 17 +++++++++++---
>>  4 files changed, 25 insertions(+), 41 deletions(-)
>>  delete mode 100644 package/polarssl/0001-no-test-suite.patch
> 
> Thanks for your patch. However, following Gustavo's comment, I've
> marked your patch as "Changes Requested" in our patch tracking system.
> Can you resubmit a new version that takes into account Gustavo's
> comments?

 Since it anyway is not compatible and upstream changed name, perhaps it's
better just to create a new package called mbedtls? When we remove polarssl we
can make a legacy entry to point to mbedtls.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
