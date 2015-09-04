From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Sep 2015 12:39:29 +0200
Subject: [Buildroot] [bug] bootwrapper runs before linking initrd
In-Reply-To: <87pp1yo6l6.fsf@dell.be.48ers.dk>
References: <55E8C311.6000404@mentor.com>
 <20150904105409.53804439@free-electrons.com>
 <87pp1yo6l6.fsf@dell.be.48ers.dk>
Message-ID: <20150904123929.085e85bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 04 Sep 2015 11:51:33 +0200, Peter Korsgaard wrote:

>  > I must say I'm not thrilled by making such major changes to Buildroot
>  > just for the sake of this very specific use-case. But we probably don't
>  > have much choice.
> 
> I don't know any details of this boot wrapper, but perhaps we could
> change the package to only build the host tool and simply ask people to
> write a post-image script to invoke it with the correct arguments once
> the build is completely done, similar to what we do for other custom
> "post processing" tasks?

Doesn't work: the kernel image is *linked* into the boot wrapper. So
really, it's not just a post-processing tool, you need the kernel image
to build the wrapper.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
