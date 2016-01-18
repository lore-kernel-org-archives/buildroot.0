From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Jan 2016 11:37:54 +0100
Subject: [Buildroot] [PATCH] package/scrub: new package
In-Reply-To: <20160118102304.1ccbc389@free-electrons.com>
References: <1453068293-16263-1-git-send-email-s.martin49@gmail.com>
 <20160118102304.1ccbc389@free-electrons.com>
Message-ID: <CAHXCMMJTX6eyQ6R7mP_EgX74gfba-Xmghsms9S36V21BSq6+dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 18, 2016 at 10:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> On Sun, 17 Jan 2016 23:04:53 +0100, Samuel Martin wrote:
>
>> diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
>> new file mode 100644
>> index 0000000..92837a1
>> --- /dev/null
>> +++ b/package/scrub/scrub.mk
>> @@ -0,0 +1,18 @@
>> +################################################################################
>> +#
>> +# scrub
>> +#
>> +################################################################################
>> +
>> +SCRUB_VERSION = 2.6.1
>> +SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
>> +SCRUB_LICENSE = GPLv2+
>> +SCRUB_LICENSE_FILES = COPYING
>> +
>> +# tarball of the git repo, but autoreconf does not work as expected, so:
>
> "tarball of the git repo" is unclear, you should rather say: "Fetching
> from the git repo, no configure/Makefile generated".
Indeed, this is a much better wording :-)

>
> Also, how is it broken?
I'll give more detail in the respin.

>
>> +define SCRUB_AUTOCONF_HOOK
>> +     ( cd $(@D) && PATH=$(BR_PATH) $(@D)/autogen.sh )
>> +endef
>> +SCRUB_PRE_CONFIGURE_HOOKS += SCRUB_AUTOCONF_HOOK
>
> This is broken if you don't depend on host-automake, host-libtool,
> host-autoconf.
Hmm, good to know!
I somehow thought that every autotools packages would depend on these
packages...
But it totally make sense they only depend on them when autoreconf is enabled.

Regards,

-- 
Samuel
