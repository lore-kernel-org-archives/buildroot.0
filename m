From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 20 Mar 2019 13:25:49 -0300 (BRT)
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
 <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
Message-ID: <1085153408.3357867.1553099149887.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Peter Korsgaard" <peter@korsgaard.com>, "Esben Haabendal" <esben.haabendal@gmail.com>
> Cc: "Esben Haabendal" <esben@haabendal.dk>, "buildroot" <buildroot@buildroot.org>
> Sent: Ter?a-feira, 19 de mar?o de 2019 21:23:42
> Subject: Re: [Buildroot] [RFC] openssh: add option to allow login as root

> On 19/03/2019 23:42, Peter Korsgaard wrote:
>>>>>>> "Esben" == Esben Haabendal <esben.haabendal@gmail.com> writes:
>> 
>>  > From: Esben Haabendal <esben@haabendal.dk>
>>  > What do you think. Is this kind of micro-management of a configuration
>>  > file something that I should keep out of tree?
>> 
>> We discussed it tonight on IRC and didn't really get to a good compromise.
>> 
>> On one hand, we prefer to stick with upstream defaults (especially when
>> security is involved)
> 
> This patch doesn't change the defaults.
> 
>> , but it is true that dropbear allows root logins
>> by default.
> 
> It's not nice that the default for dropbear and ssh is different, but that has
> little to do with deciding if this kind of configurability is relevant or not.
> 
>> We prefer to not add configuration options for these kind of
>> detailed policy decisions,
> 
> *That* is the crux of the matter. We normally only have configurability of
> compile-time options, and assume that anything else is handled in post-build
> scripts. The (only?) exception to that principle is the system menu.
> 
> So *maybe* something global in the system menu could work, and then dropbear
> and openssh and whatnot would do whatever is needed to permit/disallow root
> login for that particular package. But I'm not exactly ecstatic about that
> option.

A global option to allow login as root via SSH regardless which ssh server is
chosen looks like a nice feature to me.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
