From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 21:27:47 +0200
Subject: [Buildroot] [PATCH] check: new package
In-Reply-To: <55EDBB68.9020907@free-electrons.com>
References: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA1DE.4020904@mind.be> <55EDBB68.9020907@free-electrons.com>
Message-ID: <55EDE533.30103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 18:29, Gustavo Zacarias wrote:
> On 07/09/15 11:40, Arnout Vandecappelle wrote:
> 
>>> +# From http://sourceforge.net/projects/check/files/check/0.10.0/
>>> +md5    53c5e5c77d090e103a17f3ed7fd7d8b8    check-0.10.0.tar.gz
>>> +sha1    35d3a53446aea7b21a770faedb358d0fc7cba76d    check-0.10.0.tar.gz
>>
>>   Don't we usually add a locally calculated sha256 if only sha1 is available
>> upstream? (Honest question, I don't remember.)
> 
> Hi Arnout.
> We normally consider md5 weak (docs), sha1 is so-so but we don't (yet) consider
> it too weak.
> For sourceforge they normally provide md5 and sha1, given than an intersection
> of hashes is harder to crack than any single one alone it's good to add md5 - as
> long as there's another better one backing it up as well.

 OK, thanks for the reminder.

> 
>>   Why do we need a host package?
> 
> Some people may use checkmk which is a host tool, which i remove for the target
> (probably needs full gawk instead of busybox awk, and not very useful in the
> target IMO).

 I fully agree on removing checkmk on the target. I can also see that you'd want
it on the host, but the user has no way to select it since there is no
Config.in.host... So the user would have to do an explicit 'make host-check' to
get it. It also won't be tested in the autobuilders.

 So in principle, we only have host packages that are dependencies of other
packages or that have a Config.in.host entry. An exception is when there is
another package that uses it but that has not yet been accepted. Probably the
reverse also exists: a host dependency that is no longer needed but the host
package still exists.

 Thomas recently proposed to violate this principle in the context of the
python-colorama package [1], to which I replied no [2]. But of course that's
still open for discussion.


 Regards,
 Arnout

[1] http://lists.busybox.net/pipermail/buildroot/2015-August/135344.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-September/138893.html

> Regards.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
