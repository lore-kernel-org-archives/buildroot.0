From: Mason <slash.tmp@free.fr>
Date: Mon, 18 Apr 2016 22:03:26 +0200
Subject: [Buildroot] [PATCH v3] ltp-testsuite: build kernel modules when
 appropriate
In-Reply-To: <20160418214206.3698cd79@free-electrons.com>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com> <56F92840.9090206@free.fr>
 <56FAD38B.8040201@mind.be> <57026754.50205@free.fr> <57038409.20600@mind.be>
 <57039CF4.5060902@free.fr> <20160418214206.3698cd79@free-electrons.com>
Message-ID: <57153D8E.9030702@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/04/2016 21:42, Thomas Petazzoni wrote:

> Hello,
> 
> On Tue, 5 Apr 2016 13:09:40 +0200, Mason wrote:
> 
>> +ifeq ($(BR2_LINUX_KERNEL),y)
>> +LTP_TESTSUITE_DEPENDENCIES += linux
>> +LTP_TESTSUITE_MAKE_ENV = $(LINUX_MAKE_FLAGS)
> 
> This should use += instead of = since we're in a conditional block.
> While this is not needed right now, it is a bit more logical and future
> proof.
> 
> Applied with this fixed!
> 
> Thomas

Thanks!
