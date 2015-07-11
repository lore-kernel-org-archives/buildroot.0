From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 15:17:14 +0200
Subject: [Buildroot] [PATCH] qpid-proton: new package
In-Reply-To: <55A04632.4050508@mind.be>
References: <1436544600-18532-1-git-send-email-luca@lucaceresoli.net>
 <55A04632.4050508@mind.be>
Message-ID: <55A1175A.2080401@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 07/10/15 18:10, Luca Ceresoli wrote:
>> Note: the tarball is buggy, as is contains two leading components instead of
>> one, the first being a dummy ".":
>>
>>    $ tar taf ~/src/qpid-proton-0.9.1.tar.gz
>>    ./
>>    ./qpid-proton-0.9.1-rc1/
>>    ./qpid-proton-0.9.1-rc1/version.txt
>
>   Would it make sense to add an <PKG>_STRIP_COMPONENTS variable to handle this
> case? There are a few other packages that have this problem.

Indeed! Four packages have the opposite problem and need to force
--strip-components=0: intel-microcode, nanocom, tzdata and zic.

Thus, yes, it makes sense. I'll have a look.

-- 
Luca
