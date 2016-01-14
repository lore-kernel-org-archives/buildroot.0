From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jan 2016 22:41:52 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <20160113095153.6b4f95cb@free-electrons.com>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160113095153.6b4f95cb@free-electrons.com>
Message-ID: <56981620.5020805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-01-16 09:51, Thomas Petazzoni wrote:
> Zoltan,
> 
> On Wed, 13 Jan 2016 03:52:22 +0100, Zoltan Gyarmati wrote:
> 
[snip]
>>  ...comment-block-of-fdt_get_property_namelen.patch |   32 +
>>  .../0002-fdt-Add-a-function-to-count-strings.patch |  246 +++
>>  ...d-a-function-to-get-the-index-of-a-string.patch |  159 ++
>>  ...004-fdt-Add-functions-to-retrieve-strings.patch |  173 ++
> 
> I am not supper happy with the solution of having those DTC patches
> specifically for the BeagleBone platform. If I understand correctly,
> those patches are needed to get the DT overlay to work, right ?

 I was the one suggesting that approach...


> We had the same problem for the C.H.I.P platform, so it would also be
> useful for us to have a overlay-capable DTC. You can see what my
> colleague Antoine T?nart did:
> 
>   https://github.com/NextThingCo/CHIP-buildroot/commit/1a73b514d204d0c6e9100d53011a11d99fd8b778
>   https://github.com/NextThingCo/CHIP-buildroot/commit/f3334df58611ff3cae5fd62906423fdce3d80d24
>   https://github.com/NextThingCo/CHIP-buildroot/commit/c4457eba3099f5ca514c06bb35b42772178a151a
> 
> It is not ideal because it relies on a separate dtc-overlay package,
> which packages a different version of dtc, which Antoine has cooked on
> his own github repository.
> 
> We really need to find a solution that is acceptable in the upstream
> Buildroot, and applies to multiple platforms.

 Just thinking out loud: we could add an option to the dtc package that selects
the overlay version.

 The canonical approach, however, would be to convert dtc to a virtual package
with a dtc-kernel-org and a dtc-overlay implementation.

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
