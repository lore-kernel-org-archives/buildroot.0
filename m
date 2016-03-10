From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 17:08:47 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <8760wum7dj.fsf@dell.be.48ers.dk>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk>
Message-ID: <56E1D44F.70807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/16 16:59, Peter Korsgaard wrote:

> I don't know much about mesa, but I thought the Intel driver didn't use
> galium? Is this some kind of alternative to the dri driver?

You've got both, from mesa configure:

--with-gallium-drivers[=DIRS...]
    comma delimited Gallium drivers list, e.g.
    "i915,ilo,nouveau,r300,r600,radeonsi,freedreno,svga,swrast,vc4,virgl"
    [default=r300,r600,svga,swrast]

Enabling it builds /usr/lib/dri/i915_dri.so besides others you may have 
selected (in my case kms_swrast_dri.so and swrast_dri.so).
Otherwise we can ask Bernd, but i get that additional driver with this 
option, and it's documented.
Regards.
