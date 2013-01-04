From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jan 2013 14:10:38 -0300
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <20130104173116.222de178@skate>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar> <20130104173116.222de178@skate>
Message-ID: <50E70D0E.5080600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2013 01:31 PM, Thomas Petazzoni wrote:

> Sounds ok, but instead:
> 
> DIVINE_CONFIG_FIXUP = $(STAGING_DIR)/usr/bin/divine-config
> 
> And also need to support multiple files being passed.

Yes, it was a sample rather than a finished idea.
Multiple files is mandatory, one package could install more than one
*-config file.
Full path, i'm not completely sold on that, at least not with
$(STAGING_DIR).
It's a given, there's no other place where we want to fix it, so i'd say
just "/usr/bin/divine-config" without the prefix in the package files.
So, Stefan, do you want to do this? ;)
Regards.
