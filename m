From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 Mar 2021 11:20:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/qpid-proton: needs threads
In-Reply-To: <CAPi7W83tgTSz6k_94yH4yV5kKeypoRxXwHK95m0v4jixVXbJsQ@mail.gmail.com>
References: <20210329101810.793099-1-luca@lucaceresoli.net>
 <CAPi7W83tgTSz6k_94yH4yV5kKeypoRxXwHK95m0v4jixVXbJsQ@mail.gmail.com>
Message-ID: <826d5767-10f7-8369-e18a-de177532d685@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 29/03/21 12:57, Fabrice Fontaine wrote:
> Dear Luca,
> 
> Le lun. 29 mars 2021 ? 12:18, Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>>
>> qpid-proton needs threads since commit d4c0fde91da0 ("package/qpid-proton:
>> bump to version 0.33.0"), otherwise it fails with:
>>
>>   /home/buildroot/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:37:10: fatal error: pthread.h: No such file or directory
>>      37 | #include <pthread.h>
>>         |          ^~~~~~~~~~~
>>   compilation terminated.
> Thanks for taking care of this build failure, another option would be
> to explicitly set PROACTOR to none.

I guess you're right, it's good if you can have a better fix! Frankly, I
checked quite quickly across the code and didn't find a simple way to do
a better fix, but I don't know much of this package as I'm not using it.

This applies to both patches. Marked them as "Changes requested" in
patchwork.

-- 
Luca
