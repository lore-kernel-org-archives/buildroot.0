From: xlcwu <xlcwu.taiwan@gmail.com>
Date: Tue, 20 Jun 2017 13:12:23 +0800
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.1
In-Reply-To: <20170619220921.49a88bd9@windsurf.home>
References: <20170618212004.32001-1-peter@korsgaard.com>
 <20170619220921.49a88bd9@windsurf.home>
Message-ID: <CAGtPAdVCrcJuGdEuTquYpoJpO5qUmi8QRQWVzrGWTUb1MPumSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Peter,

patch failed need a little cosmetic:

a/expat/configure.ac -> a/configure.ac
b/expat/configure.ac -> b/configure.ac

$ git diff package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
diff --git a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
b/package/expat/000
index a302553..e4fd7e8 100644
--- a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
+++ b/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
@@ -8,13 +8,13 @@ There is no such thing but we need to link (not just
compile) to realize.

 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- expat/configure.ac | 2 +-
+ configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/expat/configure.ac b/expat/configure.ac
+diff --git a/configure.ac b/configure.ac
 index 1357c9a..444c002 100644
---- a/expat/configure.ac
-+++ b/expat/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -130,7 +130,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([


xlcwu


On Tue, Jun 20, 2017 at 4:09 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 18 Jun 2017 23:20:04 +0200, Peter Korsgaard wrote:
>> Fixes:
>>
>> - CVE-2017-9233 - External entity infinite loop DoS. See:
>>   https://libexpat.github.io/doc/cve-2017-9233/
>>
>> - CVE-2016-9063 -- Detect integer overflow
>>
>> And further more:
>>
>> - Fix regression from fix to CVE-2016-0718 cutting off longer tag names.
>>
>> - Extend fix for CVE-2016-5300 (use getrandom() if available).
>>
>> - Extend fix for CVE-2012-0876 (Change hash algorithm to William Ahern's
>>   version of SipHash).
>>
>> Also add an upstream patch to fix detection of getrandom().
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  ...c-Fix-mis-detection-of-getrandom-on-Debia.patch | 29 ++++++++++++++++++++++
>>  package/expat/expat.hash                           |  8 +++---
>>  package/expat/expat.mk                             |  4 ++-
>>  3 files changed, 36 insertions(+), 5 deletions(-)
>>  create mode 100644 package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
