From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 10:01:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/at: updated version from
 3.1.13 to 3.1.16
In-Reply-To: <6141234.WAqyL1Ty6r@deathstar>
References: <11269096.cxoRZRC0e7@deathstar> <55EDE328.5020802@mind.be>
 <6141234.WAqyL1Ty6r@deathstar>
Message-ID: <55EE95EC.90300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francesco,

 Please keep the list in CC.

 [Note to list: I snipped away some of Francesco's feedback.]

On 08-09-15 09:24, Francesco Nwokeka wrote:
> Hi Arnout,
> 
> 
> On Monday 07 September 2015 21:19:04 Arnout Vandecappelle wrote:
>>  Hi Francesco,
>>
>>  First of all, please use git send-email to send patches, like you did
>> previously. The patch below is whitespace-corrupted and doesn't apply. Much
>> as I like KMail, it's not suitable for sending patches.
> 
> The patch is too big to send via git-sendmail and i get an error like the  
> following when trying to do so:
> 
> "Net::SMTP::SSL: Net::Cmd::datasend(): unexpected EOF on command channel: 
>  at /usr/lib/git-core/git-send-email line 1320. 
> [Net::SMTP::SSL] Connection closed at /usr/lib/git-core/git-send-email 
> line 1320. "
> 
> Here[1] they state that the patch is too big and apply a temporary fix by 
> modifying the code @ /usr/lib/git-core/git-send-email (but I'd prefer to avoid 
> doing that). I'm still searching for a possible fix.

 Wow, so perl introduced a limit of 16KB on e-mail? Great move...

I believe you can configure kmail to not do any line splitting. If you do that,
sending with kmail should be OK.

Alternatively, you can use python-smtp to send mail. But that will be a bit more
work to set up...

> 
> 
> [1]http://git.661346.n2.nabble.com/git-send-email-Connection-Closed-td7635648.html
> 
>> On 07-09-15 15:05, Francesco Nwokeka wrote:
[snip]
>>> -+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 -s 
> at
>>> $(DESTDIR)$(bindir)
>>
>>  This change is unrelated and actually belongs to patch 0005 (where it was
>> originally).
> 
> Patch 0005 doesn't exist. It's all in one now. 

 No, you renamed patch 0005 to patch 0002, and according to its comment it still
does make install for non-root and avoid stripping.

 Of course, if you remove patch 0004 (which became 0001) then all this becomes
irrelevant, because you _have_ to do those changes in patch 0005 (which will
become 0001 then).


> What's wrong with these parts 
> of the patch?

 The patch is doing things that are not explained in its comment.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
