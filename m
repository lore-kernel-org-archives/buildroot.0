From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 15:26:01 +0100
Subject: [Buildroot] [PATCH v4 3/5] package/gutenprint: Un-deprecate and
 bump version to 5.2.10
In-Reply-To: <CALdGskKj_MrtZCWdYHZ7XKgaHHuffV1qabrfncXpjzkBdRC=ng@mail.gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-4-git-send-email-olivier.schonken@gmail.com>
 <20160122001550.406e6207@free-electrons.com>
 <CALdGskKj_MrtZCWdYHZ7XKgaHHuffV1qabrfncXpjzkBdRC=ng@mail.gmail.com>
Message-ID: <56A4DEF9.5050900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 14:50, Olivier Schonken wrote:
> Hi Thomas, All
> 
> Attached is a patch that worked for fixing the build issue you had with
> Gutenprint.  Seems they have a bit of issues with code quality control/review
> upstream.
> For the print-olympus.c file the way in which they checked the endianess
> differed from the rest of the project, and the also had a variable in genppd.c
> that was dependant on a HAVE_ZLIB define, but not encased in an #ifdef block.
> 
> If the changes are in order I will resubmit using the usual methods.
> 

 A few small comments:

 It should be two separate patches, because they do two unrelated things.

 The patch commit log for the endianness fix could be improved a little, e.g.

print-olympus.c: fix endianness detection

The __LITTLE_ENDIAN__ and __BIG_ENDIAN__ macros are not a reliable way to detect
endianness. Instead, rely on __BYTE_ORDER like we do in the rest of the code.


 There's a redundant newline in the patch description.

 And finally, don't forget to send these patches upstream.

 Thanks,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
