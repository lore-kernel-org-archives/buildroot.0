From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jul 2015 18:19:06 +0200
Subject: [Buildroot] [PATCH 2/2] heimdal: disable parallel build
In-Reply-To: <559FF0AF.8020502@zacarias.com.ar>
References: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
 <1436544308-22652-2-git-send-email-Vincent.Riera@imgtec.com>
 <559FF0AF.8020502@zacarias.com.ar>
Message-ID: <559FF07A.2010801@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure, no problem.

On 10/07/15 18:19, Gustavo Zacarias wrote:
>
>
> On 10/07/15 13:05, Vicente Olivert Riera wrote:
>
>> The commit 2fc8be39edd610623d322c71e42a06b535cbadb7 enabled parallel
>> build, but this is causing build failures like this one:
>>
>> Making all in kadm5
>> make[3]: Entering directory
>> `/home/test/autobuild/instance-0/output/build/host-heimdal-1.6rc2/lib/kadm5'
>>
>> compile_et kadm5_err.et
>> compile_et kadm5_err.et
>>    CC       ad.lo
>>      CC       chpass_c.lo
>>      In file included from chpass_c.c:34:
>>      kadm5_locl.h:78:23: error: kadm5_err.h: No such file or directory
>>
>> The file 'kadm5_err.h' is a generated header which is being requested
>> before being generated.
>>
>> Fixes:
>>
>>
>> http://autobuild.buildroot.net/results/3a4/3a42c5b294a9a8602844ed1127ec5eadb60a6bed/
>>
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Hi Vicente.
> That's harsh, specially since it seems to be a tiny breakage that's
> already fixed upstream via:
> http://repo.or.cz/w/heimdal.git/commitdiff/6affa4c
> Care to redo it in a "fixing" way? :)
> Regards.
>
