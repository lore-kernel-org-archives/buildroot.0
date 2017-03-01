From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Wed, 1 Mar 2017 12:09:28 +0100
Subject: [Buildroot] test-pkg script can't handle captive portals. etc.
In-Reply-To: <401e8b88-6d8b-5dea-65c1-dfb0d53cf1ed@mind.be>
References: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
 <401e8b88-6d8b-5dea-65c1-dfb0d53cf1ed@mind.be>
Message-ID: <748b2ae6-6357-f7da-5b2d-6a102916c4bb@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On 01.03.2017 09:46, Arnout Vandecappelle wrote:
> 
> 
> On 28-02-17 21:30, Marcus Hoffmann wrote:
>> Hey,
>>
>> I just ran into an issue with the test-pkg script.
>> When the TOOLCHAINS_URL returns an unexpected result,
>> (A router login page, when the Internet got disconnected, a captive
>> portal login page, a MITM attack, etc.) the script does weird things and
>> outputs something like this:
>>
>>     html>: FAILED
>> <!DOCTYPE: FAILED
>>      HTML: FAILED
>>      HTML: ^[ORFAILED
>>      EN">:
>> [...]
>>
>> It also creates the corresponding folders inside the test-dir.
>>
>> You can test this when pointing the TOOLCHAINS_URL var to any html page.
>>
>> This it not a very nice way to fail and may lead to harm when parsing
>> untrusted input from the web.
>>
>> What would be the best way to handle this case? Can the Toolchain URL be
>> switched to https? This would eliminate the problem.
> 
>  I don't think a.b.o has https at the moment, though I guess it would be easy to
> add a Let's Encrypt certificate.
> 
>  Still, a captive portal with an accepted certificate could still play tricks.

But it wouldn't be valid for the buildroot url, so I don't think it can(?).

> It's probably better to validate the result.
> 
>  However, I think it would be much nicer if we could just have the toolchain
> defconfigs inside of Buildroot instead of using this CSV file.

I don't know how often they change, but if this makes sense this would
be a good solution I think.

> 
> 
>> Otherwise we should do some sanity checking that no stray html page is
>> returned by the curl call. But this still doesn't solve the problem of a
>> malicious actor.
> 
>  I don't think a malicious actor is really something we should worry about here,
> is it?

Probably not terribly so. But if we can easily solve such problems (have
them locally or pull over https) we should!

> 
>  Regards,
>  Arnout
> 
> 
