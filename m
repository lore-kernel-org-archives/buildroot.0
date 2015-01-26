From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 13:07:54 -0300
Subject: [Buildroot] pppd makefile moves /etc/PPP/resolv.conf
In-Reply-To: <229B9DED-2639-4EE5-91DC-242BA40B3239@nowonline.co.uk>
References: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
 <54C61802.4010602@zacarias.com.ar>
 <9F494D13-32F4-497C-A834-C60AA93406E9@nowonline.co.uk>
 <54C64A9B.5050602@zacarias.com.ar>
 <229B9DED-2639-4EE5-91DC-242BA40B3239@nowonline.co.uk>
Message-ID: <54C6665A.1020807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/26/2015 12:52 PM, Lee Essen wrote:
> Yep, that would work ok, but the below feels nicer to me and doesn?t
> require extra scripts, plus it?s something that could probably be
> suggested upstream ? the default behaviour is entirely unchanged
> (providing you keep the path change that?s there currently) so
> everything should work as is unless you add the config option.

If upstream is fine with that so are we.
Normally we don't take feature patches, hence if upstream rejects it
then it must be the other solution (script it).
Bear in mind that when adding support for openresolv we must script it
anyway since it's not supposed to get anything written into
/etc/resolv.conf except for itself (via the resolvconf tool, which is
also fed the DNS entries for each interface).
Regards.
