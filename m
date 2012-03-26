From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 26 Mar 2012 22:28:21 +0200
Subject: [Buildroot] [PATCH v2 1/3] Add libcap-ng package.
In-Reply-To: <CAAfyv368zLwi-XO384dJLU-9MS6whAbDGgf6w3f4_HwD+5-8eg@mail.gmail.com>
References: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
 <1332792756-3381-2-git-send-email-marek.belisko@open-nandra.com>
 <CAGm1_kuGhp=zneYqKHn2Vu0tb+wtMcfU2ZGSTyg-fzV7vfzUUA@mail.gmail.com>
 <CAAfyv368zLwi-XO384dJLU-9MS6whAbDGgf6w3f4_HwD+5-8eg@mail.gmail.com>
Message-ID: <CAGm1_kvYMPD7i-mPpQTppP+Fiph4s9fhuESVQXQD2YojhFNS-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 26, 2012 at 10:21 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> On Mon, Mar 26, 2012 at 10:17 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Mon, Mar 26, 2012 at 10:12 PM, Marek Belisko
>> <marek.belisko@open-nandra.com> wrote:
>>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>>> ---
>>> ?package/Config.in ? ? ? ? ? ? ?| ? ?1 +
>>> ?package/libcap-ng/Config.in ? ?| ? 10 ++++++++++
>>> ?package/libcap-ng/libcap-ng.mk | ? 12 ++++++++++++
>>> ?3 files changed, 23 insertions(+), 0 deletions(-)
>>> ?create mode 100644 package/libcap-ng/Config.in
>>> ?create mode 100644 package/libcap-ng/libcap-ng.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index b394f18..2dc7e1f 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -377,6 +377,7 @@ source "package/argp-standalone/Config.in"
>>> ?source "package/boost/Config.in"
>>> ?source "package/libatomic_ops/Config.in"
>>> ?source "package/libcap/Config.in"
>>> +source "package/libcap-ng/Config.in"
>>> ?source "package/libdaemon/Config.in"
>>> ?source "package/libelf/Config.in"
>>> ?source "package/libevent/Config.in"
>>> diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
>>> new file mode 100644
>>> index 0000000..d1663cd
>>> --- /dev/null
>>> +++ b/package/libcap-ng/Config.in
>>> @@ -0,0 +1,10 @@
>>> +config BR2_PACKAGE_LIBCAP_NG
>>> + ? ? ? bool "libcap-ng"
>>> + ? ? ? help
>>> + ? ? ? ? The libcap-ng library is intended to make programming with
>>> + ? ? ? ? posix capabilities much easier than the traditional libcap
>>> + ? ? ? ? library. It includes utilities that can analyse all currently
>>> + ? ? ? ? running applications and print out any capabilities and whether
>>> + ? ? ? ? or not it has an open ended bounding set.
>>> +
>>> + ? ? ? ? http://people.redhat.com/sgrubb/libcap-ng/
>>> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
>>> new file mode 100644
>>> index 0000000..6ea5de4
>>> --- /dev/null
>>> +++ b/package/libcap-ng/libcap-ng.mk
>>> @@ -0,0 +1,12 @@
>>> +#############################################################
>>> +#
>>> +# libcap-ng
>>> +#
>>> +#############################################################
>>> +
>>> +LIBCAP_NG_VERSION = 0.6.6
>>> +LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
>>> +LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
>>> +LIBCAP_NG_INSTALL_STAGING = YES
>>> +
>>> +$(eval $(call AUTOTARGETS))
>>
>> Have you tried to download the package without LIBCAP_NG_SITE?
> Guess yes? Why?

AFAIK if you have package file named like packagename-version.tar.gz,
then this will be tried automatically. See vsftpd for example.

Sorry I meant LIBCAP_NG_SOURCE not SITE :-(

Yegor
