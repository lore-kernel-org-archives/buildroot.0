From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 10:32:33 -0300
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
 DM365 processors
In-Reply-To: <20111018144934.2a9ed9b7@skate>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
 <201110181123.03836.arnout@mind.be> <201110181433.26332.arnout@mind.be>
 <87wrc2321l.fsf@macbook.be.48ers.dk> <20111018144934.2a9ed9b7@skate>
Message-ID: <6dc92c4ade378e76ec6ca91636e3d400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.10.2011 09:49, Thomas Petazzoni wrote:

> There is a similar problem with the TI OpenGL drivers. The Graphics 
> SDK
> available from TI website is a huge auto-extractable binary which
> contains (amongst a ton of crap) the binary driver. Some embedded 
> Linux
> build systems (such as OpenBricks) have re-packaged only the 
> necessary
> bits, have put those tarballs online and use them in their package
> recipes instead of the original TI stuff.
>
> Ideally, I'd prefer to use the original TI stuff as well, but the 
> size
> of the downloads are horribly huge, and they keep moving things 
> around
> on their website all the time. It is not even simple to find what it
> the latest version of what. TI's management of software support is
> really horrible.
>
> Regards,
>
> Thomas

I had a go at those bits some time ago for a customer reaching to the 
point of having OMAP3 OpenGL for Qt but it's a bit timerot now.
Could be revived but i never did much about it because of the huge 
tarball problem and granular CPU integration: different OMAP3 processors 
have differing OpenGL capabilities/accelerators and it changes the build 
logic somewhat (different includes and libraries for each target).
Doing an OMAP3 model selection in the OpenGL/Qt menu isn't clean IMHO 
since that same selection could possibly be used in the future for other 
package bits as well.
Regards.
