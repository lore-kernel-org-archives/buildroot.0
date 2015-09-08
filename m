From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 8 Sep 2015 10:49:56 -0300
Subject: [Buildroot] [PATCH] check: new package
In-Reply-To: <55EDE533.30103@mind.be>
References: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA1DE.4020904@mind.be> <55EDBB68.9020907@free-electrons.com>
 <55EDE533.30103@mind.be>
Message-ID: <55EEE784.5090608@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 16:27, Arnout Vandecappelle wrote:

>> Some people may use checkmk which is a host tool, which i remove for the target
>> (probably needs full gawk instead of busybox awk, and not very useful in the
>> target IMO).
>
>   I fully agree on removing checkmk on the target. I can also see that you'd want
> it on the host, but the user has no way to select it since there is no
> Config.in.host... So the user would have to do an explicit 'make host-check' to
> get it. It also won't be tested in the autobuilders.
>
>   So in principle, we only have host packages that are dependencies of other
> packages or that have a Config.in.host entry. An exception is when there is
> another package that uses it but that has not yet been accepted. Probably the
> reverse also exists: a host dependency that is no longer needed but the host
> package still exists.
>
>   Thomas recently proposed to violate this principle in the context of the
> python-colorama package [1], to which I replied no [2]. But of course that's
> still open for discussion.

Hi Arnout.
I don't have any particular use for the host variant, so no plan on 
arguing too much for it.
I'll spin v2 unless someone objects the other way around with a valid 
argument.
Regards.
