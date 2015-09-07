From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 7 Sep 2015 13:29:28 -0300
Subject: [Buildroot] [PATCH] check: new package
In-Reply-To: <55EDA1DE.4020904@mind.be>
References: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA1DE.4020904@mind.be>
Message-ID: <55EDBB68.9020907@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 11:40, Arnout Vandecappelle wrote:

>> +# From http://sourceforge.net/projects/check/files/check/0.10.0/
>> +md5	53c5e5c77d090e103a17f3ed7fd7d8b8	check-0.10.0.tar.gz
>> +sha1	35d3a53446aea7b21a770faedb358d0fc7cba76d	check-0.10.0.tar.gz
>
>   Don't we usually add a locally calculated sha256 if only sha1 is available
> upstream? (Honest question, I don't remember.)

Hi Arnout.
We normally consider md5 weak (docs), sha1 is so-so but we don't (yet) 
consider it too weak.
For sourceforge they normally provide md5 and sha1, given than an 
intersection of hashes is harder to crack than any single one alone it's 
good to add md5 - as long as there's another better one backing it up as 
well.

>   Why do we need a host package?

Some people may use checkmk which is a host tool, which i remove for the 
target (probably needs full gawk instead of busybox awk, and not very 
useful in the target IMO).
Regards.
