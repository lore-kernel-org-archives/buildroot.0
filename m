From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 09:46:28 +0100
Subject: [Buildroot] test-pkg script can't handle captive portals. etc.
In-Reply-To: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
References: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
Message-ID: <401e8b88-6d8b-5dea-65c1-dfb0d53cf1ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-17 21:30, Marcus Hoffmann wrote:
> Hey,
> 
> I just ran into an issue with the test-pkg script.
> When the TOOLCHAINS_URL returns an unexpected result,
> (A router login page, when the Internet got disconnected, a captive
> portal login page, a MITM attack, etc.) the script does weird things and
> outputs something like this:
> 
>     html>: FAILED
> <!DOCTYPE: FAILED
>      HTML: FAILED
>      HTML: ^[ORFAILED
>      EN">:
> [...]
> 
> It also creates the corresponding folders inside the test-dir.
> 
> You can test this when pointing the TOOLCHAINS_URL var to any html page.
> 
> This it not a very nice way to fail and may lead to harm when parsing
> untrusted input from the web.
> 
> What would be the best way to handle this case? Can the Toolchain URL be
> switched to https? This would eliminate the problem.

 I don't think a.b.o has https at the moment, though I guess it would be easy to
add a Let's Encrypt certificate.

 Still, a captive portal with an accepted certificate could still play tricks.
It's probably better to validate the result.

 However, I think it would be much nicer if we could just have the toolchain
defconfigs inside of Buildroot instead of using this CSV file.


> Otherwise we should do some sanity checking that no stray html page is
> returned by the curl call. But this still doesn't solve the problem of a
> malicious actor.

 I don't think a malicious actor is really something we should worry about here,
is it?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
