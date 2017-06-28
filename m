From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jun 2017 12:44:10 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <85b0e9c2-b78e-66f7-7cd2-7cb081f79799@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <d447e85c-6c32-d73f-377c-cf109c425511@mind.be>
 <822e2bea-84d3-30a6-3c88-1aa2813cee4e@grandegger.com>
 <c66dd2a5-831d-bee4-17cf-1ce38f0a3b6f@mind.be>
 <85b0e9c2-b78e-66f7-7cd2-7cb081f79799@grandegger.com>
Message-ID: <8594cf03-bfc0-11e9-3165-8aae67df7b6d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-06-17 08:51, Wolfgang Grandegger wrote:
> Am 28.06.2017 um 00:41 schrieb Arnout Vandecappelle:
[snip]
>>   But as I understand it, your proposal is to commit your series as is, with the
>> scanning done only in the finalize step, and refactor it with elf files lists
>> later?
> 
> That would be a good starting point. The per package sanitation requires quiet
> some changes to the build infrastructure.
> 
>>> If we do not need the per package list lateron, we could create it
>>> temporarily, call "fix-rpath" to do the sanitation and delete it afterwards. Or,
>>> even simpler, fix-rpath could work on ".br_filelist_before" and
>>> ".br_filelist_after" directly... that seems not too difficult to implement. What
>>> do you think?
>>
>>   The latter was actually what I had in mind: refactor the step_pkg_size_end to
>> save the output of comm in a temporary file, and use that file to call the
>> fix-rpath script. That temporary file is basically $(@D)/.target-files.txt.
> 
> I already started to implement that approach... more soon.

 If you could post an RFC series (even if unfinished) by Saturday evening, we
can still work on it during the Summer Camp.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
