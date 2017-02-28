From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Tue, 28 Feb 2017 21:30:29 +0100
Subject: [Buildroot] test-pkg script can't handle captive portals. etc.
Message-ID: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I just ran into an issue with the test-pkg script.
When the TOOLCHAINS_URL returns an unexpected result,
(A router login page, when the Internet got disconnected, a captive
portal login page, a MITM attack, etc.) the script does weird things and
outputs something like this:

    html>: FAILED
<!DOCTYPE: FAILED
     HTML: FAILED
     HTML: ^[ORFAILED
     EN">:
[...]

It also creates the corresponding folders inside the test-dir.

You can test this when pointing the TOOLCHAINS_URL var to any html page.

This it not a very nice way to fail and may lead to harm when parsing
untrusted input from the web.

What would be the best way to handle this case? Can the Toolchain URL be
switched to https? This would eliminate the problem.

Otherwise we should do some sanity checking that no stray html page is
returned by the curl call. But this still doesn't solve the problem of a
malicious actor.

Best wishes,
Marcus
