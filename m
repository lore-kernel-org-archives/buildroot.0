From: vaxon <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 01:05:55 +0400
Subject: [Buildroot] [PATCH 2/3] libdvdnav: Fix dvdnav-config
In-Reply-To: <20120926224634.7bddf310@skate>
References: <20120926193155.GA3942@gmail.com>
 <20120926193351.GA3971@gmail.com> <20120926224634.7bddf310@skate>
Message-ID: <50636E33.9030101@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/2012 12:46 AM, Thomas Petazzoni wrote:
> Dear Valentine Barshak,
>
> On Wed, 26 Sep 2012 23:33:51 +0400, Valentine Barshak wrote:
>
>> +ifneq ($(BR2_HAVE_DEVFILES),y)
>> +LIBDVDNAV_POST_INSTALL_TARGET_HOOKS += LIBDVDNAV_TARGET_CLEANUP
>> +endif
>
> We generally prefer positive logic:
>
> ifeq ($(BR2_HAVE_DEVFILES),)
> ...
> endif

The ifneq(($BR2_HAVE_DEVFILES),y) was copy-pasted from other .mk file 
and it seems to be used much more often than ifeq($(BR2_HAVE_DEVFILES),).

Thanks,
Val.

>
> Thomas
>
