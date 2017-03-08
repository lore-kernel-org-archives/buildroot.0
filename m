From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 09:02:05 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <trinity-6d0d7438-8afb-4b2b-9ee4-5a85dd98759c-1488956114745@3capp-mailcom-bs02>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305223726.GM3671@free.fr> <87a88xccuv.fsf@dell.be.48ers.dk>
 <bb95fc23-ae23-3f4b-da4c-13bda8aa7e07@mind.be>
 <20170307235652.10fefb7b@free-electrons.com>
 <trinity-6d0d7438-8afb-4b2b-9ee4-5a85dd98759c-1488956114745@3capp-mailcom-bs02>
Message-ID: <20170308090205.6bfdf8e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Mar 2017 07:55:14 +0100, daggs wrote:

> my apologies, I've missed the initial mail with all the mails I'm getting.
> I have a more direct line of communication to upstream, I'll try contacting them. will update asap.

OK, thanks.

> as there is no x11 driver for this board (still pending review, not that it matters now), the usage of this pkg is rather limited.

Well, I did some comments on your xdriver_xf86-video-odroidc2 on
December 18, and you never came back with a new iteration of the
patches. So I did an additional review yesterday, and marked the
patches as Changes Requested in patchwork.

> the main usage is to run kodi, afaik kodi doesn't depends on libepoxy, so depending the pkg on kodi for now might be a valid solution.

This is really not clean at all, and I'm not sure it won't create a
circular dependency at the Config.in level.

> thoughts?

I think it's much easier to fix the original problem. We can fix the
issue by using the official khrplatform.h header, *BUT* I wanted
upstream to confirm that this is the correct thing to do. Indeed, the
khrplatform.h provided by the odroid-mali code does not use the same
size for the Khronos data types as the official Khronos header.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
