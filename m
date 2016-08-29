From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Aug 2016 23:31:44 +0200
Subject: [Buildroot] Nearly duplicate builds
In-Reply-To: <CAJJ6jxu3mrBgg82c1p2neOno9CtkmimzjrE2G=9BL=RRbfpcDg@mail.gmail.com>
References: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
 <da0b7f23-509b-82b0-26cf-3d30a9e2d264@mind.be>
 <CAJJ6jxu3mrBgg82c1p2neOno9CtkmimzjrE2G=9BL=RRbfpcDg@mail.gmail.com>
Message-ID: <f71bd0e0-98b0-249a-0572-5a426e89a622@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-08-16 19:54, Steve Calfee wrote:
> HI Arnout,
> 
> On Sat, Aug 27, 2016 at 4:46 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Kenneth,
>>
>>  What you're asking is unfortunately not simple...
>>
> snip
>> externally. Any host tools that are needed by this script can be included in the
>> external toolchain.
>>
> 
> Please explain this line?
> 
> It seems to me with an external toolchain, the biggest overhead after
> a make clean is the host tools (especially if you build the linux
> kernel separately too). If you need python or some other big package
> building the host stuff is a major time sink. It would be wonderful if
> the host tools could also be external to the build like the toolchain.
> I did not know they could be part of the external toolchain?

 You can build anything as part of the external toolchain. However, buildroot
doesn't recognize whatever you have built as something that is already
available. In other words, if something depends on the things that you added to
the external toolchain, it will just get built again instead of using the
version from the external toolchain.

 For the host tools that you use in a post-build or post-image script, however,
that doesn't matter, because it's not considered a dependency by buildroot.

 In the proposal I made, the post-image script would be used outside of
buildroot, so you have to make sure that any host tools you want to use are
either available on the system, or are part of the external toolchain. The
latter is IMHO simpler and easier to control.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
