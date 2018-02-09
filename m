From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Feb 2018 18:10:23 +0100
Subject: [Buildroot] [PATCH v2] ejabberd: Bump to version 17.11
In-Reply-To: <CAJtjsKZ4cDXe6WjMYb95hA_VJ51xwtX7YyyK7Q7S3i_EjsWrCQ@mail.gmail.com>
References: <20180119162931.27721-1-johan.oudinet@gmail.com>
 <20180129222937.31264d2d@windsurf.lan>
 <CAJtjsKZ6dGEwjh-UhQPSsKdX+kwAcvQOUw2fExJ7hVkP_wbVQA@mail.gmail.com>
 <89231559-4423-6520-8d39-afe3fab0d5dc@mind.be>
 <CAJtjsKZ4cDXe6WjMYb95hA_VJ51xwtX7YyyK7Q7S3i_EjsWrCQ@mail.gmail.com>
Message-ID: <3a067f05-45ae-5ed7-d708-8d29419bad6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-02-18 17:05, Johan Oudinet wrote:
> Hi Arnout,
> 
> On Thu, Feb 8, 2018 at 6:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Originally, this was done with $(shell ....) so it would have worked. Two years
>> ago, in commit 7d69a79624b1f (signed off by yours truly) all the $(shell ...)
>> constructs were replaced with backticks `` and it stopped working. So it just
>> means all those variables would have been empty (the error messages would have
>> been visible on stderr but nobody looks at them). And I guess that the libraries
>> are just in default locations so it still works even if the lib_dir variables
>> are empty.
> 
> Thanks for the explanation. Indeed, commit 7d69a79624 changed $(shell
> ...) to backticks and introduces this bug two years ago :-/
> As you said, this was only visible on stderr and I notice it when
> bumping ejabberd to 17.11 only.
> 
>>  To be honest, I find the solution of copying the script a bit fragile. It would
>> be safer to just prepend $TOPDIR to the path so it is absolute.
> 
> Great, I was not aware of $TOPDIR. I looked for something like
> PACKAGE_DIR but failed to find a solution and finally resigned to copy
> this script to $(@D).

 Right, I forgot about that one! EJABBERD_PKGDIR would work as well. Hm, except,
no, it's actually not an absolute path so that won't work. Pity.

 Regards,
 Arnout

> I'll send a small patch to remove this unnecessary copy and use $TOPDIR instead.
> Thanks.
> 
> Best,
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
