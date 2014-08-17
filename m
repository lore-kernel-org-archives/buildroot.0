From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 Aug 2014 19:34:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/localedef: don't use
 config.site when cross-compiling
In-Reply-To: <20140815222816.0bb9e6d8@free-electrons.com>
References: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
 <20140815222816.0bb9e6d8@free-electrons.com>
Message-ID: <53F0E797.3090706@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 15/08/2014 22:28, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Wed, 13 Aug 2014 23:05:23 +0200, Romain Naour wrote:
>> On fedora 20 64bits host, the file /usr/share/config.site contains
>> a fix for installing libraries into /lib/lib64 on 64bits systems
>> that redefine libdir in the generated Makefile.
>>
>> This causes the bug 7262 reported Normen Bolling.
>>
>> Set CONFIG_SITE to "no" to not use config.site
>>
>> fixes: https://bugs.busybox.net/show_bug.cgi?id=7262
>>

I noticed that other autotools packages continue to load the config.site file
from host.

"configure: loading site script /usr/share/config.site"

I don't know if other packets may be impacted by this issue ...

Maybe move CONFIG_SITE=no to pkg-autotools.mk ?

Best regards,
Romain
