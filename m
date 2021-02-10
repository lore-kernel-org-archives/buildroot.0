From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 09:57:45 +0100
Subject: [Buildroot] [PATCH] package/python-bottle: security bump to
 version 0.12.19
In-Reply-To: <20210202153319.11644-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Feb 2021 16:33:19 +0100")
References: <20210202153319.11644-1-peter@korsgaard.com>
Message-ID: <878s7wpaeu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2020-28473: The package bottle from 0 and before 0.12.19 are vulnerable
 > to Web Cache Poisoning by using a vector called parameter cloaking.  When
 > the attacker can separate query parameters using a semicolon (;), they can
 > cause a difference in the interpretation of the request between the proxy
 > (running with default configuration) and the server.  This can result in
 > malicious requests being cached as completely safe ones, as the proxy would
 > usually not see the semicolon as a separator, and therefore would not
 > include it in a cache key of an unkeyed parameter.

 > In addition, bottle 0.12.18 fixed a compatibility issue with python 3.8+:

 > https://github.com/bottlepy/bottle/issues/1181

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
