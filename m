From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 31 Mar 2014 14:31:49 +0200
Subject: [Buildroot] rsync fails to build
In-Reply-To: <20140331102604.49ccba2b@skate>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate> <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
 <20140329180038.7acf5143@skate> <5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
 <20140329232048.45ced2b2@skate> <F9B5E559611E4C1580A5E85C9C0023A7@JohanW7>
 <20140331102604.49ccba2b@skate>
Message-ID: <1D90109776E04A139DC0C95B4F945F47@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

I have 2 buildroot build trees, since they are run on the same user account they share the same buildroot-ccache directories.
Could this be a cause of ccache trouble ?

Regards, Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: maandag 31 maart 2014 10:26
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] rsync fails to build

Dear Sagaert Johan,

On Mon, 31 Mar 2014 02:36:43 +0200, Sagaert Johan wrote:

> Yes , I can confirm rsync builds with the ccache disabled.

So seems like you changed some toolchain options, or some other thing, and ccache is re-using some invalid previous cache entries.
We know we have some things to improve on the ccache front, a few patches have been floating around for some time.

> I have kept the 2 rync build dirs in case they could be of any use.

I guess comparing the two config.log files will help, but I'm not sure I want to debug a problem related to the invalid re-use of
ccache results.

> As a sidenote :
> nettle sometimes (1 on 20 ) throws a build error, and just starting 
> make again without actually removing its build directory just resumes the build without error.

This looks like a parallel build issue...

> It never gives an error when the ccache is off.

... but it should also occur with ccache I believe, unless maybe the speed-up provided by ccache "hides" the parallel build issue. I
don't think we have seen nettle build issues in the autobuilders that looked like parallel build problems, though.

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
