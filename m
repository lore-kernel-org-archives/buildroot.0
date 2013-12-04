From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Dec 2013 07:06:50 -0300
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <20131204094419.6d4d4279@skate>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>	<1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
 <20131204094419.6d4d4279@skate>
Message-ID: <529EFEBA.8040103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 05:44 AM, Thomas Petazzoni wrote:

> The first question that comes to mind is why we have a separate
> "qemu-system" package for this, instead of improving the existing
> "qemu" package, which already builds Qemu for the host, but only builds
> the user emulation mode?

Version freedom to begin with, for the system emulation you sometimes
need a special version (example: sparc won't work with 1.7.0) that might
not be the latest. You might also want this freedom for user emulation,
but then nobody guarantees you'll match system for a given architecture.
Then i also don't know what to do with the user variant, if it's going
to be used for anything or what (it's an orphan now) - maybe killing
user is an option and replace it by system?
Regards.
