From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Sep 2019 22:35:02 +0200
Subject: [Buildroot] [PATCH] check-kernel-headers.sh: use a trap to
 remove the temporary file
In-Reply-To: <30114_1569322228_5D89F4F4_30114_250_3_20190924105026.GC3517@r-lnx-nyma7486-2>
References: <20190924024940.17631-1-unixmania@gmail.com>
 <30114_1569322228_5D89F4F4_30114_250_3_20190924105026.GC3517@r-lnx-nyma7486-2>
Message-ID: <b493eb1f-839d-d875-1384-0c3bff12ea8a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/09/2019 12:50, yann.morin at orange.com wrote:
> Carlos, All,
> 
> On 2019-09-23 23:49 -0300, unixmania at gmail.com spake thusly:
>> From: Carlos Santos <unixmania@gmail.com>
>>
>> The POSIX specification defines a 'trap <action> EXIT' mechanism that is
>> useful to perform clean-up actions in shell scripts. A trap has two main
>> advantages over hand-crafted clean-up mechanisms:
>>
>> - It runs even if the process is terminated by a SIGTERM.
>> - It runs even if the script stops due to a pipeline failure (set -e).
>>
>> Now we can make the script to stop immediately if a compilation error
>> occurs, instead of letting it try to run an unexisting program.
>>
>> This change may appear to be overkill but Buildroot is an open source
>> project and each piece of code is a potential learning tool for other
>> developments. We must strive to provide good examples.

> This last paragraph is not useful in this commit log.

 But it is very true :-)

 Regards,
 Arnout
