From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 22:55:11 +0200
Subject: [Buildroot] [PATCH v1] package/collectd: needs host-bison
In-Reply-To: <20191006152909.5113de2f@gmx.net>
References: <20191003152922.21881-1-ps.report@gmx.net>
 <20191005232144.4974bac8@windsurf.home> <20191006151851.739c4baf@gmx.net>
 <20191006152909.5113de2f@gmx.net>
Message-ID: <07da742a-3473-5f30-140b-795386731f9e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/10/2019 15:29, Peter Seiderer wrote:
> Re-add: CC: buildroot at buildroot.org
> 
> Regards,
> Peter
> 
> On Sun, 6 Oct 2019 15:18:51 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> 
>> Hello Thomas,
>>
>> On Sat, 5 Oct 2019 23:21:44 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>>> On Thu,  3 Oct 2019 17:29:22 +0200
>>> Peter Seiderer <ps.report@gmx.net> wrote:
>>>
>>>> Since 5.9.1 the file src/liboconfig/parser.c is missing from the
>>>> tar download file, triggering the need for host-bison.
>>>>
>>>> Fixes [1]:
>>>>
>>>>   configure: error: bison is missing and you do not have ./src/liboconfig/parser.c. Please install bison
>>>>
>>>> [1] http://autobuild.buildroot.net/results/4e6f3e5fd0e64f166ae4f7db4832b37ae1fa99e0
>>>>
>>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>>> ---
>>>>  package/collectd/collectd.mk | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>
>>> Applied to master, thanks. Could you report this issue to upstream, and
>>> see if they consider this as a bug of their tarball, or if they want
>>> users to install bison to build collectd?
>>
>> The seems to be more problems with the tarball generation (xz archive in
>> tar.bz file, misnamed version string, etc., see [1]), added another
>> comment about the missing file ([2])...

 Given the following comment [3] I think it might be better to revert collectd
to 5.9.0:

"All these issues are bugs, because release process done by another person than
before. All that is done w/o explicit permission from project "owner", so
results are expected."

 Or, of course, we can wait a bit to see if a proper 5.9.3 gets released...


 Regards,
 Arnout


[3] https://github.com/collectd/collectd/issues/3293#issuecomment-538746431

>>
>> Regards,
>> Peter
>>
>> [1] https://github.com/collectd/collectd/issues/3293
>> [2] https://github.com/collectd/collectd/issues/3293#issuecomment-538746116
>>
>>>
>>> Thanks!
>>>
>>> Thomas
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
