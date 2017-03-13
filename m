From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Mar 2017 23:15:48 +0100
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME
 hidden config option
In-Reply-To: <1489357076-31990-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489357076-31990-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <796668f8-3e79-7447-4d6b-b1947a9560ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-03-17 23:17, Thomas Petazzoni wrote:
> This config option corresponds to the string returned by readelf for
> the "Machine" field of the ELF header. It will be used to check if the
> architecture of binaries built by Buildroot match the target
> architecture.

 I'm a bit uncomfortable with encoding these names, since there is no real
guarantee that the binutils developers won't decide to change the name at some
point. Ideally we should just use the hex value, but it seems readelf (nor any
other tool) has an option to get it. Compiling our own ELF interpreter (or
patching patchelf) is a bit too much.

 Therefore:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v2:
>  - Improve comment above BR2_READELF_ARCH_NAME to explain that it is the
>    value of the "Machine:" field in readelf output, and point to the
>    readelf source code for the list of possible values.
> 
> Changes since v1:
>  - None
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
