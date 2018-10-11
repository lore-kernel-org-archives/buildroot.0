From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Oct 2018 21:23:43 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <87in281h7o.fsf@dell.be.48ers.dk>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com>
 <20181010212630.7f47270e@windsurf> <20181010202425.GN2869@scaer>
 <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be>
 <87in281h7o.fsf@dell.be.48ers.dk>
Message-ID: <20181011192343.GA31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On 2018-10-11 20:16 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >  'imply' is syntactic sugar for 'default y if ...'. The *only* thing it changes
>  > is the place where you put the imply. (To be exact, it is the same as 'default
>  > ...' because it propagates the m/y/n state to the default, not just y/n. But
>  > since we don't use m, it doesn't matter.)
> 
>  >  For this specific case, it is pretty obvious that putting a 'default y if
>  > BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL

As the submitter said "in general it is preferred due to better
performance", why don't we just have, in webkitgtk:

    select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL if BR2_PACKAGE_GST1_PLUGINS_BAD

Or even further:

    select BR2_PACKAGE_GST1_PLUGINS_BAD
    select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL

Of course, that requires propagating the required dependencies...
But since webkitgtk already depends on libgtk3, which itself depends on
LIBEGL_WAYLAND or LIBGL, we're not too far off...

>  > would be crazy. On the other hand, adding the imply in webkitgtk looks nice,
>  > concise and clear.

Sorry, I am still not convinced that using 'imply' in Buildroot is a
good idea overall... :-(

> Exactly, which is why I suggested it to Adrian.

On the other hand, this is webkitgtk we're speaking here. It's already
huge, really huge. What would be the problem with 'select'ing
GST1_PLUGINS_BAD_PLUGIN_GL if it is known to be the 'best' solution
(even if not strictly required) ?

But I'm done speaking about it now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
