From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Feb 2019 21:29:09 +0100
Subject: [Buildroot] [PATCH v9 3/4] gobject-introspection: new package
In-Reply-To: <20190205192243.720c9707@windsurf>
References: <20181215233555.98482-1-aduskett@gmail.com>
 <20181215233555.98482-3-aduskett@gmail.com>
 <20190205192243.720c9707@windsurf>
Message-ID: <0bef422c-fefc-ae71-3052-06fd98e9e86b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/02/2019 19:22, Thomas Petazzoni wrote:

>> +export GIR_EXTRA_LIBS_PATH=$$($$(PKG)_GIR_EXTRA_LIBS_PATH)
> 
> This is horrible and just doesn't work. You're going to export
> GIR_EXTRA_LIBS_PATH with the value of whatever is the last parsed
> package. I don't see how this can work, and it's anyway not the
> Buildroot way of doing things.

 Of course it works - same way as exporting STAGING_DIR works in PPSH...

 Both $(PKG) and $(<PKG>_GIR_EXTRA_LIBS_PATH) are only expanded when the
(configure, build, install) rule is executed. And those rules have a PKG=...
modifier to make sure it is set to the actual package name.


> Could you explain what you are trying to achieve ? Infrastructure
> changes also probably need to be split into a separate patch.

 It makes it possible for an individual package using GIR to add extra libs. I
guess this will be required by some consumer.

 I would only add this as a follow-up patch, to prepare for a package that is
actually going to use it. That makes the use case much clearer.

 Regards,
 Arnout
