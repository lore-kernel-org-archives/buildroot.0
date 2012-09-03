From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Mon, 03 Sep 2012 22:53:52 +0300
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <20120903210830.71b3372b@skate>
References: <5044FD5F.102@petroprogram.com> <20120903210830.71b3372b@skate>
Message-ID: <50450AD0.3060703@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.9.2012 22:08, Thomas Petazzoni kirjoitti:
> Le Mon, 03 Sep 2012 21:56:31 +0300,
> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>
>> But how to do similar in buildroot  .mk files ???
> 	$(notdir $(FOO))
>
> Thomas

One more question:

Why does not the following work ?

FULL_DOWNLOAD_URL=http://www.somedomain.com/blah/blah/somefile1
FULL_DOWNLOAD_URL+=http://www.somedomain2.com/blah2/blah2/blah/somefile2

for i in $(FULL_DOWNLOAD_URL);do \
    echo $(notdir $$i) ; \
done

I expect it to print:

somefile1
somefile2

But it prints instead:

http://www.somedomain.com/blah/blah/somefile1
http://www.somedomain2.com/blah2/blah2/blah/somefile2

Stefan
