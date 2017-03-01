From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 09:35:20 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <20170301091731.5102e061@free-electrons.com>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
 <20170301091731.5102e061@free-electrons.com>
Message-ID: <19fbcec2-68a4-a287-a20f-522c94ede5e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-17 09:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 1 Mar 2017 08:58:31 +0100, Arnout Vandecappelle wrote:
> 
>>  Since you don't do any processing on the file, you could just use
>>
>> 		-DCMAKE_MODULE_PATH="$$(TOPDIR)/support/misc" \
> 
> I think the idea is that since the Buildroot.cmake platform files gets
> referenced by the toolchainfile.cmake, then Buildroot.cmake anyway
> needs to be installed in $(HOST_DIR)/usr/share/buildroot, so we can
> just as well point CMake to this place.
> 
>> and avoid copying the file around. Of course, in that case, support/cmake is
>> probably a better place to put the file :-)
> 
> No: copying the file is needed, otherwise our toolchainfile.cmake file
> no longer works for people using it outside of Buildroot.

 Good point. I still think it should be in staging rather than host, but for
sure it's more important to keep them together.

 Therefore:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
