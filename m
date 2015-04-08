From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 22:34:32 +0200
Subject: [Buildroot] [PATCH 2/2] *config: improve handling of BR2_LEGACY
In-Reply-To: <1422199879-7825-2-git-send-email-arnout@mind.be>
References: <1422199879-7825-1-git-send-email-arnout@mind.be>
 <1422199879-7825-2-git-send-email-arnout@mind.be>
Message-ID: <20150408203432.GB4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-01-25 16:31 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This commit reverts 8a46d4bf1f and replaces it with a different
> approach: skipping of the legacy config options is passed explicitly
> through the environment variable SKIP_LEGACY, which forces
> BR2_SKIP_LEGACY to y.
> 
> Note that it is necessary for BR2_SKIP_LEGACY to be user-visible,
> otherwise it will not be taken into account by 'make oldconfig' and
> you would be questioned about the legacy options. Also, because
> randconfig may randomly turn this option off or on, it is necessary
> to select it and not simply default to BR2_SKIP_LEGACY_FROM_ENV.

I was not very happy with a user-visible skip-legacy option, so I
respinned a version without it.

Care to have a look and see if it still addresses all your concerns?

Thanks for this initial spin! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
