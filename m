From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Sep 2011 08:05:20 +0200
Subject: [Buildroot] Creating an external toolchain [was: Re: Antw:Re: Antw:
	Antw:Re: libgcc build fails on Fedora15]
In-Reply-To: <7290fd86f3ac9.4e80ae6d@home.nl>
References: <7290fd86f3ac9.4e80ae6d@home.nl>
Message-ID: <201109280805.21263.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 26 September 2011 16:55:09, MARCEL JANSSEN wrote:
> I just have one question which probably belongs in the faq (I may have
> missed something as well). I can't yet figure out how to build the output
> for different devices without recompiling the whole toolchain. I have
> several different images which are just a little different in the sense
> that they all have the same kernel but some different packages. It would
> be great if I could just switch between configs and don't have to
> recompile the whole toolchain again or even shared packages between those
> configs.

 Buildroot supports an external toolchain, but it isn't easy to create one.  
The easiest is to use a crosstool-NG toolchain: build it, install it in some 
central place, and use it as an external toolchain from buildroot.

 It would be nice if buildroot also supported creation of an external 
toolchain (based on an internal toolchain config).  The toolchain is currently 
built in output/host/usr/... and is not relocatable, so it's difficult to 
share it between different buildroot builds.

 Regards,
 ARnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110928/7a66a3c7/attachment-0001.html>
