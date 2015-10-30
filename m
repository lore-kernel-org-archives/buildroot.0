From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 17:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] openssl: remove patch's git-hash to
 support fat/ntfs systems
In-Reply-To: <CALe+oY-tjfi_UmiL6kS6FmSbX2TiQhFW=E6yKjs+aXYyFuO21Q@mail.gmail.com>
References: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
 <56339E03.4050303@mind.be>
 <CALe+oY-tjfi_UmiL6kS6FmSbX2TiQhFW=E6yKjs+aXYyFuO21Q@mail.gmail.com>
Message-ID: <5633A1FE.3030906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-10-15 17:57, James Knight wrote:
> Arnout,
> 
> On Fri, Oct 30, 2015 at 12:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> I think that one trumps supporting FAT or NTFS as your DL_DIR filesystem, so
>> that's a NACK from me.
> 
> Agreed.
> 
> I'll try to find a way to work around the setup I have then, maybe try
> a sanitation method (like you've suggested).

 The sanitation is an infrastructural change, of course. I would start with
replacing all the uses of <pkg>_SOURCE with a newly introduced <pkg>_DL_SOURCE
(which also includes the DL_DIR). Then in a second step you can sanitize
_DL_SOURCE and update the download infra.


 Regards,
 Arnout


> I'll mark the patch as
> rejected. I'd be curious if anyone else has any other comments on
> this.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
