From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 12:58:30 +0200
Subject: [Buildroot] [PATCH 1/2] check-host-rpath: support symlinks in
 rpath
In-Reply-To: <2359483.ncWTPxTSyx@sagittea>
References: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
 <1475230194-18524-2-git-send-email-jezz@sysmic.org>
 <8fb2b678-db51-9ba7-c07d-d7956c9708db@mind.be> <2359483.ncWTPxTSyx@sagittea>
Message-ID: <8e769c56-a489-7e06-f0c9-83f7223ed214@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jerome,

On 05-10-16 10:54, J?r?me Pouiller wrote:
> Hi Arnout,
> 
> On Tuesday 04 October 2016 23:33:34 Arnout Vandecappelle wrote:
>> On 30-09-16 12:09, J?r?me Pouiller wrote:
>>> If compilation path contains symlinks, rpath may sometime contains
>>> symlinks and sometime canonicalized path.
>>>
>>> A pratical example:
>>>   $ ln -s /opt/buildroot /opt/buildroot-symblink
>>>   $ cd /opt/buildroot-symlink
>>>   $ make O=out
>>>   $ make -C out package-rebuild
>>>
>>> This last command produce an error since already installed host
>>> binaries contains /opt/buildroot/out/host/usr/lib as rpath while
>>> check-host-rpath expect /opt/buildroot-symlink/out/host/usr/lib
>>>
>>> This patch canonicalize all paths used in check-host-rpath in order
>>> to avoid problem
>>
>>  Wouldn't this also be fixed by
>> http://patchwork.ozlabs.org/patch/613854/ ? With that patch (series)
>> applied, there shouldn't be any symlinks anymore once the real make
>> starts.
> 
> I didn't saw Samuel's patch. I will test it soon. I think it supersede 
> mine.

 You never came back to this. We will apply Samuel's patches soon. Can you
re-test after that and resubmit your patches if still needed?

 I've marked you patches as Rejected for now.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
