From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 17:35:17 +0100
Subject: [Buildroot] [git commit] toolchain: add link-time-optimization
 support
In-Reply-To: <20150307172438.73f5a634@free-electrons.com>
References: <20150307142749.E241880468@busybox.osuosl.org>	<54FB23E5.3050707@mind.be>
 <20150307172438.73f5a634@free-electrons.com>
Message-ID: <54FB28C5.5040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 17:24, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sat, 07 Mar 2015 17:14:29 +0100, Arnout Vandecappelle wrote:
> 
>>  Given that this new option (probably) changes how some packages are built, I
>> think there should be a few autobuilder configs that enable it. Any volunteers
>> to take care of that?
> 
> No: the commit only allows to enable LTO support in the compiler. It
> does not start building packages with -flto, unless of course some
> packages automatically detect the availability of the LTO feature in
> the compiler and make use of it.

 That's precisely what I mean. As far as I know, there isn't a single package
where we pass something like --disable-lto. Now, I'm not sure if there is any
package at all that will automatically turn on lto, but if there are then I
think we should build it.

 However, I just realized that we are already building with external sourcery
and linaro toolchains that support lto. So we already have the tests that I wanted.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
