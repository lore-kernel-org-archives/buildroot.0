From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 10:56:13 +0200
Subject: [Buildroot] [PATCH] live555: fix library installation
In-Reply-To: <5534BAF3.1080305@lucaceresoli.net>
References: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>
 <20150419134235.18c914b0@free-electrons.com>
 <5534BAF3.1080305@lucaceresoli.net>
Message-ID: <20150420105613.7c8262d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 20 Apr 2015 10:38:11 +0200, Luca Ceresoli wrote:

> At first I just wanted to keep a sort of "backward compatibility", at
> least at the configure level. But I really prefer to simplify the
> package by installing everything.

Well, it's not really "backward compatible" because now you have 3
options to enable/disable the installation of 3 binaries, but the
package nonetheless installs gazillions of other binaries. So it
doesn't make much sense to have options just for those 3 binaries.

> BTW, there should be a simple way to skip installation of all
> executables, by tweaking the live555 makefiles. But I don't think it
> would be very nice to conditionally apply a patch based on config
> options. Do you agree?

No, conditional patches are a no-go. This would only be possible if you
had a patch that can always be applied, and then the .mk file calls
"make install-all" or "make install-lib" or something like that. But if
it's not planned in the live555 build system, I don't think it's really
worth doing the change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
