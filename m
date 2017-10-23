From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:32:57 -0200
Subject: [Buildroot] [next v2 3/7] testing/infra/builder: allow to
 override logfile
References: <30031227-952e-c7c0-cae1-f9e040d9b201@mind.be>
Message-ID: <59ed54d9581e4_5e463fc3ac9744ec18581@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 05:50 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 27-08-17 00:20, Ricardo Martincoski wrote:
>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> 
>> Some test cases can use only the configure step as setup, while the
>> build is part of the test itself.
>> Allow the caller to build() to override the logfile used. This way all
>> the log for the actual test can be directed to *-run.log.
> 
>  This feels weird to me. If you need this kind of argument, then there is

Rethinking now, after your comments, this patch is hackish.

> something wrong with the logfile member of Builder.
> 
>  Your explanation here seems to suggest that the only reason to have this is to
> split the -build and the -run logs so the -run logs contains something useful
> for the git tests. I don't think that that's a good enough reason. What's wrong
> with collecting all the output in the -build log?

Nothing wrong. I will remove this patch from the series.

> 
>  But looking at later patches, it looks like you're actually trying to solve a
> problem here that a file is opened from two places and they run over each other.
> If that is the case, I think a better solution needs to be found to handle the
> log files. Could be as simple as the log file being maintained by the test class
> itself, and passed as an argument to the Builder functions every time.

That's not the case. I was only trying to get all the "setup" output to
-build.log and all the "run" output to -run.log. Silly and not needed.

Regards,
Ricardo
