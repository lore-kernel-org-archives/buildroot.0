Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D33B61129;
	Tue,  6 Feb 2024 16:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D33B61129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5zCfUvBL_SE; Tue,  6 Feb 2024 16:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CCB612CA;
	Tue,  6 Feb 2024 16:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67CCB612CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7EE1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B25682B5E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbzBGDOcrtlY for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:15:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F57E82D2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F57E82D2F
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F57E82D2F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:15:46 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XO6prKvnDoTDCXO6qr1402; Tue, 06 Feb 2024 17:15:44 +0100
Message-ID: <40f3713a-2cbe-4cdf-9b7b-3f30d5742b56@benettiengineering.com>
Date: Tue, 6 Feb 2024 17:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240206161152.0e178414@windsurf>
 <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
 <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-CMAE-Envelope: MS4xfOwRV5+TxS0uPtoMHAb2/f8duyjy2REMrkeqjH512WkwFOjm+RQ9rOj3mMWunuZsR1yTV5Zf66qUUU+tfh9dSy9tMD5RytucnF+03SKw9M0v8ZxPGtkk
 DgvL2auuiOdkiIDRJmcM3iO+NQKi1PQHxDhQFwX3pKgasEcb832uycmZ1MIe+lwUy7Pb3xgp7KapfNoOYpzZyruq65PhZERo1gWce//1rBUJ8FeasSDNq8HQ
 fd9FzJtF8pxkEiT/jBRhYrTXSdbRIEIBax1Sm5L6f5S5a4WhzgLMSykUf2TKn0GlSWz6jWBkmGtO+iYVqEjHHEaARJxIbbdeWUwPI04GoHo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707236144; bh=LHSRMrf6B6bFKLmlrI0NqA5gg3Wt2cg3SR+60uIQ4T4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PpTs1uhOusweGkukdUCKXBrm6mYtd8nnlzdS8KuF1yoxii+UuxINu2IrhyW9R5hTg
 vYjIGIpbgt54sFZXIxZp0EJai/KjcKrpytLn3N3N//AOj1wIirvlaWsyNc/SABpG6/
 kCkYwmKHAA3XgsyFbSdjR6ftQxr/aKj6FKBO6fD49LTzimJn/ZCS58EtOKFC9Rmys5
 QbfUM6XgJrijh4C9eZgeY9v0SbLnTNrQJveJ9Qv89CxEgD+SLI6Pg/OSQgsnSibOJ2
 jhYWmfSgPYxMEPyoesPerniVWowBfCovCuIwK4SVYJ7izrsYL75G+5FRUPkQaMSod3
 l2TQgFlhUFf4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PpTs1uhO
Subject: Re: [Buildroot] [External] - [PATCH] package/attr: fix build
 failure on Microblaze architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

my thought is,

On 06/02/24 17:05, Vincent Fazio wrote:
> All,
> 
> Would it make sense to patch GCC for Microblaze to address these at the compiler level instead of constantly patching the packages?

until gcc is not fixed yes, but,

> I tested https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6 back when we were solving this problem for xz and had no issues https://gcc.gnu.org/pipermail/gcc/2023-March/240834.html

this absolutely makes sense. It would great if you could backport those
patches for all gcc versions we deal with like I've done time ago fo
OpenRisc and when they merge them upstream we can drop them after
bumping gcc versions with that patch applied.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> 
>> -----Original Message-----
>> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Giulio
>> Benetti
>> Sent: Tuesday, February 6, 2024 9:54 AM
>> To: buildroot@buildroot.org; Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>; Fabrice
>> Fontaine <fontaine.fabrice@gmail.com>
>> Subject: [External] - [Buildroot] [PATCH] package/attr: fix build failure on
>> Microblaze architecture
>>
>> On Microblaze architecture __has_attribute(__symver__) support is broken
>> and always return true even if symver is not supported so let's add a local
>> patch pending upstream to detect if symver is supported during autoreconf.
>>
>> Fixes:
>> http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078
>> bf77d2a
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...dd-detection-of-symver-gcc-attribute.patch | 56 +++++++++++++++++++
>>   package/attr/attr.mk                          |  3 +
>>   2 files changed, 59 insertions(+)
>>   create mode 100644 package/attr/0002-configure.ac-add-detection-of-
>> symver-gcc-attribute.patch
>>
>> diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-
>> attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-
>> gcc-attribute.patch
>> new file mode 100644
>> index 0000000000..15bd266d7b
>> --- /dev/null
>> +++ b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribu
>> +++ te.patch
>> @@ -0,0 +1,56 @@
>> +From 1be7c2251040f1152de9ceb5263e6e96fa5c3d75 Mon Sep 17 00:00:00
>> 2001
>> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> +Date: Tue, 6 Feb 2024 15:33:15 +0100
>> +Subject: [PATCH] configure.ac: add detection of symver gcc attribute
>> +
>> +Upstream:
>> +https://lists.gnu.org/archive/html/savannah-hackers-public/2024-02/msg0
>> +0009.html
>> +
>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + configure.ac       | 15 +++++++++++++++
>> + libattr/syscalls.c |  2 +-
>> + 2 files changed, 16 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac index 7e362e9..98477b5 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -57,6 +57,21 @@ AS_CASE([$host_os],
>> +       [linux*], [os_linux=yes])
>> + AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
>> +
>> ++AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
>> ++      gcc_cv_symver_attribute,
>> ++      [cat > conftest.c <<EOF
>> ++void foo (void) {}
>> ++__typeof(foo) foo __attribute__ ((__symver__("foo@foo"))); EOF
>> ++      gcc_cv_symver_attribute=no
>> ++      if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
>> ++          gcc_cv_symver_attribute=yes
>> ++      fi
>> ++      rm -f conftest.[cs]
>> ++])
>> ++AS_IF([test $gcc_cv_symver_attribute = yes],
>> ++      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver
>> ++attribute])])
>> ++
>> + AC_CONFIG_COMMANDS([include/attr],
>> +       [dnl
>> +       rm -rf include/attr
>> +diff --git a/libattr/syscalls.c b/libattr/syscalls.c index
>> +907560a..caa70bc 100644
>> +--- a/libattr/syscalls.c
>> ++++ b/libattr/syscalls.c
>> +@@ -32,7 +32,7 @@
>> +  * fall back to traditional .symver asm directive otherwise.
>> +  */
>> + #ifdef __has_attribute
>> +-# if __has_attribute(__symver__)
>> ++# if defined(HAVE_SYMVER_ATTRIBUTE)
>> + #  define SYMVER(cn, vn) __typeof(cn) cn
>> +__attribute__((__symver__(vn)))  # elif __has_attribute(__no_reorder__)
>> +    /*
>> +--
>> +2.43.0
>> +
>> diff --git a/package/attr/attr.mk b/package/attr/attr.mk index
>> 6ecf5c53f4..f4f911333a 100644
>> --- a/package/attr/attr.mk
>> +++ b/package/attr/attr.mk
>> @@ -11,6 +11,9 @@ ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+
>> (libraries)  ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
>> ATTR_CPE_ID_VENDOR = attr_project
>>
>> +# Flag added for patch dealing with symver in configure.ac
>> +ATTR_AUTORECONF = YES
>> +
>>   ATTR_INSTALL_STAGING = YES
>>
>>   ATTR_CONF_OPTS = --disable-nls
>> --
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> CAUTION: This email originated from outside of the organization. Do not click
>> links or open attachments unless you recognize the sender and know the
>> content is safe.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
