From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 17:56:12 +0100
Subject: [Buildroot] [PATCH 1/1] Bumping liblo from 0.26 to 0.29. C++
 wrappers for this lib started appearing in 0.28 so I think this is valid.
In-Reply-To: <4d63d250-e077-a04c-76c6-dbbbb170a9cc@mind.be>
References: <1518098606-2865-1-git-send-email-alexbaldwinmusic@gmail.com>
 <4d63d250-e077-a04c-76c6-dbbbb170a9cc@mind.be>
Message-ID: <0631e37c-b868-6cfb-7a76-f5b8cfffea64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, I accidentally sent this while it was only half-finished...

On 08-02-18 17:45, Arnout Vandecappelle wrote:
[snip]
>>
>> Signed-off-by: Alex <alexbaldwinmusic@gmail.com
> 
>  Your Signed-off-by line should have your full name

 Your Signed-off-by line should have your full name, and it should match the
Author tag of the patch. That's because this is a legal statement: it is a short
way for you to assert that you are entitled to contribute the patch under
buildroot's GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

>> ---
>>  package/liblo/0000-disableIPV6-config.patch | 24 ++++++++++++++++++++++++
>>  package/liblo/liblo.hash                    | 10 +++++++---
>>  package/liblo/liblo.mk                      |  2 +-
>>  3 files changed, 32 insertions(+), 4 deletions(-)
>>  create mode 100644 package/liblo/0000-disableIPV6-config.patch
>>
>> diff --git a/package/liblo/0000-disableIPV6-config.patch b/package/liblo/0000-disableIPV6-config.patch
>> new file mode 100644
>> index 0000000..cf3503c
>> --- /dev/null
>> +++ b/package/liblo/0000-disableIPV6-config.patch
>> @@ -0,0 +1,24 @@

 Patches should have a descriptive message and an additional Signed-off-by line
(this time asserting that you are entitled to contribute the patch under the
license of the project, in this case LGPL-2.1+).

 Since upstream is a git repository, we prefer git-formatted patches (i.e. clone
the upstream repo, make your changes, test with LIBLO_OVERRIDE_SRCDIR=...,
commit including a Signed-off-by, and create the patch with git format-patch -N).

>> +--- a/configure	2017-08-11 17:37:13.000000000 +0200
>> ++++ b/configure	2018-02-08 13:54:16.002048928 +0100

 We prefer to patch configure.ac instead, and regenerate configure with

# 0000-disableIPV6-config.patch touches configure.ac
LIBLO_AUTORECONF = YES


 (But all that is of course no longer relevant if you can get away with just
passing --disable-ipv6 in _CONF_OPTS.)

>> +@@ -3233,15 +3233,15 @@
>> +
>> + # disable support for ipv6.
>> + # Check whether --enable-ipv6 was given.
>> +-if test "${enable_ipv6+set}" = set; then :
>> +-  enableval=$enable_ipv6; want_ipv6=$enableval
>> +-fi
>> +-
>> +-if test "$want_ipv6" = "yes"; then
>> +-
>> +-$as_echo "#define ENABLE_IPV6 1" >>confdefs.h
>> +-
>> +-fi
>> ++# if test "${enable_ipv6+set}" = set; then :
>> ++#   enableval=$enable_ipv6; want_ipv6=$enableval
>> ++# fi
>> ++#
>> ++# if test "$want_ipv6" = "yes"; then
>> ++#
>> ++# $as_echo "#define ENABLE_IPV6 1" >>confdefs.h
>> ++#
>> ++# fi
>> diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
>> index a4e01a6..60fa5d6 100644
>> --- a/package/liblo/liblo.hash
>> +++ b/package/liblo/liblo.hash
>> @@ -1,3 +1,7 @@
>> -# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
>> -sha1	21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
>> -md5	5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
>> +# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
>> +sha1	6aa69456787d3d6ef915281b4a0f8f2c79548ce3  liblo-0.29.tar.gz
>> +md5	b0e70bc0fb2254addf94adddf85cffd3  liblo-0.29.tar.gz

 While you're at it, could you add a locally computed sha256?

>> +
>> +# Locally computed
>> +sha1    caeb68c46fa36651acf592771d09de7937926bb3  COPYING
>> +md5 fbc093901857fcd118f065f900982c24  COPYING

 Just use a sha256 here, not sha1 and md5. Also, please add

# License files

above the license files. In this case it's obvious, but sometimes it's no so
obvious.



 Care to make these changes and resubmit the patch? When you do, please pass -v2
or --subject-prefix='PATCH v2' to git format-patch, and add a changelog to the
commit message, under your Signed-off-by, separated with ---.

 For now, I've marked your patch as "Changes Requested" in our patchwork, so
unless you resend it we will forget about it.

 Thanks a lot!
 Arnout


>> diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
>> index 3c852be..46f1ce5 100644
>> --- a/package/liblo/liblo.mk
>> +++ b/package/liblo/liblo.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -LIBLO_VERSION = 0.26
>> +LIBLO_VERSION = 0.29
>>  LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
>>
>>  LIBLO_LICENSE = LGPL-2.1+
>> --
>> 2.7.4
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
