From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 22:57:29 +0200
Subject: [Buildroot] [PATCH v4] ccache: expose control interface via
 'make ccache-options'
In-Reply-To: <CAEvN+1gw9BF6tcATOFJeoRLvVXrR2U7y3jO_KSMhNyz5Ka8Zmg@mail.gmail.com>
References: <CAAXf6LWg8YGG-yv3dvZjqswagBOMV8gmT1XsWz4KOygEbFUtGw@mail.gmail.com>
 <1381427457-25627-1-git-send-email-tjlee@ambarella.com>
 <05215539-a7b2-47a5-a319-100742fdd41a@email.android.com>
 <CAEvN+1gw9BF6tcATOFJeoRLvVXrR2U7y3jO_KSMhNyz5Ka8Zmg@mail.gmail.com>
Message-ID: <20131010225729.10b89fde@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Thu, 10 Oct 2013 12:51:27 -0700, Tzu-Jung Lee wrote:
> > Did you see my other comment about combining the ifeq statements of
> > ccache-stats and ccache-options?
> 
> Yes, but I think it probably would be better as a separate patch,
> which:
> 
>   1. either remove the ccache-stats code & and manual section
>   2. or issue warning about the obsolete usage.
> 
> So this patch alone don't affect those are currently using
> ccache-stats before they migrate to ccache-options.

I believe there might be a misunderstanding here. You seem to think
Thomas suggested to remove ccache-stats because ccache-options now
allows to do the same.

But in fact, Thomas only suggested to change:

"""
ifeq ($(BR2_CCACHE),y)
ccache-stats:
	...
endif

ifeq ($(BR2_CCACHE),y)
ccache-options:
	...
endif
"""

by

"""
ifeq ($(BR2_CCACHE),y)
ccache-stats:
	...

ccache-options:
	...
endif
"""

i.e, ccache-stats continues to exist, the only difference with your
implementation is that it sits under the same ifeq ($(BR2_CCACHE),y)
condition. It's just a minor nit.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
