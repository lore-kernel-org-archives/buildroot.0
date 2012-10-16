From: Valentine Barshak <gvaxon@gmail.com>
Date: Tue, 16 Oct 2012 21:36:35 +0400
Subject: [Buildroot] [PATCH v2] Add target to create a project directory
In-Reply-To: <507AB508.2000503@mind.be>
References: <20121013231443.17317.60675.stgit@localhost>
 <20121013232039.19428.5883.stgit@localhost> <5079FAAC.3070803@gmail.com>
 <507AB508.2000503@mind.be>
Message-ID: <507D9B23.7030405@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2012 04:50 PM, Arnout Vandecappelle wrote:
> On 14/10/12 01:35, Valentine Barshak wrote:
>>> +$(BUILDROOT_DIR):
>>> +    mkdir -p $@
>>> +    wget -O - $(BUILDROOT_SITE)/$(BUILDROOT_SOURCE) | \
>>> +        tar -xjf - -C $@ --strip-components=1
>>> +    for p in `ls $(makedir)/patches/buildroot/buildroot-*
>>> 2>/dev/null`; do \
>>> +        patch -d $@ -p1 -i $$p; \
>>> +    done
>>
>> I probably miss something, but
>> do I have to download buldroot for every project?
>> Can I use my local BR git tree as a buildroot source for my projects
>> instead of downloading?
>
>   No, make a symlink to the BR tree and it won't download anything.
>
>   But this automatic download feature is probably going a bridge too far
> :-)

Thanks,
probably symlinking should be done by default instead of downloading?
I'd assume that when someone does make projectdir from the BR directory,
they'd expect this particular BR do be used as the source for the new 
project.

In case of downloading, it's possible to download/copy current BR to 
another location manually (without projectdir) and build there.

Are there any obvious differences compared to using projectdir in this case?

What benefits does it give?

Thanks,
Val.
>
>   Regards,
>   Arnout
>
