From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Aug 2018 00:39:09 +0200
Subject: [Buildroot] [PATCH 1/1] linux: build default dtbs if no
 specific source files given
In-Reply-To: <0b7c3cae-e5e2-33a7-dd73-5f5d729cbab2@je-eigen-domein.nl>
References: <1533313674-722-1-git-send-email-bos@je-eigen-domein.nl>
 <20180816223444.41200c10@windsurf>
 <0b7c3cae-e5e2-33a7-dd73-5f5d729cbab2@je-eigen-domein.nl>
Message-ID: <38efc131-235a-e950-48be-cb97db1b6c63@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/08/2018 23:11, Floris Bos wrote:
> Hi,
> 
> On 08/16/2018 10:34 PM, Thomas Petazzoni wrote:
>> Hello Floris,
>>
>> Thanks for this contribution. It definitely makes sense to support this.
>>
>> On Fri,? 3 Aug 2018 18:27:54 +0200, Floris Bos wrote:
>>> Currently if one wants to build dtbs, one has to specify which
>>> dts source files to build exactly.
>>> This is inconvenient, and some platforms use non-standard file
>>> names that are currently not supported by buildroot.
>>> (e.g. the overlay files in downstream Raspberry Pi kernel)
>> Could you give some more specific example of those non-standard names ?
>> Are we talking about .dtbo files ?
> 
> Yes.
> Name of source file doesn't match installed file.
> 
> overlays/dwc2-overlay.dts -> overlays/dwc2.dbto
> 
>> I see one problem with see: no all architecture that support building
>> dtbs have the dtbs_install target.
> 
> Would consider that a bug in the architecture's Makefile.

 powerpc is the oldest architecture using dtb, and it doesn't have it...

 The builddeb script has an explicit
if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then ...

> 
>> Can we install all *.dtb* for example ?
> 
> Don't think that will deal with the "-overlay" in my example.

 Yes it will, because the binary to install will be called .dtbo so it matches
the *.dtb* pattern.

 Regards,
 Arnout

> 
> 
> 
> Yours sincerely,
> 
> Floris Bos
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
