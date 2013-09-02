From: Michael Rommel <rommel@layer-7.net>
Date: Mon, 02 Sep 2013 09:34:17 +0200
Subject: [Buildroot] [PATCH 1/1] pyzmq: new package
In-Reply-To: <52242ABB.9060701@mind.be>
References: <1377899924-1866-1-git-send-email-rommel@layer-7.net>
 <52242ABB.9060701@mind.be>
Message-ID: <3d980b9a4dc588d5be5163847a0fd457@imap.tschaeche.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi Arnout,

I'll test that again today in the evening. IIRC "make savedefconfig"
complained
about a cyclic dependency, but I need to check that again. Thanks for
pointing
that out!

  Michael.

On Mon, 02 Sep 2013 08:05:47 +0200, Arnout Vandecappelle
<arnout@mind.be> wrote:
> On 08/30/13 23:58, Michael Rommel wrote:
> [snip]
>> diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
>> new file mode 100644
>> index 0000000..d9791c1
>> --- /dev/null
>> +++ b/package/python-pyzmq/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_PYZMQ
>> +	bool "pyzmq"
>> +	select BR2_PACKAGE_ZEROMQ
>> +        select BR2_PACKAGE_PYTHON
> 
>  For python packages, we use a 'depends on' here rather than a select.
> 
> 
>  Regards,
>  Arnout
> 
>> +	depends on BR2_USE_WCHAR
>> +	depends on BR2_USE_MMU
> [snip]

-- 
Michael Rommel, Erlangen, Germany
