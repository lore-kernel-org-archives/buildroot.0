From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 09:24:04 +0200
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <CANQCQpYxLkzMU_GA_-YV90F9R06pkQb30zOLjf1UdwaJQ4GpuA@mail.gmail.com>
References: <20170717212859.12581-1-arnout@mind.be>
 <CANQCQpYxLkzMU_GA_-YV90F9R06pkQb30zOLjf1UdwaJQ4GpuA@mail.gmail.com>
Message-ID: <ff93fccb-be25-023c-7359-eb24e793cb9e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 04:45, Matthew Weber wrote:
> Arnout,
> 
> On Mon, Jul 17, 2017 at 4:28 PM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
>> This option allows to specify which Buildroot git repository to clone.
>> This can be useful in several situations:
>> - to use a different mirror in case you don't have a good connection to
>>   github;
>> - for debugging this script;
>> - to point to a local, patched repository you want to test.
>>
>> Note that the clone/pull will use the currently checked out branch of
>> the repository if it is non-bare, which is ideal for testing.
>>
>> Since switching repositories may also switch branches, we use a git
>> fetch/checkout sequence instead of doing a git pull. With git pull, the
>> branches would be merged instead of switched. To avoid polluting the
>> log with the long git message about a detached head, while still
>> getting some useful output from git, pass the --detach option to
>> git checkout.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> I carry some local changes for tailoring the repo for similar reasons
> (I while back I submitted something similar before the input parsing
> was cleaned up).  What do you think about also making it a config file
> option?

 Sounds good to me. Feel free to do that and resubmit together with this one as
a series, or in a single patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
