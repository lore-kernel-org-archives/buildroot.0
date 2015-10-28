From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 22:20:29 +0100
Subject: [Buildroot] [PATCH v2] package/python-pillow: new package
In-Reply-To: <CA+TH9VnZK+_B-mnJDdDqWAAXwAFM0722s2ZRmzbwWdjfyawPzw@mail.gmail.com>
References: <1445549143-10983-1-git-send-email-angelo.compagnucci@gmail.com>
 <20151023102251.4766d6fc@free-electrons.com>
 <CA+TH9VnZK+_B-mnJDdDqWAAXwAFM0722s2ZRmzbwWdjfyawPzw@mail.gmail.com>
Message-ID: <56313C1D.8090001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-10-15 12:37, Angelo Compagnucci wrote:
> Dear Thomas Petazzoni,
> 
> 2015-10-23 10:22 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
[snip]
>> However, I believe you shouldn't declare any of those options. Just
>> remove them from the Config.in, and use "implicit optional
>> dependencies": i.e python-pillow will have jpeg support if the jpeg
>> package is enabled.
> 
> No problem here, but how can a user detect if a dependency will be
> compiled if he's not informed explicitly about that dependency? A user
> should read the INSTALL file distributed with the software?

 No, the user should read the Config.in help text. In other words, just add a
list there of the libraries that you can select. Something like:

	  Pillow relies on external libraries to provide support various
	  image formats. Select the corresponding package(s) to get this
	  support. Pillow can use jpeg, zlib (for PNG), tiff, freetype, webp,
	  and openjpeg (JPEG-2000).

> 
> Making options explicit makes clear that if I want wepb support I
> should mark the corresponding checkbox.
> 
> In this case the software installer is smart to detect installed
> libraries, but in another case we should have provided build options
> explicitly. Where's the difference? (this is a honest question, just
> for understand the rule!)

 The idea is that we only add package options for non-obvious optional
dependencies. For example, that the jpeg library adds jpeg support to pillow is
quite obvious.

 We don't want to add new config options everywhere because that would really
explode the number of config options.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
