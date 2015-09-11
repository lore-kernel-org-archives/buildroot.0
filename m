From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 08:57:35 +0200
Subject: [Buildroot] [PATCHv3 02/15] directfb: mark as available only
	for gcc >= 4.5
In-Reply-To: <8737ymh3eb.fsf@dell.be.48ers.dk>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441144876-2628-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <8737ymh3eb.fsf@dell.be.48ers.dk>
Message-ID: <20150911085735.4ec436c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 10 Sep 2015 14:20:28 +0200, Peter Korsgaard wrote:

> Not directly related to this commit, but even though directfb is a
> library I think it makes more sense to use 'depends on' (and default y)
> for these options for "big libraries", as:
> 
> - People are likely to explicitly enable those libraroes if they want
>   them
> 
> - Gstreamer support size is insignificant compared to the library, and
>   people are likely to want E.G. directfb support in gstreamer if they
>   enable directfb and gstreamer, so the default y is nice
> 
> - We don't need to propagate the (often fairly complicated) library
>   dependencies to the users
> 
> This applies for E.G. wayland and Qt as well.
> 
> But that can (should) be handled outside this series.

I agree. In fact for DirectFB there is already a mix of "select" and
"depends on". But we can't blame anyone: it's not always very clear
which one to use, so we have to clarify such things once a package
starts to be used by a significant number of other packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
