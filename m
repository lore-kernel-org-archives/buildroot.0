From: Wade Berrier <wberrier@gmail.com>
Date: Thu, 1 Jan 2009 07:40:47 -0700
Subject: [Buildroot] shell issues when /bin/sh is 'dash' instead of
	'bash'
In-Reply-To: <20090101023620.GA13399@cloud.net.au>
References: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
	<20090101023620.GA13399@cloud.net.au>
Message-ID: <bbbeeccd0901010640h6bb648fbi42ede94784462131@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 31, 2008 at 7:36 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Wed, Dec 31, 2008 at 04:04:37PM -0700, Wade Berrier wrote:
>> The result is that some files don't get installed into the target
>> system when /bin/sh points to dash (like on recent ubuntu and debian?
>> distros)
>>
>> Attached is a patch to use CONFIG_SHELL.
>
> Why aren't we setting SHELL=$(CONFIG_SHELL) somewhere, rather than using
> $(CONFIG_SHELL) explicitly in each place? (And why do I have the feeling
> we've had this discussion before?)

Yes, I think this has been discussed before...

>
>> Question: is this the best way to fix this?  Or maybe these packages
>> should be fixed more in the style of how Jacmet fixed grep? (see
>> http://sources.uclibc.org/index.py/trunk/buildroot/package/grep/grep.mk?r1=22930&r2=22931
>> )
>
> dash(1) on my system says -ot is supported anyway. If not perhaps it can
> be expressed in a better way; I think that would be better than this
> fix.

dash supports '-ot', but it doesn't have the same behavior as bash
when one of the files is missing.  I tend to agree... it could
probably be expressed in a better way.

>
> Besides is CONFIG_SHELL guaranteed to be bash anyway?

It will prefer bash, but will fall back on /bin/sh, which could be dash.

>
>
>
> Happy new year.

You too!

Wade
