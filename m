From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 11:12:16 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
In-Reply-To: <8761r6p7vk.fsf@dell.be.48ers.dk>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjoipdlk.fsf@dell.be.48ers.dk> <20131203095920.1e46375f@skate>
 <8761r6p7vk.fsf@dell.be.48ers.dk>
Message-ID: <20131203111216.5452f30d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 03 Dec 2013 11:05:19 +0100, Peter Korsgaard wrote:

>  > We've always said that it was important to keep this option so that
>  > newcomers don't enable things like coreutils, bash and so on, and use
>  > what I'd consider the default "Buildroot experience", i.e Busybox.
> 
> True.
> 
>  > What made you change your mind about this?
> 
> It mainly dates back from when those busybox alternatives didn't get
> much testing, so were likely to fail. We default to having busybox
> enabled, but I don't think we really need to make it more difficult to
> use the alternatives.
> 
> E.G. if we support bash/coreutils/.., then we should really support
> them.

I definitely agree with this last part, but I don't see how "really
supporting them" conflicts with the idea of hiding them by default to
avoid having newcomers confused by these.

If the amount of conflicts in package/Config.in is your concern, then I
believe I agree with Gustavoz suggestion of moving the dependency on
BUSYBOX_SHOW_OTHERS down to the individual package/<foo>/Config.in.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
