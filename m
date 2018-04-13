From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 13 Apr 2018 15:23:13 -0300
Subject: [Buildroot] [RFC PATCH 1/3] download/git: fix fetch all refs
 for old git
References: <20180412174237.GE4221@scaer>
Message-ID: <5ad0f591ed5a9_19072aca94e3dabc58762@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for your review of the series.

On Thu, Apr 12, 2018 at 02:42 PM, Yann E. MORIN wrote:

>> -    _git fetch origin -t
>> +    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
> 
> Why don't we just run:
> 
>     git fetch origin
>     git fetch origin -t

One extra connection to the server ...
but much more readable/maintainable!
I will do. I will change this patch to Changes Requested.

> As I understand it:
> 
>                     ancient git         | new git
> --------------------------------------------------------------------
> git fetch     | fetch all refs but tags | fetches all refs but tags
> git fetch -t  | fetches only tags       | fetch all refs and tags
> 
> Right?

Yes.
Nit: actually 'git fetch' does fetch some tags, but not necessarily all. Only
tags in commits also reachable by branches are fetched.


Regards,
Ricardo
