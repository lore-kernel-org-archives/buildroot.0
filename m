From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Sep 2019 19:33:17 +0200
Subject: [Buildroot] [PATCH v4 3/5] autobuild-run: account for
 reproducibility failures in get_failure_reason()
In-Reply-To: <CABM+sgoqPxJn2LzO8OJyk0Occ90kCF2z3XZ8dBg6rHWM+BZ8BA@mail.gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-3-itsatharva@gmail.com>
 <5003d4b7-0978-907b-7bc8-22aa2bec0c31@mind.be>
 <CABM+sgoqPxJn2LzO8OJyk0Occ90kCF2z3XZ8dBg6rHWM+BZ8BA@mail.gmail.com>
Message-ID: <badf2a96-51ac-894a-f691-49800b15ce90@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/09/2019 14:59, Atharva Lele wrote:
> On Sun, Sep 8, 2019 at 10:43 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 20/08/2019 16:52, Atharva Lele wrote:
[snip]
>>> +            if os.path.exists(reproducible_results) and os.stat(reproducible_results).st_size > 0:
>>> +                if self.sysinfo.has("diffoscope"):
>>
>>  It would make more sense to move this condition up - if diffoscope is not
>> installed, there will be no diffoscope-results.json. Oh, actually there will be,
>> but it's not a JSON file... So, actually, in case diffoscope is not installed,
>> we should not create diffoscope-results.json, but diffoscope-results.txt (and no
>> json).
>>
> 
> We're now outputting two files:
> 1) diffoscope-results.json for tooling purposes (reproducible_results)
> 2) diffoscope-results.txt for human-reading (reproducible_results_txt)
> diffoscope-results.txt is used if diffoscope is not installed (check
> patch 4 in the series).
> 
> So I guess after patch 4, checking if diffoscope is installed here
> doesn't make sense. If reproducible_results exists, it would mean that
> its a diffoscope outputted file.

 Ah yes.

 It would make sense to move patch 4 earlier in the series I think. It's for
sure one of the less controversial changes in the series. But that may be a
pretty complicated rebase...

 Regards,
 Arnout

[snip]
