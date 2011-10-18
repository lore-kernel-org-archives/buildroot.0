From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 13:00:28 -0300
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <201110181055.22743.minimod@morethan.org>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018163202.504d5069@skate> <201110181055.22743.minimod@morethan.org>
Message-ID: <6f1dea83ae8cd19b1f8304fee05d45d4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.10.2011 12:55, Michael S. Zick wrote:

> On Tue October 18 2011, Thomas Petazzoni wrote:
>> Le Tue, 18 Oct 2011 11:14:54 -0300,
>> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>>
>> > +	if test -n "$(3)" ; then \
>> > +		case "$($(PKG)_SITE_METHOD)" in \
>> > +			git) exit ;; \
>> > +			svn) exit ;; \
>> > +			bzr) exit ;; \
>> > +			file) exit ;; \
>>
>
> How about just a nop?
> s/exit/:/
>
> Mike

Yes that's a solution.
I'm also looking into using multiple PKG_SITE definitions as Thomas 
suggested, however it's a bit more complicated since i've got to pull 
out the PKG_SITE_METHOD eval from GENTARGETS_INNER since we could have 
multiple methods for different mirrors.
That means looking that things don't break by doing so.
Also contemplating how to properly do PKG_SIZE (for file size) and 
PKG_HASH (MD5 and/or SHA1) for source consistency.
Regards.
